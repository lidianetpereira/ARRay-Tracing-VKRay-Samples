# Install script for directory: /home/lidiane/CLionProjects/vk/vk_raytracing_tutorial-master

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/lidiane/CLionProjects/vk/vk_raytracing_tutorial-master/../_install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/lidiane/CLionProjects/vk/build/build_glfw3/cmake_install.cmake")
  include("/home/lidiane/CLionProjects/vk/vk_raytracing_tutorial-master/cmake-build-debug/shared_sources/cmake_install.cmake")
  include("/home/lidiane/CLionProjects/vk/vk_raytracing_tutorial-master/cmake-build-debug/ray_tracing__advance/cmake_install.cmake")
  include("/home/lidiane/CLionProjects/vk/vk_raytracing_tutorial-master/cmake-build-debug/ray_tracing__before/cmake_install.cmake")
  include("/home/lidiane/CLionProjects/vk/vk_raytracing_tutorial-master/cmake-build-debug/ray_tracing__simple/cmake_install.cmake")
  include("/home/lidiane/CLionProjects/vk/vk_raytracing_tutorial-master/cmake-build-debug/ray_tracing_animation/cmake_install.cmake")
  include("/home/lidiane/CLionProjects/vk/vk_raytracing_tutorial-master/cmake-build-debug/ray_tracing_anyhit/cmake_install.cmake")
  include("/home/lidiane/CLionProjects/vk/vk_raytracing_tutorial-master/cmake-build-debug/ray_tracing_callable/cmake_install.cmake")
  include("/home/lidiane/CLionProjects/vk/vk_raytracing_tutorial-master/cmake-build-debug/ray_tracing_jitter_cam/cmake_install.cmake")
  include("/home/lidiane/CLionProjects/vk/vk_raytracing_tutorial-master/cmake-build-debug/ray_tracing_manyhits/cmake_install.cmake")
  include("/home/lidiane/CLionProjects/vk/vk_raytracing_tutorial-master/cmake-build-debug/ray_tracing_reflections/cmake_install.cmake")
  include("/home/lidiane/CLionProjects/vk/vk_raytracing_tutorial-master/cmake-build-debug/ray_tracing_instances/cmake_install.cmake")
  include("/home/lidiane/CLionProjects/vk/vk_raytracing_tutorial-master/cmake-build-debug/ray_tracing_intersection/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/lidiane/CLionProjects/vk/vk_raytracing_tutorial-master/cmake-build-debug/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
