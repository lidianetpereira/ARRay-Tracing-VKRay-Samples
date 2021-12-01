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

// ImGui - standalone example application for Glfw + Vulkan, using programmable
// pipeline If you are new to ImGui, see examples/README.txt and documentation
// at the top of imgui.cpp.

#include <array>
#include <vulkan/vulkan.hpp>
VULKAN_HPP_DEFAULT_DISPATCH_LOADER_DYNAMIC_STORAGE

#include "imgui.h"
#include "imgui_impl_glfw.h"

#include "nvh/cameramanipulator.hpp"
#include "nvh/fileoperations.hpp"
#include "nvpsystem.hpp"
#include "nvvk/appbase_vkpp.hpp"
#include "nvvk/commands_vk.hpp"
#include "nvgl/contextwindow_gl.hpp"
#include "nvgl/extensions_gl.hpp"
#include "nvvk/context_vk.hpp"
#include "nvvk/extensions_vk.hpp"
#include "hello_vulkan.h"
#include "nvmath/nvmath.h"

#include <random>

#include <fstream>
#include <iostream>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
#ifdef DEBUG
#  ifdef _WIN32
#    define MAXPATHLEN MAX_PATH
	#    include <direct.h>               // _getcwd()
	#    define getcwd _getcwd
#  else
#    include <unistd.h>
#    include <sys/param.h>
#  endif
#endif
#include <string>

#include <ARX/ARController.h>
#include <ARX/ARUtil/time.h>
#include <ARX/ARG/mtx.h>
#include <iomanip>
#include "draw.h"

#if ARX_TARGET_PLATFORM_WINDOWS
const char *vconf = "-module=WinMF -format=BGRA";
#else
//const char *vconf = "-width=800 -height=600";
const char *vconf = NULL;
#endif
const char *cpara = NULL;

// Window and GL context.
static int contextWidth = 0;
static int contextHeight = 0;
static bool contextWasUpdated = false;
static int32_t viewport[4];
static float projection[16];

static ARController* arController = NULL;
static ARG_API drawAPI = ARG_API_None;
static long gFrameNo = 0;

struct marker {
    const char *name;
    float height;
};
static const struct marker markers[] = {
        {"hiro.patt", 57.0},
        {"kanji.patt", 57.0}
};
static const int markerCount = (sizeof(markers)/sizeof(markers[0]));
int markerIDs[markerCount];
int markerModelIDs[markerCount];

static void quit(int rc);
static void reshape(int w, int h);
static void displayOnce(void);
static void init();
bool gluInvertMatrix(float m[16]);
bool distanceBigger(float P[3], float Q[3]);

float invOut[16];
char str[512];
float cameraPose[9];

bool modified;

std::ofstream outFile;
std::ifstream inFile;
//////////////////////////////////////////////////////////////////////////
#define UNUSED(x) (void)(x)
#define ar
//////////////////////////////////////////////////////////////////////////

// Default search path for shaders
std::vector<std::string> defaultSearchPaths;

// GLFW Callback functions
static void onErrorCallback(int error, const char* description)
{
  fprintf(stderr, "GLFW Error %d: %s\n", error, description);
}

// Extra UI
void renderUI(HelloVulkan& helloVk)
{
  static int item    = 1;
  bool       changed = false;
  if(ImGui::Combo("Up Vector", &item, "X\0Y\0Z\0\0"))
  {
    nvmath::vec3f pos, eye, up;
    CameraManip.getLookat(pos, eye, up);
    up = nvmath::vec3f(item == 0, item == 1, item == 2);
    CameraManip.setLookat(pos, eye, up);
    changed = true;
  }
  changed |= ImGui::RadioButton("Point", &helloVk.m_pushConstants.lightType, 0);
  ImGui::SameLine();
  changed |= ImGui::RadioButton("Spot", &helloVk.m_pushConstants.lightType, 1);
  ImGui::SameLine();
  changed |= ImGui::RadioButton("Infinite", &helloVk.m_pushConstants.lightType, 2);
  if(helloVk.m_pushConstants.lightType < 2)
  {
    changed |= ImGui::SliderFloat3("Light Position", &helloVk.m_pushConstants.lightPosition.x,
                                   -20.f, 20.f);
  }
  if(helloVk.m_pushConstants.lightType > 0)
  {
    changed |= ImGui::SliderFloat3("Light Direction", &helloVk.m_pushConstants.lightDirection.x,
                                   -1.f, 1.f);
  }
  if(helloVk.m_pushConstants.lightType < 2)
  {
    changed |=
        ImGui::SliderFloat("Light Intensity", &helloVk.m_pushConstants.lightIntensity, 0.f, 500.f);
  }
  if(helloVk.m_pushConstants.lightType == 1)
  {
    float dCutoff    = rad2deg(acos(helloVk.m_pushConstants.lightSpotCutoff));
    float dOutCutoff = rad2deg(acos(helloVk.m_pushConstants.lightSpotOuterCutoff));
    changed |= ImGui::SliderFloat("Cutoff", &dCutoff, 0.f, 45.f);
    changed |= ImGui::SliderFloat("OutCutoff", &dOutCutoff, 0.f, 45.f);
    dCutoff = dCutoff > dOutCutoff ? dOutCutoff : dCutoff;

    helloVk.m_pushConstants.lightSpotCutoff      = cos(deg2rad(dCutoff));
    helloVk.m_pushConstants.lightSpotOuterCutoff = cos(deg2rad(dOutCutoff));
  }
  changed |= ImGui::InputInt("Max Frames", &helloVk.m_maxFrames);
  helloVk.m_maxFrames = std::max(helloVk.m_maxFrames, 1);
  if(changed)
    helloVk.resetFrame();
}

