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


#include "offscreen.hpp"
#include "nvh/fileoperations.hpp"
#include "nvvk/commands_vk.hpp"
#include "nvvk/descriptorsets_vk.hpp"
#include "nvvk/pipeline_vk.hpp"
#include "nvvk/renderpasses_vk.hpp"

extern std::vector<std::string> defaultSearchPaths;

//////////////////////////////////////////////////////////////////////////
// Post-processing
//////////////////////////////////////////////////////////////////////////

void Offscreen::setup(const vk::Device& device, nvvk::Allocator* allocator, uint32_t queueFamily)
{
  m_device             = device;
  m_alloc              = allocator;
  m_graphicsQueueIndex = queueFamily;
  m_debug.setup(m_device);
}

void Offscreen::destroy()
{
  m_device.destroy(m_pipeline);
  m_device.destroy(m_pipelineLayout);
  m_device.destroy(m_descPool);
  m_device.destroy(m_dsetLayout);
//  m_alloc->destroy(m_colorTexture);
  m_alloc->destroy(m_depthTexture);
  m_device.destroy(m_renderPass);
  m_device.destroy(m_framebuffer);
}

//--------------------------------------------------------------------------------------------------
// Creating an offscreen frame buffer and the associated render pass
//
void Offscreen::createFramebuffer(VkExtent2D& size)
{
  //m_alloc->destroy(m_colorTexture);
  m_alloc->destroy(m_depthTexture);
  m_allocGL.destroy(m_rtOutputGL.texVk);

  // Creating the color image
  {
//    auto colorCreateInfo = nvvk::makeImage2DCreateInfo(size, m_colorFormat,
//                                                       vk::ImageUsageFlagBits::eColorAttachment
//                                                           | vk::ImageUsageFlagBits::eSampled
//                                                           | vk::ImageUsageFlagBits::eStorage);
//
//    nvvk::Image               image  = m_alloc->createImage(colorCreateInfo);
//    vk::ImageViewCreateInfo ivInfo = nvvk::makeImageViewCreateInfo(image.image, colorCreateInfo);
//    m_colorTexture                 = m_alloc->createTexture(image, ivInfo, vk::SamplerCreateInfo());
//    m_colorTexture.descriptor.imageLayout = VK_IMAGE_LAYOUT_GENERAL;

        vk::SamplerCreateInfo samplerCreateInfoDma;  // default values
        vk::ImageCreateInfo   imageCreateInfoDma = nvvk::makeImage2DCreateInfo(size, m_colorFormat,
                                                                               vk::ImageUsageFlagBits::eColorAttachment
                                                                               | vk::ImageUsageFlagBits::eSampled
                                                                               | vk::ImageUsageFlagBits::eStorage);

        nvvk::ImageDma imageDma = m_allocGL.createImage(imageCreateInfoDma);
        vk::ImageViewCreateInfo ivInfoDma = nvvk::makeImageViewCreateInfo(imageDma.image, imageCreateInfoDma);
        m_rtOutputGL.texVk = m_allocGL.createTexture(imageDma, ivInfoDma, samplerCreateInfoDma);
        m_rtOutputGL.imgSize = size;
  }


  // Creating the depth buffer
  {
    auto depthCreateInfo =
        nvvk::makeImage2DCreateInfo(size, m_depthFormat,
                                    vk::ImageUsageFlagBits::eDepthStencilAttachment);
    nvvk::Image image = m_alloc->createImage(depthCreateInfo);

    vk::ImageViewCreateInfo depthStencilView;
    depthStencilView.setViewType(vk::ImageViewType::e2D);
    depthStencilView.setFormat(m_depthFormat);
    depthStencilView.setSubresourceRange({vk::ImageAspectFlagBits::eDepth, 0, 1, 0, 1});
    depthStencilView.setImage(image.image);

    m_depthTexture = m_alloc->createTexture(image, depthStencilView);
  }

  // Setting the image layout for both color and depth
  {
    nvvk::CommandPool genCmdBuf(m_device, m_graphicsQueueIndex);
    auto              cmdBuf = genCmdBuf.createCommandBuffer();
//    nvvk::cmdBarrierImageLayout(cmdBuf, m_colorTexture.image, vk::ImageLayout::eUndefined,
//                                vk::ImageLayout::eGeneral);
    nvvk::cmdBarrierImageLayout(cmdBuf, m_rtOutputGL.texVk.image, VK_IMAGE_LAYOUT_UNDEFINED,
                                    VK_IMAGE_LAYOUT_GENERAL);
    nvvk::cmdBarrierImageLayout(cmdBuf, m_depthTexture.image, vk::ImageLayout::eUndefined,
                                vk::ImageLayout::eDepthStencilAttachmentOptimal,
                                vk::ImageAspectFlagBits::eDepth);

    genCmdBuf.submitAndWait(cmdBuf);
  }

  // Creating a renderpass for the offscreen
  if(!m_renderPass)
  {
    m_renderPass = nvvk::createRenderPass(m_device, {m_colorFormat}, m_depthFormat, 1, true, true,
                                          vk::ImageLayout::eGeneral, vk::ImageLayout::eGeneral);
  }

  // Creating the frame buffer for offscreen
//  std::vector<vk::ImageView> attachments = {m_colorTexture.descriptor.imageView,
//                                            m_depthTexture.descriptor.imageView};

    std::vector<vk::ImageView> attachments = {m_rtOutputGL.texVk.descriptor.imageView,
                                              m_depthTexture.descriptor.imageView};

  m_device.destroy(m_framebuffer);
  vk::FramebufferCreateInfo info;
  info.setRenderPass(m_renderPass);
  info.setAttachmentCount(2);
  info.setPAttachments(attachments.data());
  info.setWidth(size.width);
  info.setHeight(size.height);
  info.setLayers(1);
  m_framebuffer = m_device.createFramebuffer(info);

  // Making the OpenGL version of texture
  createTextureGL(m_rtOutputGL, GL_RGBA32F, GL_LINEAR_MIPMAP_LINEAR, GL_LINEAR, GL_REPEAT, m_dmaAllocGL);
}

