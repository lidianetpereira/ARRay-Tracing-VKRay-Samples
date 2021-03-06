/* Copyright (c) 2014-2018, NVIDIA CORPORATION. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *  * Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *  * Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *  * Neither the name of NVIDIA CORPORATION nor the names of its
 *    contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS ``AS IS'' AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
 * OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <sstream>
#include <vulkan/vulkan.hpp>

extern std::vector<std::string> defaultSearchPaths;

#define VMA_IMPLEMENTATION


#define STB_IMAGE_IMPLEMENTATION
#include "fileformats/stb_image.h"
#include "obj_loader.h"

#include "hello_vulkan.h"
#include "nvh//cameramanipulator.hpp"
#include "nvvk/descriptorsets_vk.hpp"
#include "nvvk/pipeline_vk.hpp"

#include "nvh/fileoperations.hpp"
#include "nvvk/commands_vk.hpp"
#include "nvvk/renderpasses_vk.hpp"


// Holding the camera matrices
struct CameraMatrices
{
  nvmath::mat4f view;
  nvmath::mat4f proj;
  nvmath::mat4f viewInverse;
  // #VKRay
  nvmath::mat4f projInverse;
};

//--------------------------------------------------------------------------------------------------
// Keep the handle on the device
// Initialize the tool to do all our allocations: buffers, images
//
void HelloVulkan::setup(const vk::Instance&       instance,
                        const vk::Device&         device,
                        const vk::PhysicalDevice& physicalDevice,
                        uint32_t                  queueFamily)
{
  AppBase::setup(instance, device, physicalDevice, queueFamily);

  m_offscreen.m_dmaAllocGL.init(device, physicalDevice);
  m_offscreen.m_allocGL.init(device, physicalDevice, &m_offscreen.m_dmaAllocGL);

#if defined(NVVK_ALLOC_DEDICATED)
  m_alloc.init(device, physicalDevice);
#elif defined(NVVK_ALLOC_DMA)
  m_memAllocator.init(device, physicalDevice);
  m_alloc.init(device, physicalDevice, &m_memAllocator);
#elif defined(NVVK_ALLOC_VMA)
  VmaAllocatorCreateInfo allocatorInfo = {};
  allocatorInfo.physicalDevice         = physicalDevice;
  allocatorInfo.device                 = device;
  allocatorInfo.instance               = instance;
  vmaCreateAllocator(&allocatorInfo, &m_memAllocator);
  m_alloc.init(device, physicalDevice, m_memAllocator);
#endif

  m_debug.setup(m_device);


  m_offscreen.setup(device, &m_alloc, queueFamily);
  m_raytrace.setup(device, physicalDevice, &m_alloc, queueFamily);
}

//--------------------------------------------------------------------------------------------------
// Called at each frame to update the camera matrix
//
void HelloVulkan::updateUniformBuffer()
{
  const float aspectRatio = m_size.width / static_cast<float>(m_size.height);

  CameraMatrices ubo = {};
  ubo.view           = CameraManip.getMatrix();
  ubo.proj           = nvmath::perspectiveVK(CameraManip.getFov(), aspectRatio, 0.1f, 1000.0f);
  // ubo.proj[1][1] *= -1;  // Inverting Y for Vulkan
  ubo.viewInverse = nvmath::invert(ubo.view);
  // #VKRay
  ubo.projInverse = nvmath::invert(ubo.proj);

#if defined(NVVK_ALLOC_DEDICATED)
  void* data = m_device.mapMemory(m_cameraMat.allocation, 0, sizeof(CameraMatrices));
  memcpy(data, &ubo, sizeof(ubo));
  m_device.unmapMemory(m_cameraMat.allocation);
#elif defined(NVVK_ALLOC_DMA)
  void* data = m_memAllocator.map(m_cameraMat.allocation);
  memcpy(data, &ubo, sizeof(ubo));
  m_memAllocator.unmap(m_cameraMat.allocation);
#elif defined(NVVK_ALLOC_VMA)
  void* data;
  vmaMapMemory(m_memAllocator, m_cameraMat.allocation, &data);
  memcpy(data, &ubo, sizeof(ubo));
  vmaUnmapMemory(m_memAllocator, m_cameraMat.allocation);
#endif
}

//--------------------------------------------------------------------------------------------------
// Describing the layout pushed when rendering
//
void HelloVulkan::createDescriptorSetLayout()
{
  using vkDS     = vk::DescriptorSetLayoutBinding;
  using vkDT     = vk::DescriptorType;
  using vkSS     = vk::ShaderStageFlagBits;
  uint32_t nbTxt = static_cast<uint32_t>(m_textures.size());
  uint32_t nbObj = static_cast<uint32_t>(m_objModel.size());

  // Camera matrices (binding = 0)
  m_descSetLayoutBind.addBinding(vkDS(0, vkDT::eUniformBuffer, 1, vkSS::eVertex | vkSS::eRaygenNV));
  // Materials (binding = 1)
  m_descSetLayoutBind.addBinding(
      vkDS(1, vkDT::eStorageBuffer, nbObj + 1,  // Adding Implicit mat too
           vkSS::eVertex | vkSS::eFragment | vkSS::eClosestHitNV | vkSS::eAnyHitNV));
  // Scene description (binding = 2)
  m_descSetLayoutBind.addBinding(  //
      vkDS(2, vkDT::eStorageBuffer, 1,
           vkSS::eVertex | vkSS::eFragment | vkSS::eClosestHitNV | vkSS::eAnyHitNV));
  // Textures (binding = 3)
  m_descSetLayoutBind.addBinding(
      vkDS(3, vkDT::eCombinedImageSampler, nbTxt, vkSS::eFragment | vkSS::eClosestHitNV));
  // Materials (binding = 4)
  m_descSetLayoutBind.addBinding(vkDS(4, vkDT::eStorageBuffer, nbObj,
                                      vkSS::eFragment | vkSS::eClosestHitNV | vkSS::eAnyHitNV));
  // Storing vertices (binding = 5)
  m_descSetLayoutBind.addBinding(  //
      vkDS(5, vkDT::eStorageBuffer, nbObj, vkSS::eClosestHitNV | vkSS::eAnyHitNV));
  // Storing indices (binding = 6)
  m_descSetLayoutBind.addBinding(  //
      vkDS(6, vkDT::eStorageBuffer, nbObj, vkSS::eClosestHitNV | vkSS::eAnyHitNV));
  // Storing implicit obj (binding = 7)
  m_descSetLayoutBind.addBinding(  //
      vkDS(7, vkDT::eStorageBuffer, 1,
           vkSS::eClosestHitNV | vkSS::eIntersectionNV | vkSS::eAnyHitNV));


  m_descSetLayout = m_descSetLayoutBind.createLayout(m_device);
  m_descPool      = m_descSetLayoutBind.createPool(m_device, 1);
  m_descSet       = nvvk::allocateDescriptorSet(m_device, m_descPool, m_descSetLayout);
}

//--------------------------------------------------------------------------------------------------
// Setting up the buffers in the descriptor set
//
void HelloVulkan::updateDescriptorSet()
{
  std::vector<vk::WriteDescriptorSet> writes;

  // Camera matrices and scene description
  vk::DescriptorBufferInfo dbiUnif{m_cameraMat.buffer, 0, VK_WHOLE_SIZE};
  writes.emplace_back(m_descSetLayoutBind.makeWrite(m_descSet, 0, &dbiUnif));
  vk::DescriptorBufferInfo dbiSceneDesc{m_sceneDesc.buffer, 0, VK_WHOLE_SIZE};
  writes.emplace_back(m_descSetLayoutBind.makeWrite(m_descSet, 2, &dbiSceneDesc));

  // All material buffers, 1 buffer per OBJ
  std::vector<vk::DescriptorBufferInfo> dbiMat;
  std::vector<vk::DescriptorBufferInfo> dbiMatIdx;
  std::vector<vk::DescriptorBufferInfo> dbiVert;
  std::vector<vk::DescriptorBufferInfo> dbiIdx;
  for(auto& model : m_objModel)
  {
    dbiMat.emplace_back(model.matColorBuffer.buffer, 0, VK_WHOLE_SIZE);
    dbiMatIdx.emplace_back(model.matIndexBuffer.buffer, 0, VK_WHOLE_SIZE);
    dbiVert.emplace_back(model.vertexBuffer.buffer, 0, VK_WHOLE_SIZE);
    dbiIdx.emplace_back(model.indexBuffer.buffer, 0, VK_WHOLE_SIZE);
  }
  dbiMat.emplace_back(m_implObjects.implMatBuf.buffer, 0, VK_WHOLE_SIZE);  // Adding implicit mat
  writes.emplace_back(m_descSetLayoutBind.makeWriteArray(m_descSet, 1, dbiMat.data()));
  writes.emplace_back(m_descSetLayoutBind.makeWriteArray(m_descSet, 4, dbiMatIdx.data()));
  writes.emplace_back(m_descSetLayoutBind.makeWriteArray(m_descSet, 5, dbiVert.data()));
  writes.emplace_back(m_descSetLayoutBind.makeWriteArray(m_descSet, 6, dbiIdx.data()));

  // All texture samplers
  std::vector<vk::DescriptorImageInfo> diit;
  for(auto& texture : m_textures)
  {
    diit.push_back(texture.descriptor);
  }
  writes.emplace_back(m_descSetLayoutBind.makeWriteArray(m_descSet, 3, diit.data()));

  vk::DescriptorBufferInfo dbiImplDesc{m_implObjects.implBuf.buffer, 0, VK_WHOLE_SIZE};
  writes.emplace_back(m_descSetLayoutBind.makeWrite(m_descSet, 7, &dbiImplDesc));

  // Writing the information
  m_device.updateDescriptorSets(static_cast<uint32_t>(writes.size()), writes.data(), 0, nullptr);
}

//--------------------------------------------------------------------------------------------------
// Creating the pipeline layout
//
void HelloVulkan::createGraphicsPipeline()
{
  using vkSS = vk::ShaderStageFlagBits;

  vk::PushConstantRange pushConstantRanges = {vkSS::eVertex | vkSS::eFragment, 0,
                                              sizeof(ObjPushConstants)};

  // Creating the Pipeline Layout
  vk::PipelineLayoutCreateInfo pipelineLayoutCreateInfo;
  vk::DescriptorSetLayout      descSetLayout(m_descSetLayout);
  pipelineLayoutCreateInfo.setSetLayoutCount(1);
  pipelineLayoutCreateInfo.setPSetLayouts(&descSetLayout);
  pipelineLayoutCreateInfo.setPushConstantRangeCount(1);
  pipelineLayoutCreateInfo.setPPushConstantRanges(&pushConstantRanges);
  m_pipelineLayout = m_device.createPipelineLayout(pipelineLayoutCreateInfo);

  // Creating the Pipeline
  std::vector<std::string>                paths = defaultSearchPaths;
  nvvk::GraphicsPipelineGeneratorCombined gpb(m_device, m_pipelineLayout, m_offscreen.renderPass());
  gpb.depthStencilState.depthTestEnable = true;
  gpb.addShader(nvh::loadFile("shaders/vert_shader.vert.spv", true, paths), vkSS::eVertex);
  gpb.addShader(nvh::loadFile("shaders/frag_shader.frag.spv", true, paths), vkSS::eFragment);
  gpb.addBindingDescription({0, sizeof(VertexObj)});
  gpb.addAttributeDescriptions(std::vector<vk::VertexInputAttributeDescription>{
      {0, 0, vk::Format::eR32G32B32Sfloat, offsetof(VertexObj, pos)},
      {1, 0, vk::Format::eR32G32B32Sfloat, offsetof(VertexObj, nrm)},
      {2, 0, vk::Format::eR32G32B32Sfloat, offsetof(VertexObj, color)},
      {3, 0, vk::Format::eR32G32Sfloat, offsetof(VertexObj, texCoord)}});

  m_graphicsPipeline = gpb.createPipeline();
  m_debug.setObjectName(m_graphicsPipeline, "Graphics");
}

//--------------------------------------------------------------------------------------------------
// Loading the OBJ file and setting up all buffers
//
void HelloVulkan::loadModel(const std::string& filename, nvmath::mat4f transform)
{
  using vkBU = vk::BufferUsageFlagBits;

  ObjLoader loader;
  loader.loadModel(filename);

  // Converting from Srgb to linear
  for(auto& m : loader.m_materials)
  {
    m.ambient  = nvmath::pow(m.ambient, 2.2f);
    m.diffuse  = nvmath::pow(m.diffuse, 2.2f);
    m.specular = nvmath::pow(m.specular, 2.2f);
  }

  ObjInstance instance;
  instance.objIndex    = static_cast<uint32_t>(m_objModel.size());
  instance.transform   = transform;
  instance.transformIT = nvmath::transpose(nvmath::invert(transform));
  instance.txtOffset   = static_cast<uint32_t>(m_textures.size());

  ObjModel model;
  model.nbIndices  = static_cast<uint32_t>(loader.m_indices.size());
  model.nbVertices = static_cast<uint32_t>(loader.m_vertices.size());

  // Create the buffers on Device and copy vertices, indices and materials
  nvvk::CommandPool cmdBufGet(m_device, m_graphicsQueueIndex);
  vk::CommandBuffer cmdBuf = cmdBufGet.createCommandBuffer();
  model.vertexBuffer =
      m_alloc.createBuffer(cmdBuf, loader.m_vertices, vkBU::eVertexBuffer | vkBU::eStorageBuffer);
  model.indexBuffer =
      m_alloc.createBuffer(cmdBuf, loader.m_indices, vkBU::eIndexBuffer | vkBU::eStorageBuffer);
  model.matColorBuffer = m_alloc.createBuffer(cmdBuf, loader.m_materials, vkBU::eStorageBuffer);
  model.matIndexBuffer = m_alloc.createBuffer(cmdBuf, loader.m_matIndx, vkBU::eStorageBuffer);
  // Creates all textures found
  createTextureImages(cmdBuf, loader.m_textures);
  cmdBufGet.submitAndWait(cmdBuf);
  m_alloc.finalizeAndReleaseStaging();

  std::string objNb = std::to_string(instance.objIndex);
  m_debug.setObjectName(model.vertexBuffer.buffer, (std::string("vertex_" + objNb).c_str()));
  m_debug.setObjectName(model.indexBuffer.buffer, (std::string("index_" + objNb).c_str()));
  m_debug.setObjectName(model.matColorBuffer.buffer, (std::string("mat_" + objNb).c_str()));
  m_debug.setObjectName(model.matIndexBuffer.buffer, (std::string("matIdx_" + objNb).c_str()));

  m_objModel.emplace_back(model);
  m_objInstance.emplace_back(instance);
}

//--------------------------------------------------------------------------------------------------
// Creating the uniform buffer holding the camera matrices
// - Buffer is host visible
//
void HelloVulkan::createUniformBuffer()
{
  using vkBU = vk::BufferUsageFlagBits;
  using vkMP = vk::MemoryPropertyFlagBits;

  m_cameraMat = m_alloc.createBuffer(sizeof(CameraMatrices), vkBU::eUniformBuffer,
#ifndef NVVK_ALLOC_VMA
                                     vkMP::eHostVisible | vkMP::eHostCoherent);
#else
                                     VMA_MEMORY_USAGE_CPU_TO_GPU);
#endif  // !NVVK_ALLOC_VMA

  m_debug.setObjectName(m_cameraMat.buffer, "cameraMat");
}

//--------------------------------------------------------------------------------------------------
// Create a storage buffer containing the description of the scene elements
// - Which geometry is used by which instance
// - Transformation
// - Offset for texture
//
void HelloVulkan::createSceneDescriptionBuffer()
{
  using vkBU = vk::BufferUsageFlagBits;
  nvvk::CommandPool cmdGen(m_device, m_graphicsQueueIndex);

  auto cmdBuf = cmdGen.createCommandBuffer();
  m_sceneDesc = m_alloc.createBuffer(cmdBuf, m_objInstance, vkBU::eStorageBuffer);
  cmdGen.submitAndWait(cmdBuf);
  m_alloc.finalizeAndReleaseStaging();
  m_debug.setObjectName(m_sceneDesc.buffer, "sceneDesc");
}

//--------------------------------------------------------------------------------------------------
// Creating all textures and samplers
//
void HelloVulkan::createTextureImages(const vk::CommandBuffer&        cmdBuf,
                                      const std::vector<std::string>& textures)
{
  using vkIU = vk::ImageUsageFlagBits;

  vk::SamplerCreateInfo samplerCreateInfo{
      {}, vk::Filter::eLinear, vk::Filter::eLinear, vk::SamplerMipmapMode::eLinear};
  samplerCreateInfo.setMaxLod(FLT_MAX);
  vk::Format format = vk::Format::eR8G8B8A8Srgb;

  // If no textures are present, create a dummy one to accommodate the pipeline layout
  if(textures.empty() && m_textures.empty())
  {
    nvvk::Texture texture;

    std::array<uint8_t, 4> color{255u, 255u, 255u, 255u};
    vk::DeviceSize         bufferSize      = sizeof(color);
    auto                   imgSize         = vk::Extent2D(1, 1);
    auto                   imageCreateInfo = nvvk::makeImage2DCreateInfo(imgSize, format);

    // Creating the VKImage
    nvvk::Image image = m_alloc.createImage(cmdBuf, bufferSize, color.data(), imageCreateInfo);
    vk::ImageViewCreateInfo ivInfo = nvvk::makeImageViewCreateInfo(image.image, imageCreateInfo);
    texture                        = m_alloc.createTexture(image, ivInfo, samplerCreateInfo);

    // The image format must be in VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL
    nvvk::cmdBarrierImageLayout(cmdBuf, texture.image, vk::ImageLayout::eUndefined,
                                vk::ImageLayout::eShaderReadOnlyOptimal);
    m_textures.push_back(texture);
  }
  else
  {
    // Uploading all images
    for(const auto& texture : textures)
    {
      std::stringstream o;
      int               texWidth, texHeight, texChannels;
      o << "media/textures/" << texture;
      std::string txtFile = nvh::findFile(o.str(), defaultSearchPaths);

      stbi_uc* stbi_pixels = stbi_load(txtFile.c_str(), &texWidth, &texHeight, &texChannels, STBI_rgb_alpha);

      std::array<stbi_uc, 4> color{255u, 0u, 255u, 255u};

      stbi_uc* pixels = stbi_pixels;
      // Handle failure
      if(!stbi_pixels)
      {
        texWidth = texHeight = 1;
        texChannels          = 4;
        pixels               = reinterpret_cast<stbi_uc*>(color.data());
      }

      vk::DeviceSize bufferSize = static_cast<uint64_t>(texWidth) * texHeight * sizeof(uint8_t) * 4;
      auto           imgSize    = vk::Extent2D(texWidth, texHeight);
      auto imageCreateInfo = nvvk::makeImage2DCreateInfo(imgSize, format, vkIU::eSampled, true);

      {
        nvvk::Image image = m_alloc.createImage(cmdBuf, bufferSize, pixels, imageCreateInfo);
        nvvk::cmdGenerateMipmaps(cmdBuf, image.image, format, imgSize, imageCreateInfo.mipLevels);
        vk::ImageViewCreateInfo ivInfo =
            nvvk::makeImageViewCreateInfo(image.image, imageCreateInfo);
        nvvk::Texture texture = m_alloc.createTexture(image, ivInfo, samplerCreateInfo);

        m_textures.push_back(texture);
      }

      stbi_image_free(stbi_pixels);
    }
  }
}

//--------------------------------------------------------------------------------------------------
// Destroying all allocations
//
void HelloVulkan::destroyResources()
{
  m_device.destroy(m_graphicsPipeline);
  m_device.destroy(m_pipelineLayout);
  m_device.destroy(m_descPool);
  m_device.destroy(m_descSetLayout);
  m_alloc.destroy(m_cameraMat);
  m_alloc.destroy(m_sceneDesc);
  m_alloc.destroy(m_implObjects.implBuf);
  m_alloc.destroy(m_implObjects.implMatBuf);

  for(auto& m : m_objModel)
  {
    m_alloc.destroy(m.vertexBuffer);
    m_alloc.destroy(m.indexBuffer);
    m_alloc.destroy(m.matColorBuffer);
    m_alloc.destroy(m.matIndexBuffer);
  }

  for(auto& t : m_textures)
  {
    m_alloc.destroy(t);
  }

  //#Post
  m_offscreen.destroy();

  // #VKRay
  m_raytrace.destroy();

  m_alloc.deinit();
#ifdef NVVK_ALLOC_DMA
  m_memAllocator.deinit();
#elif defined(NVVK_ALLOC_VMA)
  vmaDestroyAllocator(m_memAllocator);
#endif
}

//--------------------------------------------------------------------------------------------------
// Drawing the scene in raster mode
//
void HelloVulkan::rasterize(const vk::CommandBuffer& cmdBuf)
{
  using vkPBP = vk::PipelineBindPoint;
  using vkSS  = vk::ShaderStageFlagBits;
  vk::DeviceSize offset{0};

  m_debug.beginLabel(cmdBuf, "Rasterize");

  // Dynamic Viewport
  cmdBuf.setViewport(0, {vk::Viewport(0, 0, (float)m_size.width, (float)m_size.height, 0, 1)});
  cmdBuf.setScissor(0, {{{0, 0}, {m_size.width, m_size.height}}});

  // Drawing all triangles
  cmdBuf.bindPipeline(vkPBP::eGraphics, m_graphicsPipeline);
  cmdBuf.bindDescriptorSets(vkPBP::eGraphics, m_pipelineLayout, 0, {m_descSet}, {});
  for(int i = 0; i < m_objInstance.size(); ++i)
  {
    auto& inst                 = m_objInstance[i];
    auto& model                = m_objModel[inst.objIndex];
    m_pushConstants.instanceId = i;  // Telling which instance is drawn
    cmdBuf.pushConstants<ObjPushConstants>(m_pipelineLayout, vkSS::eVertex | vkSS::eFragment, 0,
                                           m_pushConstants);

    cmdBuf.bindVertexBuffers(0, {model.vertexBuffer.buffer}, {offset});
    cmdBuf.bindIndexBuffer(model.indexBuffer.buffer, 0, vk::IndexType::eUint32);
    cmdBuf.drawIndexed(model.nbIndices, 1, 0, 0, 0);
  }
  m_debug.endLabel(cmdBuf);
}

//--------------------------------------------------------------------------------------------------
// Handling resize of the window
//
void HelloVulkan::onResize(int /*w*/, int /*h*/)
{
  m_offscreen.createFramebuffer(m_size);
  m_offscreen.updateDescriptorSet();
  m_raytrace.updateRtDescriptorSet(m_offscreen.m_rtOutputGL.texVk.descriptor.imageView);
}