float m_vertices[] = {
        // positions          // colors           // texture coords
        1.0f,  1.0f, 0.0f,   1.0f, 0.0f, 0.0f,   1.0f, 1.0f, // top right
        1.0f, -1.0f, 0.0f,   0.0f, 1.0f, 0.0f,   1.0f, 0.0f, // bottom right
        -1.0f, -1.0f, 0.0f,   0.0f, 0.0f, 1.0f,   0.0f, 0.0f, // bottom left
        -1.0f,  1.0f, 0.0f,   1.0f, 1.0f, 0.0f,   0.0f, 1.0f  // top left
};
unsigned int m_indices[] = {
        0, 1, 3, // first triangle
        1, 2, 3  // second triangle
};

//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
static int const SAMPLE_WIDTH  = 640;
static int const SAMPLE_HEIGHT = 480;

//--------------------------------------------------------------------------------------------------
// Application Entry
//
int main(int argc, char** argv)
{
  UNUSED(argc);

  // Setup GLFW window
  glfwSetErrorCallback(onErrorCallback);
  if(!glfwInit())
  {
    return 1;
  }
  glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 4);
  glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 5);
  //glfwWindowHint(GLFW_CLIENT_API, GLFW_NO_API);
  GLFWwindow* window =
      glfwCreateWindow(SAMPLE_WIDTH, SAMPLE_HEIGHT, PROJECT_NAME, nullptr, nullptr);

  glfwMakeContextCurrent(window);
  //glfwSwapInterval(0);  // Enable vsync

  // Setup camera
  CameraManip.setWindowSize(SAMPLE_WIDTH, SAMPLE_HEIGHT);
  CameraManip.setLookat(nvmath::vec3f(0, 180, 250), nvmath::vec3f(0, 0, 0), nvmath::vec3f(0, 1, 0));

  // Setup Vulkan
  if(!glfwVulkanSupported())
  {
    printf("GLFW: Vulkan Not Supported\n");
    return 1;
  }

  // setup some basic things for the sample, logging file for example
  NVPSystem system(argv[0], PROJECT_NAME);

  // Search path for shaders and other media
  defaultSearchPaths = {
      PROJECT_ABSDIRECTORY,        // shaders
      PROJECT_ABSDIRECTORY "../",  // media
      PROJECT_NAME,                // installed: shaders + media
      NVPSystem::exePath() + std::string(PROJECT_NAME),
  };

  // Enabling the extension feature
  vk::PhysicalDeviceDescriptorIndexingFeaturesEXT indexFeature;
  vk::PhysicalDeviceScalarBlockLayoutFeaturesEXT  scalarFeature;

  // Requesting Vulkan extensions and layers
  nvvk::ContextCreateInfo contextInfo;
  contextInfo.setVersion(1, 2);
    contextInfo.addInstanceLayer("VK_LAYER_LUNARG_monitor", true);
    contextInfo.addInstanceExtension(VK_KHR_SURFACE_EXTENSION_NAME);
#ifdef WIN32
    contextInfo.addInstanceExtension(VK_KHR_WIN32_SURFACE_EXTENSION_NAME);
  contextInfo.addDeviceExtension(VK_KHR_EXTERNAL_MEMORY_WIN32_EXTENSION_NAME);
  contextInfo.addDeviceExtension(VK_KHR_EXTERNAL_SEMAPHORE_WIN32_EXTENSION_NAME);
  contextInfo.addDeviceExtension(VK_KHR_EXTERNAL_FENCE_WIN32_EXTENSION_NAME);
#else
    contextInfo.addInstanceExtension(VK_KHR_EXTERNAL_MEMORY_CAPABILITIES_EXTENSION_NAME);
    contextInfo.addInstanceExtension(VK_KHR_EXTERNAL_SEMAPHORE_CAPABILITIES_EXTENSION_NAME);
    contextInfo.addInstanceExtension(VK_KHR_EXTERNAL_FENCE_CAPABILITIES_EXTENSION_NAME);
    contextInfo.addInstanceExtension(VK_KHR_XLIB_SURFACE_EXTENSION_NAME);
    contextInfo.addInstanceExtension(VK_KHR_XCB_SURFACE_EXTENSION_NAME);