//--------------------------------------------------------------------------------------------------
// The pipeline is how things are rendered, which shaders, type of primitives, depth test and more
// The incoming render pass, is in which rendering pass it will be displayed (framebuffer)
//
void Offscreen::createPipeline(vk::RenderPass& renderPass)
{
  // Push constants in the fragment shader
  vk::PushConstantRange pushConstantRanges = {vk::ShaderStageFlagBits::eFragment, 0, sizeof(float)};

  // Creating the pipeline layout
  vk::PipelineLayoutCreateInfo pipelineLayoutCreateInfo;
  pipelineLayoutCreateInfo.setSetLayoutCount(1);
  pipelineLayoutCreateInfo.setPSetLayouts(&m_dsetLayout);
  pipelineLayoutCreateInfo.setPushConstantRangeCount(1);
  pipelineLayoutCreateInfo.setPPushConstantRanges(&pushConstantRanges);
  m_pipelineLayout = m_device.createPipelineLayout(pipelineLayoutCreateInfo);

  // Pipeline: completely generic, no vertices
  std::vector<std::string> paths = defaultSearchPaths;

  nvvk::GraphicsPipelineGeneratorCombined pipelineGenerator(m_device, m_pipelineLayout, renderPass);
  pipelineGenerator.addShader(nvh::loadFile("shaders/passthrough.vert.spv", true, paths),
                              vk::ShaderStageFlagBits::eVertex);
  pipelineGenerator.addShader(nvh::loadFile("shaders/post.frag.spv", true, paths),
                              vk::ShaderStageFlagBits::eFragment);
  pipelineGenerator.rasterizationState.setCullMode(vk::CullModeFlagBits::eNone);
  m_pipeline = pipelineGenerator.createPipeline();
  m_debug.setObjectName(m_pipeline, "post");
}

//--------------------------------------------------------------------------------------------------
// The descriptor layout is the description of the data that is passed to the vertex or the
// fragment program.
//
void Offscreen::createDescriptor()
{
  using vkDS = vk::DescriptorSetLayoutBinding;
  using vkDT = vk::DescriptorType;
  using vkSS = vk::ShaderStageFlagBits;

  m_dsetLayoutBinding.addBinding(vkDS(0, vkDT::eCombinedImageSampler, 1, vkSS::eFragment));
  m_dsetLayout = m_dsetLayoutBinding.createLayout(m_device);
  m_descPool   = m_dsetLayoutBinding.createPool(m_device);
  m_dset       = nvvk::allocateDescriptorSet(m_device, m_descPool, m_dsetLayout);
}

//--------------------------------------------------------------------------------------------------
// Update the output
//
void Offscreen::updateDescriptorSet()
{
  vk::WriteDescriptorSet writeDescriptorSets =
      m_dsetLayoutBinding.makeWrite(m_dset, 0, &m_rtOutputGL.texVk.descriptor);
  m_device.updateDescriptorSets(writeDescriptorSets, nullptr);
}

//--------------------------------------------------------------------------------------------------
// Draw a full screen quad with the attached image
//
void Offscreen::draw(vk::CommandBuffer cmdBuf, VkExtent2D& size)
{
  m_debug.beginLabel(cmdBuf, "Post");

  cmdBuf.setViewport(0, {vk::Viewport(0, 0, (float)size.width, (float)size.height, 0, 1)});
  cmdBuf.setScissor(0, {{{0, 0}, {size.width, size.height}}});

  auto aspectRatio = static_cast<float>(size.width) / static_cast<float>(size.height);
  cmdBuf.pushConstants<float>(m_pipelineLayout, vk::ShaderStageFlagBits::eFragment, 0, aspectRatio);
  cmdBuf.bindPipeline(vk::PipelineBindPoint::eGraphics, m_pipeline);
  cmdBuf.bindDescriptorSets(vk::PipelineBindPoint::eGraphics, m_pipelineLayout, 0, m_dset, {});
  cmdBuf.draw(3, 1, 0, 0);

  m_debug.endLabel(cmdBuf);
}