//--------------------------------------------------------------------------------------------------
// Initialize offscreen rendering
//
void HelloVulkan::initOffscreen()
{
  m_offscreen.createFramebuffer(m_size);
//  m_offscreen.createDescriptor();
//  m_offscreen.createPipeline(m_renderPass);
//  m_offscreen.updateDescriptorSet();
}

//--------------------------------------------------------------------------------------------------
// Initialize Vulkan ray tracing
//
void HelloVulkan::initRayTracing()
{
  m_raytrace.createBottomLevelAS(m_objModel, m_implObjects);
  m_raytrace.createTopLevelAS(m_objInstance, m_implObjects);
  m_raytrace.createRtDescriptorSet(m_offscreen.m_rtOutputGL.texVk.descriptor.imageView);
  m_raytrace.createRtPipeline(m_descSetLayout);
  m_raytrace.createRtShaderBindingTable();
}

//--------------------------------------------------------------------------------------------------
// Ray trace the scene
//
void HelloVulkan::raytrace(const vk::CommandBuffer& cmdBuf, const nvmath::vec4f& clearColor)
{
  //updateFrame();
  if(m_pushConstants.frame >= m_maxFrames)
    return;

  m_raytrace.raytrace(cmdBuf, clearColor, m_descSet, m_size, m_pushConstants);
}