#endif
    contextInfo.addInstanceExtension(VK_KHR_GET_PHYSICAL_DEVICE_PROPERTIES_2_EXTENSION_NAME);
    contextInfo.addDeviceExtension(VK_KHR_SWAPCHAIN_EXTENSION_NAME);
    contextInfo.addDeviceExtension(VK_KHR_DEDICATED_ALLOCATION_EXTENSION_NAME);
    contextInfo.addDeviceExtension(VK_KHR_GET_MEMORY_REQUIREMENTS_2_EXTENSION_NAME);
    contextInfo.addDeviceExtension(VK_EXT_DESCRIPTOR_INDEXING_EXTENSION_NAME, false, &indexFeature);
    contextInfo.addDeviceExtension(VK_EXT_SCALAR_BLOCK_LAYOUT_EXTENSION_NAME, false, &scalarFeature);
    contextInfo.addDeviceExtension(VK_KHR_EXTERNAL_MEMORY_EXTENSION_NAME);
    contextInfo.addDeviceExtension(VK_KHR_EXTERNAL_SEMAPHORE_EXTENSION_NAME);
    contextInfo.addDeviceExtension(VK_KHR_EXTERNAL_FENCE_EXTENSION_NAME);
    contextInfo.addDeviceExtension(VK_KHR_EXTERNAL_MEMORY_FD_EXTENSION_NAME);
    contextInfo.addDeviceExtension(VK_KHR_EXTERNAL_SEMAPHORE_FD_EXTENSION_NAME);
    contextInfo.addDeviceExtension(VK_KHR_EXTERNAL_FENCE_FD_EXTENSION_NAME);
    // #VKRay: Activate the ray tracing extension
    contextInfo.addDeviceExtension(VK_NV_RAY_TRACING_EXTENSION_NAME);
    contextInfo.addDeviceExtension(VK_KHR_MAINTENANCE3_EXTENSION_NAME);

  // Creating Vulkan base application
  nvvk::Context vkctx{};
  vkctx.initInstance(contextInfo);
  // Find all compatible devices
  auto compatibleDevices = vkctx.getCompatibleDevices(contextInfo);
  assert(!compatibleDevices.empty());
  // Use a compatible device
  vkctx.initDevice(compatibleDevices[0], contextInfo);

    // Loading the C version of the extensions
    load_VK_EXTENSION_SUBSET(vkctx.m_instance, vkGetInstanceProcAddr, vkctx.m_device, vkGetDeviceProcAddr);

  // Create example
  HelloVulkan helloVk;
    nvgl::ContextWindow contextWindowGL;

  // Window need to be opened to get the surface on which to draw
  //const vk::SurfaceKHR surface = helloVk.getVkSurface(vkctx.m_instance, window);
  //vkctx.setGCTQueueWithPresent(surface);

    // Loading all OpenGL symbols
    load_GL(nvgl::ContextWindow::sysGetProcAddress);

  helloVk.setup(vkctx.m_instance, vkctx.m_device, vkctx.m_physicalDevice,
                vkctx.m_queueGCT.familyIndex);
  //helloVk.createSwapchain(surface, SAMPLE_WIDTH, SAMPLE_HEIGHT);
  //helloVk.createDepthBuffer();
  //helloVk.createRenderPass();
  //helloVk.createFrameBuffers();

  // Setup Imgui
  helloVk.initGUI(0);  // Using sub-pass 0
    helloVk.m_size.width = SAMPLE_WIDTH;
    helloVk.m_size.height = SAMPLE_HEIGHT;
    CameraManip.setWindowSize(SAMPLE_WIDTH, SAMPLE_HEIGHT);

  // Creating scene
  //helloVk.loadModel(nvh::findFile("media/scenes/Medieval_building.obj", defaultSearchPaths), nvmath::rotation_mat4_y(90.0f) * nvmath::scale_mat4(nvmath::vec3f(60.0f)));
//  helloVk.loadModel(nvh::findFile("media/scenes/plane.obj", defaultSearchPaths), nvmath::scale_mat4(nvmath::vec3f(3.0f)) * nvmath::rotation_mat4_x(180.0f) * nvmath::translation_mat4(nvmath::vec3f(0.0f, 0.0f, 0.0f)));
//  helloVk.loadModel(nvh::findFile("media/scenes/plane.obj", defaultSearchPaths), nvmath::scale_mat4(nvmath::vec3f(3.0f)));

//  helloVk.loadModel(nvh::findFile("media/scenes/teapot.obj", defaultSearchPaths), nvmath::translation_mat4(nvmath::vec3f(-3, 0, 0)) * nvmath::scale_mat4(nvmath::vec3f(0.7f)));
  //helloVk.loadModel(nvh::findFile("media/scenes/bunny.obj", defaultSearchPaths), nvmath::translation_mat4(nvmath::vec3f(0, 0, 0)) * nvmath::scale_mat4(nvmath::vec3f(60.0f)));
    //helloVk.loadModel(nvh::findFile("media/scenes/buddha.obj", defaultSearchPaths), nvmath::translation_mat4(nvmath::vec3f(0.0f, 50.0f, 10.0f))* nvmath::scale_mat4(nvmath::vec3f(110.0f)) * nvmath::rotation_mat4_y(135.0f));
    helloVk.loadModel(nvh::findFile("media/scenes/dragon.obj", defaultSearchPaths), nvmath::translation_mat4(nvmath::vec3f(0.0f, 32.0f, -20.0f))* nvmath::scale_mat4(nvmath::vec3f(120.0f)) * nvmath::rotation_mat4_y(90.0f));


//helloVk.loadModel(nvh::findFile("media/scenes/CornellBox-Empty-White.obj", defaultSearchPaths), nvmath::scale_mat4(nvmath::vec3f(95.0f, 70.f, 60.f)) );
  //helloVk.loadModel(nvh::findFile("media/scenes/Alucy.obj", defaultSearchPaths), nvmath::rotation_mat4_y(45.f) * nvmath::scale_mat4(nvmath::vec3f(0.12f)));

    //helloVk.loadModel(nvh::findFile("media/scenes/bunny.obj", defaultSearchPaths), nvmath::scale_mat4(nvmath::vec3f(60.0f)));
    //helloVk.loadModel(nvh::findFile("media/scenes/CornellBox-Empty-RG.obj", defaultSearchPaths), nvmath::scale_mat4(nvmath::vec3f(80.0f, 70.0f, 60.0f)) );

    //Buddah rg
    helloVk.loadModel(nvh::findFile("media/scenes/CornellBox-Empty-RG.obj", defaultSearchPaths), nvmath::scale_mat4(nvmath::vec3f(60.0f, 60.0f, 60.0f)) );
