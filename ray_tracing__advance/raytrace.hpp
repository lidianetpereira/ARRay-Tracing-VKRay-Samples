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

#include <vulkan/vulkan.hpp>

#include "nvvk/descriptorsets_vk.hpp"
#include "vkalloc.hpp"

#include "nvmath/nvmath.h"
#include "nvvk/raytraceNV_vk.hpp"
#include "obj.hpp"
#include "gl_vkpp.hpp"

class Raytracer
{
public:
  void setup(const vk::Device&         device,
             const vk::PhysicalDevice& physicalDevice,
             nvvk::Allocator*          allocator,
             uint32_t                  queueFamily);
  void destroy();

  vk::GeometryNV objectToVkGeometryNV(const ObjModel& model);
  vk::GeometryNV implicitToVkGeometryNV(const ImplInst& implicitObj);
  void           createBottomLevelAS(std::vector<ObjModel>& models, ImplInst& implicitObj);
  void           createTopLevelAS(std::vector<ObjInstance>& instances, ImplInst& implicitObj);
  void           createRtDescriptorSet(const vk::ImageView& outputImage);
  void           updateRtDescriptorSet(const vk::ImageView& outputImage);
  void           createRtPipeline(vk::DescriptorSetLayout& sceneDescLayout);
  void           createRtShaderBindingTable();
  void           raytrace(const vk::CommandBuffer& cmdBuf,
                          const nvmath::vec4f&     clearColor,
                          vk::DescriptorSet&       sceneDescSet,
                          vk::Extent2D&            size,
                          ObjPushConstants&        sceneConstants);

    struct RtPushConstants
    {
        nvmath::vec4f clearColor;
        nvmath::vec3f lightPosition{0.0f, 125.0f, 75.0f};
        float         lightIntensity{10000.f};
        nvmath::vec3f lightDirection{0, 0, 0};
        float         lightSpotCutoff{deg2rad(12.0f)};
        float         lightSpotOuterCutoff{deg2rad(17.0f)};
        int           lightType{0};
        int           frame{-1};
    } m_rtPushConstants;

    // For synchronizing with OpenGL
    struct Semaphore
    {
        vk::Semaphore vkReady;
        vk::Semaphore vkComplete;
        GLuint        glReady    = 0;
        GLuint        glComplete = 0;
    } m_semaphores;

    vk::CommandPool                                    m_rtCmdPool;
    vk::CommandBuffer                                  m_rtCmdBuffer;  // CmdBuf use for ray tracing
    vk::Queue                                          m_rtQueue;

    const Semaphore&         semaphores() const { return m_semaphores; }

private:
  nvvk::Allocator*   m_alloc{nullptr};  // Allocator for buffer, images, acceleration structures
  vk::PhysicalDevice m_physicalDevice;
  vk::Device         m_device;
  int                m_graphicsQueueIndex{0};
  nvvk::DebugUtil    m_debug;  // Utility to name objects


  vk::PhysicalDeviceRayTracingPropertiesNV           m_rtProperties;
  nvvk::RaytracingBuilderNV                          m_rtBuilder;
  nvvk::DescriptorSetBindings                        m_rtDescSetLayoutBind;
  vk::DescriptorPool                                 m_rtDescPool;
  vk::DescriptorSetLayout                            m_rtDescSetLayout;
  vk::DescriptorSet                                  m_rtDescSet;
  std::vector<vk::RayTracingShaderGroupCreateInfoNV> m_rtShaderGroups;
  vk::PipelineLayout                                 m_rtPipelineLayout;
  vk::Pipeline                                       m_rtPipeline;
  nvvk::Buffer                                       m_rtSBTBuffer;


};