//--------------------------------------------------------------------------------------------------
// If the camera matrix has changed, resets the frame.
// otherwise, increments frame.
//
void HelloVulkan::updateFrame()
{
  static nvmath::mat4f refCamMatrix;

  auto& m = CameraManip.getMatrix();
  if(memcmp(&refCamMatrix.a00, &m.a00, sizeof(nvmath::mat4f)) != 0)
  {
    resetFrame();
    refCamMatrix = m;
  }
  m_pushConstants.frame++;
}

void HelloVulkan::resetFrame()
{
  m_pushConstants.frame = -1;
    m_frameNumber = 0;
}


void HelloVulkan::addImplSphere(nvmath::vec3f center, float radius, int matId)
{
  ObjImplicit impl;
  impl.minimum = center - radius;
  impl.maximum = center + radius;
  impl.objType = EObjType::eSphere;
  impl.matId   = matId;
  m_implObjects.objImpl.push_back(impl);
}

void HelloVulkan::addImplCube(nvmath::vec3f minumum, nvmath::vec3f maximum, int matId)
{
  ObjImplicit impl;
  impl.minimum = minumum;
  impl.maximum = maximum;
  impl.objType = EObjType::eCube;
  impl.matId   = matId;
  m_implObjects.objImpl.push_back(impl);
}