//helloVk.loadModel(nvh::findFile("media/scenes/Alucy.obj", defaultSearchPaths), nvmath::rotation_mat4_y(45.f) * nvmath::scale_mat4(nvmath::vec3f(0.15f)));

//    helloVk.loadModel(nvh::findFile("media/scenes/wuson.obj", defaultSearchPaths), nvmath::rotation_mat4_y(90.f) * nvmath::scale_mat4(nvmath::vec3f(50.f)));
//                        * nvmath::translation_mat4(nvmath::vec3f(0.0f, 0.0f, 6.0f)));
//
//  std::random_device              rd;  // Will be used to obtain a seed for the random number engine
//  std::mt19937                    gen(rd());  // Standard mersenne_twister_engine seeded with rd()
//  std::normal_distribution<float> dis(2.0f, 2.0f);
//  std::normal_distribution<float> disn(0.5f, 0.2f);
//  int                             wusonIndex = static_cast<int>(helloVk.m_objModel.size() - 1);
//
//  for(int n = 0; n < 50; ++n)
//  {
//
//    ObjInstance inst;
//    inst.objIndex       = wusonIndex;
//    inst.txtOffset      = 0;
//    float         scale = fabsf(disn(gen));
//    nvmath::mat4f mat   = nvmath::translation_mat4(nvmath::vec3f{dis(gen), 0.f, dis(gen) + 6});
//    //    mat              = mat * nvmath::rotation_mat4_x(dis(gen));
//    mat              = mat * nvmath::scale_mat4(nvmath::vec3f(scale));
//    inst.transform   = mat;
//    inst.transformIT = nvmath::transpose(nvmath::invert((inst.transform)));
//    helloVk.m_objInstance.push_back(inst);
//  }

    //helloVk.loadModel(nvh::findFile("media/scenes/cube1.obj", defaultSearchPaths), nvmath::translation_mat4(nvmath::vec3f(-40.0f, 50.0f, -30.0f)) * nvmath::rotation_mat4_y(45.f) * nvmath::scale_mat4(nvmath::vec3f(50.f, 100.f, 50.f)));
    //helloVk.loadModel(nvh::findFile("media/scenes/cube2.obj", defaultSearchPaths), nvmath::translation_mat4(nvmath::vec3f(-30.0f, 20.0f, 25.0f)) * nvmath::rotation_mat4_x(0.f) * nvmath::scale_mat4(nvmath::vec3f(40.f, 40.f, 40.f)));
//  // Creation of implicit geometry
  MaterialObj mat;
  // Reflective
  mat.diffuse   = nvmath::vec3f(0, 0, 0);
  mat.specular  = nvmath::vec3f(1.f);
  mat.shininess = 0.0;
  mat.illum     = 3;
  helloVk.addImplMaterial(mat);
  // Transparent
  mat.diffuse  = nvmath::vec3f(0.4, 0.4, 1);
  mat.illum    = 4;
  mat.dissolve = 0.5;
  helloVk.addImplMaterial(mat);
  //helloVk.addImplCube({-10, 0, -5}, {10, 20, 15}, 1);
  //helloVk.addImplSphere({35, 35, 0}, 35.f, 0);
//
//    // Creation of implicit geometry
//    MaterialObj matFloor;
//    // Reflective
//    mat.diffuse   = nvmath::vec3f(0.45f, 1.f, 0.8f);
//    mat.specular  = nvmath::vec3f(0.3f);
//    mat.shininess = 0.0;
//    mat.illum     = 2;
//    helloVk.addImplMaterial(mat);
//    //helloVk.addImplCube({-6.1, 0, -6}, {-6, 10, 6}, 2);

  helloVk.initOffscreen();
  Offscreen& offscreen = helloVk.offscreen();

  helloVk.createImplictBuffers();


  helloVk.createDescriptorSetLayout();
  helloVk.createGraphicsPipeline();
  helloVk.createUniformBuffer();
  helloVk.createSceneDescriptionBuffer();
  helloVk.updateDescriptorSet();

  // #VKRay
  helloVk.initRayTracing();
  helloVk.createSemaphores();

#ifdef ar
    init();
#endif

    double previousTime = glfwGetTime();
    int frameCount = 0, i = 0, j = 0;
    float camera_eyeOld[3];
    float eyeTemp[3];
    float acumFrame = 0, fpsMedio = 0, count = 0;
    float valoresFPS[90];

#ifdef ar
      displayOnce();
      displayOnce();
	  camera_eyeOld[0] = invOut[12];
	  camera_eyeOld[1] = invOut[13];
	  camera_eyeOld[2] = invOut[14];
	  CameraManip.setLookat(nvmath::vec3(invOut[12], invOut[13], invOut[14]), nvmath::vec3(invOut[12]-invOut[8], invOut[13]-invOut[9],  invOut[14]-invOut[10]), nvmath::vec3(invOut[4], invOut[5], invOut[6]), true);
#endif

//    outFile.open("camPoseDragon.txt", std::ios::out);  // abre o arquivo para escrita
//    if (! outFile)
//    {
//        std::cout << "Arquivo camPoseDragon.txt nao pode ser aberto" << std::endl;
//        abort();
//    }