void HelloVulkan::addImplMaterial(const MaterialObj& mat)
{
  m_implObjects.implMat.push_back(mat);
}

//--------------------------------------------------------------------------------------------------
// Create a storage buffer containing the description of the scene elements
// - Which geometry is used by which instance
// - Transformation
// - Offset for texture
//
void HelloVulkan::createImplictBuffers()
{
  using vkBU = vk::BufferUsageFlagBits;
  nvvk::CommandPool cmdGen(m_device, m_graphicsQueueIndex);

  // Not allowing empty buffers
  if(m_implObjects.objImpl.empty())
    m_implObjects.objImpl.push_back({});
  if(m_implObjects.implMat.empty())
    m_implObjects.implMat.push_back({});

  auto cmdBuf           = cmdGen.createCommandBuffer();
  m_implObjects.implBuf = m_alloc.createBuffer(cmdBuf, m_implObjects.objImpl, vkBU::eStorageBuffer);
  m_implObjects.implMatBuf =
      m_alloc.createBuffer(cmdBuf, m_implObjects.implMat, vkBU::eStorageBuffer);
  cmdGen.submitAndWait(cmdBuf);
  m_alloc.finalizeAndReleaseStaging();
  m_debug.setObjectName(m_implObjects.implBuf.buffer, "implicitObj");
  m_debug.setObjectName(m_implObjects.implMatBuf.buffer, "implicitMat");
}