//    inFile.open("camPoseDragon.txt", std::ios::in);    // abre o arquivo para leitura
//    if (! inFile)
//    {
//        std::cout << "Arquivo camPoseDragon.txt nao pode ser aberto" << std::endl;
//        abort();
//    }

    helloVk.createShadersTex();
    glGenVertexArrays(1, &helloVk.VAOt);
    glGenBuffers(1, &helloVk.VBOt);
    glGenBuffers(1, &helloVk.EBOt);

    glBindVertexArray(helloVk.VAOt);

    glBindBuffer(GL_ARRAY_BUFFER, helloVk.VBOt);
    glBufferData(GL_ARRAY_BUFFER, sizeof(m_vertices), m_vertices, GL_STATIC_DRAW);

    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, helloVk.EBOt);
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(m_indices), m_indices, GL_STATIC_DRAW);

    // position attribute
    glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 8 * sizeof(float), (void*)0);
    glEnableVertexAttribArray(0);
    // color attribute
    glVertexAttribPointer(1, 3, GL_FLOAT, GL_FALSE, 8 * sizeof(float), (void*)(3 * sizeof(float)));
    glEnableVertexAttribArray(1);
    // texture coord attribute
    glVertexAttribPointer(2, 2, GL_FLOAT, GL_FALSE, 8 * sizeof(float), (void*)(6 * sizeof(float)));
    glEnableVertexAttribArray(2);

    nvmath::vec4f clearColor   = nvmath::vec4f(1, 1, 1, 1.00f);
  bool          useRaytracer = true;


  helloVk.setupGlfwCallbacks(window);
  ImGui_ImplGlfw_InitForOpenGL(window, false);
  //ImGui_ImplGlfw_InitForVulkan(window, true);