GLuint HelloVulkan::createShadersTex() {
    // OpenGL - Create shaders
    char buf[512];
    int  len = 0;

    // OpenGL 4.2 Core
    GLuint        vs  = glCreateShader(GL_VERTEX_SHADER);
//    GLchar const* vss = {R"(
//      #version 450
//      layout(location = 0) in vec3 inVertex;
//      layout(location = 1) in vec2 inUV;
//      layout (location = 0) out vec2 outUV;
//
//      void main()
//      {
//        outUV = inUV;
//        gl_Position = vec4(inVertex, 1.0f);
//      }
//    )"};

    GLchar const* vss = {R"(
      #version 450 core
        layout (location = 0) in vec3 aPos;
        layout (location = 1) in vec3 aColor;
        layout (location = 2) in vec2 aTexCoord;

        out vec3 ourColor;
        out vec2 TexCoord;

        void main()
        {
            gl_Position = vec4(aPos, 1.0);
            ourColor = aColor;
            TexCoord = vec2(aTexCoord.x, aTexCoord.y);
        }
    )"};

    glShaderSource(vs, 1, &vss, nullptr);
    glCompileShader(vs);
    glGetShaderInfoLog(vs, 512, (GLsizei*)&len, buf);

    GLuint        fs  = glCreateShader(GL_FRAGMENT_SHADER);
//    GLchar const* fss = {R"(
//      #version 450
//      layout (location = 0) in vec2 inUV;
//      layout(location = 0) out vec4 fragColor;
//
//      uniform sampler2D myTextureSampler;
//
//      void main()
//      {
//        vec3 color = texture( myTextureSampler, inUV ).rgb;
//        fragColor = vec4(color,1);
//      }
//
//    )"};
    GLchar const* fss = {R"(
      #version 450 core
        out vec4 FragColor;

        in vec3 ourColor;
        in vec2 TexCoord;

        // texture sampler
        uniform sampler2D texture1;

        void main()
        {
            FragColor = texture(texture1, TexCoord);
        }

    )"};

    glShaderSource(fs, 1, &fss, nullptr);
    glCompileShader(fs);
    glGetShaderInfoLog(fs, 512, (GLsizei*)&len, buf);

    GLuint mSH2D = glCreateProgram();
    glAttachShader(mSH2D, vs);
    glAttachShader(mSH2D, fs);
    glLinkProgram(mSH2D);

    m_programIDt = mSH2D;
    return mSH2D;
}