//    if(invOut[12] && invOut[13] && invOut[14]){
//        outFile << invOut[12] << " " << invOut[13] << " " << invOut[14] << " " << invOut[12]-invOut[8] << " " << invOut[13]-invOut[9] << " " << invOut[14]-invOut[10] << " " << invOut[4] << " " << invOut[5] << " " << invOut[6] << "\n";
//    }

  // Main loop
  while(!glfwWindowShouldClose(window))
  {
    glfwPollEvents();
    if(helloVk.isMinimized())
      continue;

      //    // Start the Dear ImGui frame
      //    ImGui_ImplGlfw_NewFrame();
      //    ImGui::NewFrame();
      glClearColor(1.0, 1.0, 1.0f, 1.0f);
      glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
      //glEnable(GL_DEPTH_TEST);

#ifdef ar
      displayOnce();

//      if(inFile >> cameraPose[0] >> cameraPose[1] >> cameraPose[2] >> cameraPose[3] >> cameraPose[4] >> cameraPose[5] >> cameraPose[6] >> cameraPose[7] >> cameraPose[8]){
//          //std::cout << cameraPose[0] << cameraPose[1] << cameraPose[2] << cameraPose[3] << cameraPose[4] << cameraPose[5] << cameraPose[6] << cameraPose[7] << cameraPose[8] << "\n";
//          CameraManip.setLookat(nvmath::vec3(cameraPose[0], cameraPose[1], cameraPose[2]), nvmath::vec3(cameraPose[3], cameraPose[4],  cameraPose[5]), nvmath::vec3(cameraPose[6], cameraPose[7], cameraPose[8]), true);
//          helloVk.m_frameNumber = 0;
//          helloVk.resetFrame();
//          //CameraManip.updateAnim();
//      } else{
//          inFile.close();
//      }

      eyeTemp[0] = invOut[12];
	    eyeTemp[1] = invOut[13];
	    eyeTemp[2] = invOut[14];
//      eyeTemp[0] = cameraPose[0];
//      eyeTemp[1] = cameraPose[1];
//      eyeTemp[2] = cameraPose[2];
	    if(distanceBigger(camera_eyeOld, eyeTemp)){
	        camera_eyeOld[0] = eyeTemp[0];
	        camera_eyeOld[1] = eyeTemp[1];
	        camera_eyeOld[2] = eyeTemp[2];
            CameraManip.setLookat(nvmath::vec3(cameraPose[0], cameraPose[1], cameraPose[2]), nvmath::vec3(cameraPose[3], cameraPose[4],  cameraPose[5]), nvmath::vec3(cameraPose[6], cameraPose[7], cameraPose[8]), true);
	        CameraManip.setLookat(nvmath::vec3(invOut[12], invOut[13], invOut[14]), nvmath::vec3(invOut[12]-invOut[8], invOut[13]-invOut[9],  invOut[14]-invOut[10]), nvmath::vec3(invOut[4], invOut[5], invOut[6]), true);
//            if(invOut[12] && invOut[13] && invOut[14]){
//                outFile << invOut[12] << " " << invOut[13] << " " << invOut[14] << " " << invOut[12]-invOut[8] << " " << invOut[13]-invOut[9] << " " << invOut[14]-invOut[10] << " " << invOut[4] << " " << invOut[5] << " " << invOut[6] << "\n";
//            }
            helloVk.m_frameNumber = 0;
            helloVk.resetFrame();
	    }
#endif

      auto& imgui_io       = ImGui::GetIO();
      imgui_io.DisplaySize = ImVec2(SAMPLE_WIDTH, SAMPLE_HEIGHT);

      // Updating camera buffer
//    CameraManip.updateAnim();
    helloVk.updateUniformBuffer();

    // Show UI window.
//    if(1 == 1)
//    {
//      bool changed = false;
//      // Edit 3 floats representing a color
//      changed |= ImGui::ColorEdit3("Clear color", reinterpret_cast<float*>(&clearColor));
//      // Switch between raster and ray tracing
//      changed |= ImGui::Checkbox("Ray Tracer mode", &useRaytracer);
//      if(changed)
//        helloVk.resetFrame();
//
//
//      renderUI(helloVk);
//      ImGui::Text("Application average %.3f ms/frame (%.1f FPS)",
//                  1000.0f / ImGui::GetIO().Framerate, ImGui::GetIO().Framerate);
//      ImGui::Render();
//    }

    // Start rendering the scene
    //helloVk.prepareFrame();

    // Start command buffer of this frame
      //    auto                     curFrame = helloVk.getCurFrame();
      //    const vk::CommandBuffer& cmdBuff  = helloVk.getCommandBuffers()[curFrame];

      glViewport(0, 0, helloVk.m_size.width, helloVk.m_size.height);
      glBindFramebuffer(GL_FRAMEBUFFER, 0);

      GLuint outRayID = helloVk.m_offscreen.outputImage().oglId;
      if(helloVk.needToResetFrame() || modified){
          helloVk.m_frameNumber = 0;
          helloVk.resetFrame();
      }
      // Once render is complete, signal the Vulkan semaphore indicating it can start render
      GLenum dstLayout = GL_LAYOUT_SHADER_READ_ONLY_EXT;
      GLenum srcLayout = GL_LAYOUT_COLOR_ATTACHMENT_EXT;
      glSignalSemaphoreEXT(helloVk.m_raytrace.semaphores().glComplete, 0, nullptr, 1, &outRayID, &dstLayout);

    // Clearing screen
    vk::ClearValue clearValues[2];
    clearValues[0].setColor(
        std::array<float, 4>({clearColor[0], clearColor[1], clearColor[2], clearColor[3]}));
    clearValues[1].setDepthStencil({1.0f, 0});

    // Offscreen render pass
    {
//      vk::RenderPassBeginInfo offscreenRenderPassBeginInfo;
//      offscreenRenderPassBeginInfo.setClearValueCount(2);
//      offscreenRenderPassBeginInfo.setPClearValues(clearValues);
//      offscreenRenderPassBeginInfo.setRenderPass(offscreen.renderPass());
//      offscreenRenderPassBeginInfo.setFramebuffer(offscreen.frameBuffer());
//      offscreenRenderPassBeginInfo.setRenderArea({{}, helloVk.getSize()});

      // Rendering Scene
      if(useRaytracer)
      {
        helloVk.raytrace(helloVk.m_raytrace.m_rtCmdBuffer, clearColor);
          helloVk.m_frameNumber++;
      }
//      else
//      {
//        cmdBuff.beginRenderPass(offscreenRenderPassBeginInfo, vk::SubpassContents::eInline);
//        helloVk.rasterize(cmdBuff);
//        cmdBuff.endRenderPass();
//      }
    }
//
//    // 2nd rendering pass: tone mapper, UI
//    {
//      vk::RenderPassBeginInfo postRenderPassBeginInfo;
//      postRenderPassBeginInfo.setClearValueCount(2);
//      postRenderPassBeginInfo.setPClearValues(clearValues);
//      postRenderPassBeginInfo.setRenderPass(helloVk.getRenderPass());
//      postRenderPassBeginInfo.setFramebuffer(helloVk.getFramebuffers()[curFrame]);
//      postRenderPassBeginInfo.setRenderArea({{}, helloVk.getSize()});
//
//      cmdBuff.beginRenderPass(postRenderPassBeginInfo, vk::SubpassContents::eInline);
//      // Rendering tonemapper
//      offscreen.draw(cmdBuff, helloVk.getSize());
//      // Rendering UI
//      ImGui::RenderDrawDataVK(cmdBuff, ImGui::GetDrawData());
//      cmdBuff.endRenderPass();
//    }
//
//    // Submit for display
//    cmdBuff.end();
//    helloVk.submitFrame();

      // And wait (on the GPU) for the raytraced image
      glWaitSemaphoreEXT(helloVk.m_raytrace.semaphores().glReady, 0, nullptr, 1, &outRayID, &srcLayout);
      // bind Texture
      glBindTexture(GL_TEXTURE_2D, outRayID);

      glUseProgram(helloVk.m_programIDt);
      // render container
      glBindVertexArray(helloVk.VAOt);
      glDrawElements(GL_TRIANGLES, 6, GL_UNSIGNED_INT, 0);

      glfwSwapBuffers(window);

      // Measure speed
      double currentTime = glfwGetTime();
      frameCount++;
      // If a second has passed.
      if ( currentTime - previousTime >= 1.0 )
      {
          if (i < 90){
              valoresFPS[i] = frameCount;
              //ARLOGi("%d %.2f \n", i, valoresFPS[i]);
          }else if (i = 90) {
              for (j = 0; j < 90; j++) {
                  ARLOGi("%.2f \n", valoresFPS[j]);
              }
              i = 0;
          }

          acumFrame += frameCount;
          count++;
          fpsMedio = frameCount / ( currentTime - previousTime );
//          if(count >= 180) {
//              fpsMedio = acumFrame / count;
//              count = 0;
//              acumFrame = 0;
//          }
          // Display the frame count here any way you want.
          std::stringstream ss;
          //ss << "ARRay-Tracing VKRay" << " " << " [" << frameCount << " FPS]" << " " << " [" << fpsMedio << " FPS Medio 3 minutos]";
          ss << std::setprecision(4) << "ARRay-Tracing VKRay" << " " << " [" << fpsMedio << " fps]";

          glfwSetWindowTitle(window, ss.str().c_str());

          frameCount = 0;
          previousTime = currentTime;
          i++;
      }

  }

  // Cleanup
//  helloVk.getDevice().waitIdle();
//  helloVk.destroyResources();
  helloVk.destroy();

  vkctx.deinit();

  glfwDestroyWindow(window);
  glfwTerminate();

  return 0;
}

static void init(){
#  if ARX_TARGET_PLATFORM_MACOS
    vconf = "-format=BGRA";
#  endif

    //int w = 960, h = 720;
    reshape(SAMPLE_WIDTH, SAMPLE_HEIGHT);

    glEnable(GL_BLEND);
    glBlendFunci(0, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    //glBlendFunci(0, GL_ONE, GL_ONE_MINUS_DST_ALPHA);

    // Initialise the ARController.
    arController = new ARController();
    if (!arController->initialiseBase()) {
        ARLOGe("Error initialising ARController.\n");
        quit(-1);
    }

#ifdef DEBUG
    arLogLevel = AR_LOG_LEVEL_DEBUG;
#endif

#ifdef DEBUG
    char buf[MAXPATHLEN];
    ARLOGd("CWD is '%s'.\n", getcwd(buf, sizeof(buf)));
#endif
    //char *resourcesDir = arUtilGetResourcesDirectoryPath(AR_UTIL_RESOURCES_DIRECTORY_BEHAVIOR_BEST);
    char *resourcesDir = "/home/lidiane/CLionProjects/ARRayTracingVKRay/gl_vk_raytrace_interop/data";
    ARLOGd("Resources are in'%s'.\n", resourcesDir);
    for (int i = 0; i < markerCount; i++) {
        std::string markerConfig = "single;" + std::string(resourcesDir) + '/' + markers[i].name + ';' + std::to_string(markers[i].height);
        markerIDs[i] = arController->addTrackable(markerConfig);
        if (markerIDs[i] == -1) {
            ARLOGe("Error adding marker.\n");
            quit(-1);
        }
    }
    arController->getSquareTracker()->setPatternDetectionMode(AR_TEMPLATE_MATCHING_MONO);
    arController->getSquareTracker()->setThresholdMode(AR_LABELING_THRESH_MODE_AUTO_BRACKETING);

#ifdef DEBUG
    ARLOGd("vconf is '%s'.\n", vconf);
#endif
    arController->startRunning(vconf, cpara, NULL, 0);
}

static void quit(int rc)
{
    drawCleanup();
    if (arController) {
        arController->drawVideoFinal(0);
        arController->shutdown();
        delete arController;
    }
    exit(rc);
}

static void reshape(int w, int h)
{
    contextWidth = w;
    contextHeight = h;
    ARLOGd("Resized to %dx%d.\n", w, h);
    contextWasUpdated = true;
}

static void displayOnce(void)
{
    bool done = false;
    while (!done) {
        bool gotFrame = arController->capture();
        if (!gotFrame) {
            arUtilSleep(1);
        } else {
            //ARLOGi("Got frame %ld.\n", gFrameNo);
            gFrameNo++;

            if (!arController->update()) {
                ARLOGe("Error in ARController::update().\n");
                quit(-1);
            }

            if (contextWasUpdated) {
                if (!arController->drawVideoInit(0)) {
                    ARLOGe("Error in ARController::drawVideoInit().\n");
                    quit(-1);
                }
                if (!arController->drawVideoSettings(0, contextWidth, contextHeight, false, false, false,
                                                     ARVideoView::HorizontalAlignment::H_ALIGN_CENTRE,
                                                     ARVideoView::VerticalAlignment::V_ALIGN_CENTRE,
                                                     ARVideoView::ScalingMode::SCALE_MODE_FIT, viewport)) {
                    ARLOGe("Error in ARController::drawVideoSettings().\n");
                    quit(-1);
                }
                drawSetup(drawAPI, false, false, false);
                drawSetViewport(viewport);
                ARdouble projectionARD[16];
                arController->projectionMatrix(0, 0.1f, 1000.0f, projectionARD);
                for (int i = 0; i < 16; i++) projection[i] = (float) projectionARD[i];
                drawSetCamera(projection, NULL);

                for (int i = 0; i < markerCount; i++) {
                    markerModelIDs[i] = drawLoadModel(NULL);
                }
                contextWasUpdated = false;
            }
            //Display the current video frame to the current OpenGL context.
            arController->drawVideo(0);

            // Look for trackables, and draw on each found one.
            for (int i = 0; i < markerCount; i++) {

                // Find the trackable for the given trackable ID.
                ARTrackable *marker = arController->findTrackable(markerIDs[i]);
                float view[16];
                if (marker->visible) {
                    //arUtilPrintMtx16(marker->transformationMatrix);
                    //ARLOGi("\n \n");
                    for (int i = 0; i < 16; i++){
                        view[i] = (float) marker->transformationMatrix[i];
                    }
                }
                mtxRotatef(view, 90, 1.0f, 0.0f, 0.0f);
                //ARLOGd("MK: x: %3.1f  y: %3.1f  z: %3.1f w: %3.1f \n", view[12], view[13], view[14], view[15]);
                //sprintf(str, "Cam Pos: x: %3.1f  y: %3.1f  z: %3.1f w: %3.1f \n", view[12], view[13], view[14], view[15]);
                if(gluInvertMatrix(view)){
                    //arUtilPrintMtx16(marker->transformationMatrix);
                    //ARLOGi("--- \n");
                    //sprintf(str, "Cam Pos: x: %3.1f  y: %3.1f  z: %3.1f w: %3.1f \n", invOut[12], invOut[13], invOut[14], invOut[15]);
                    //ARLOGd("Cam: x: %3.1f  y: %3.1f  z: %3.1f w: %3.1f \n", invOut[12], invOut[13], invOut[14], invOut[15]);
                }
                //drawSetModel(markerModelIDs[i], marker->visible, view, invOut);
                //showString( str );
            }
            done = true;
        }
    }
}

bool gluInvertMatrix(float m[16])
{
    float inv[16], det;
    int i;

    inv[0] = m[5]  * m[10] * m[15] -
             m[5]  * m[11] * m[14] -
             m[9]  * m[6]  * m[15] +
             m[9]  * m[7]  * m[14] +
             m[13] * m[6]  * m[11] -
             m[13] * m[7]  * m[10];

    inv[4] = -m[4]  * m[10] * m[15] +
             m[4]  * m[11] * m[14] +
             m[8]  * m[6]  * m[15] -
             m[8]  * m[7]  * m[14] -
             m[12] * m[6]  * m[11] +
             m[12] * m[7]  * m[10];

    inv[8] = m[4]  * m[9] * m[15] -
             m[4]  * m[11] * m[13] -
             m[8]  * m[5] * m[15] +
             m[8]  * m[7] * m[13] +
             m[12] * m[5] * m[11] -
             m[12] * m[7] * m[9];

    inv[12] = -m[4]  * m[9] * m[14] +
              m[4]  * m[10] * m[13] +
              m[8]  * m[5] * m[14] -
              m[8]  * m[6] * m[13] -
              m[12] * m[5] * m[10] +
              m[12] * m[6] * m[9];

    inv[1] = -m[1]  * m[10] * m[15] +
             m[1]  * m[11] * m[14] +
             m[9]  * m[2] * m[15] -
             m[9]  * m[3] * m[14] -
             m[13] * m[2] * m[11] +
             m[13] * m[3] * m[10];

    inv[5] = m[0]  * m[10] * m[15] -
             m[0]  * m[11] * m[14] -
             m[8]  * m[2] * m[15] +
             m[8]  * m[3] * m[14] +
             m[12] * m[2] * m[11] -
             m[12] * m[3] * m[10];

    inv[9] = -m[0]  * m[9] * m[15] +
             m[0]  * m[11] * m[13] +
             m[8]  * m[1] * m[15] -
             m[8]  * m[3] * m[13] -
             m[12] * m[1] * m[11] +
             m[12] * m[3] * m[9];

    inv[13] = m[0]  * m[9] * m[14] -
              m[0]  * m[10] * m[13] -
              m[8]  * m[1] * m[14] +
              m[8]  * m[2] * m[13] +
              m[12] * m[1] * m[10] -
              m[12] * m[2] * m[9];

    inv[2] = m[1]  * m[6] * m[15] -
             m[1]  * m[7] * m[14] -
             m[5]  * m[2] * m[15] +
             m[5]  * m[3] * m[14] +
             m[13] * m[2] * m[7] -
             m[13] * m[3] * m[6];

    inv[6] = -m[0]  * m[6] * m[15] +
             m[0]  * m[7] * m[14] +
             m[4]  * m[2] * m[15] -
             m[4]  * m[3] * m[14] -
             m[12] * m[2] * m[7] +
             m[12] * m[3] * m[6];

    inv[10] = m[0]  * m[5] * m[15] -
              m[0]  * m[7] * m[13] -
              m[4]  * m[1] * m[15] +
              m[4]  * m[3] * m[13] +
              m[12] * m[1] * m[7] -
              m[12] * m[3] * m[5];

    inv[14] = -m[0]  * m[5] * m[14] +
              m[0]  * m[6] * m[13] +
              m[4]  * m[1] * m[14] -
              m[4]  * m[2] * m[13] -
              m[12] * m[1] * m[6] +
              m[12] * m[2] * m[5];

    inv[3] = -m[1] * m[6] * m[11] +
             m[1] * m[7] * m[10] +
             m[5] * m[2] * m[11] -
             m[5] * m[3] * m[10] -
             m[9] * m[2] * m[7] +
             m[9] * m[3] * m[6];

    inv[7] = m[0] * m[6] * m[11] -
             m[0] * m[7] * m[10] -
             m[4] * m[2] * m[11] +
             m[4] * m[3] * m[10] +
             m[8] * m[2] * m[7] -
             m[8] * m[3] * m[6];

    inv[11] = -m[0] * m[5] * m[11] +
              m[0] * m[7] * m[9] +
              m[4] * m[1] * m[11] -
              m[4] * m[3] * m[9] -
              m[8] * m[1] * m[7] +
              m[8] * m[3] * m[5];

    inv[15] = m[0] * m[5] * m[10] -
              m[0] * m[6] * m[9] -
              m[4] * m[1] * m[10] +
              m[4] * m[2] * m[9] +
              m[8] * m[1] * m[6] -
              m[8] * m[2] * m[5];

    det = m[0] * inv[0] + m[1] * inv[4] + m[2] * inv[8] + m[3] * inv[12];

    if (det == 0)
        return false;

    det = 1.0 / det;

    for (i = 0; i < 16; i++)
        invOut[i] = inv[i] * det;

    return true;
}

bool distanceBigger(float P[3], float Q[3]){
    float threshold = 1.0f;

    float distance = sqrt(pow(P[0] - Q[0], 2.0)+ pow(P[1] - Q[1], 2.0) + pow(P[2] - Q[2], 2.0));
    //printf("d = %f\n", distance);
    if(distance > threshold)
        return true;
    return false;
}