bool HelloVulkan::needToResetFrame() {
    static nvmath::mat4f refCamMatrix;

    for(int i = 0; i < 16; i++)
    {
        if(CameraManip.getMatrix().mat_array[i] != refCamMatrix.mat_array[i])
        {
            refCamMatrix = CameraManip.getMatrix();
            return true;
        }
    }

    return false;
}

void HelloVulkan::createSemaphores() {
#ifdef WIN32
    HANDLE glReadyHandle{INVALID_HANDLE_VALUE};
  HANDLE glCompleteHandle{INVALID_HANDLE_VALUE};
#else
    int glReadyHandle{-1};
    int glCompleteHandle{-1};
#endif

    // Vulkan
    {
#ifdef WIN32
        auto handleType = vk::ExternalSemaphoreHandleTypeFlagBits::eOpaqueWin32;
#else
        auto handleType  = vk::ExternalSemaphoreHandleTypeFlagBits::eOpaqueFd;
#endif
        {
            vk::SemaphoreCreateInfo       sci;
            vk::ExportSemaphoreCreateInfo esci;
            sci.pNext               = &esci;
            esci.handleTypes        = handleType;
            m_raytrace.m_semaphores.vkReady    = m_device.createSemaphore(sci);
            m_raytrace.m_semaphores.vkComplete = m_device.createSemaphore(sci);
        }
#ifdef WIN32
        glReadyHandle    = m_device.getSemaphoreWin32HandleKHR({m_semaphores.vkReady, handleType});
    glCompleteHandle = m_device.getSemaphoreWin32HandleKHR({m_semaphores.vkComplete, handleType});
#else
        glReadyHandle    = m_device.getSemaphoreFdKHR({m_raytrace.m_semaphores.vkReady, handleType});
        glCompleteHandle = m_device.getSemaphoreFdKHR({m_raytrace.m_semaphores.vkComplete, handleType});
#endif
    }

    // OpenGL
    {
        // Import semaphores
        glGenSemaphoresEXT(1, &m_raytrace.m_semaphores.glReady);
        glGenSemaphoresEXT(1, &m_raytrace.m_semaphores.glComplete);
#ifdef WIN32
        glImportSemaphoreWin32HandleEXT(m_semaphores.glReady, GL_HANDLE_TYPE_OPAQUE_WIN32_EXT, glReadyHandle);
    glImportSemaphoreWin32HandleEXT(m_semaphores.glComplete, GL_HANDLE_TYPE_OPAQUE_WIN32_EXT, glCompleteHandle);
#else
        glImportSemaphoreFdEXT(m_raytrace.m_semaphores.glReady, GL_HANDLE_TYPE_OPAQUE_FD_EXT, glReadyHandle);
        glImportSemaphoreFdEXT(m_raytrace.m_semaphores.glComplete, GL_HANDLE_TYPE_OPAQUE_FD_EXT, glCompleteHandle);
#endif
    }
}