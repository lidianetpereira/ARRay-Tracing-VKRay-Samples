# Install script for directory: /home/lidiane/CLionProjects/vk/vk_raytracing_tutorial-master/ray_tracing_animation

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

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin_x64/vk_ray_tracing_animation_NV.exe" AND
       NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin_x64/vk_ray_tracing_animation_NV.exe")
      file(RPATH_CHECK
           FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin_x64/vk_ray_tracing_animation_NV.exe"
           RPATH "")
    endif()
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin_x64" TYPE EXECUTABLE FILES "/home/lidiane/CLionProjects/vk/bin_x64/vk_ray_tracing_animation_NV.exe")
    if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin_x64/vk_ray_tracing_animation_NV.exe" AND
       NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin_x64/vk_ray_tracing_animation_NV.exe")
      file(RPATH_CHANGE
           FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin_x64/vk_ray_tracing_animation_NV.exe"
           OLD_RPATH "/usr/local/lib:"
           NEW_RPATH "")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin_x64/vk_ray_tracing_animation_NV.exe")
      endif()
    endif()
  endif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin_x64_debug/vk_ray_tracing_animation_NV.exe" AND
       NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin_x64_debug/vk_ray_tracing_animation_NV.exe")
      file(RPATH_CHECK
           FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin_x64_debug/vk_ray_tracing_animation_NV.exe"
           RPATH "")
    endif()
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin_x64_debug" TYPE EXECUTABLE FILES "/home/lidiane/CLionProjects/vk/bin_x64/vk_ray_tracing_animation_NV.exe")
    if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin_x64_debug/vk_ray_tracing_animation_NV.exe" AND
       NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin_x64_debug/vk_ray_tracing_animation_NV.exe")
      file(RPATH_CHANGE
           FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin_x64_debug/vk_ray_tracing_animation_NV.exe"
           OLD_RPATH "/usr/local/lib:"
           NEW_RPATH "")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin_x64_debug/vk_ray_tracing_animation_NV.exe")
      endif()
    endif()
  endif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin_x64/vk_ray_tracing_animation_NV/shaders" TYPE FILE FILES
      "/home/lidiane/CLionProjects/vk/vk_raytracing_tutorial-master/ray_tracing_animation/shaders/anim.comp.spv"
      "/home/lidiane/CLionProjects/vk/vk_raytracing_tutorial-master/ray_tracing_animation/shaders/frag_shader.frag.spv"
      "/home/lidiane/CLionProjects/vk/vk_raytracing_tutorial-master/ray_tracing_animation/shaders/passthrough.vert.spv"
      "/home/lidiane/CLionProjects/vk/vk_raytracing_tutorial-master/ray_tracing_animation/shaders/post.frag.spv"
      "/home/lidiane/CLionProjects/vk/vk_raytracing_tutorial-master/ray_tracing_animation/shaders/raytrace.rchit.spv"
      "/home/lidiane/CLionProjects/vk/vk_raytracing_tutorial-master/ray_tracing_animation/shaders/raytrace.rgen.spv"
      "/home/lidiane/CLionProjects/vk/vk_raytracing_tutorial-master/ray_tracing_animation/shaders/raytrace.rmiss.spv"
      "/home/lidiane/CLionProjects/vk/vk_raytracing_tutorial-master/ray_tracing_animation/shaders/raytraceShadow.rmiss.spv"
      "/home/lidiane/CLionProjects/vk/vk_raytracing_tutorial-master/ray_tracing_animation/shaders/vert_shader.vert.spv"
      )
  endif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin_x64_debug/vk_ray_tracing_animation_NV/shaders" TYPE FILE FILES
      "/home/lidiane/CLionProjects/vk/vk_raytracing_tutorial-master/ray_tracing_animation/shaders/anim.comp.spv"
      "/home/lidiane/CLionProjects/vk/vk_raytracing_tutorial-master/ray_tracing_animation/shaders/frag_shader.frag.spv"
      "/home/lidiane/CLionProjects/vk/vk_raytracing_tutorial-master/ray_tracing_animation/shaders/passthrough.vert.spv"
      "/home/lidiane/CLionProjects/vk/vk_raytracing_tutorial-master/ray_tracing_animation/shaders/post.frag.spv"
      "/home/lidiane/CLionProjects/vk/vk_raytracing_tutorial-master/ray_tracing_animation/shaders/raytrace.rchit.spv"
      "/home/lidiane/CLionProjects/vk/vk_raytracing_tutorial-master/ray_tracing_animation/shaders/raytrace.rgen.spv"
      "/home/lidiane/CLionProjects/vk/vk_raytracing_tutorial-master/ray_tracing_animation/shaders/raytrace.rmiss.spv"
      "/home/lidiane/CLionProjects/vk/vk_raytracing_tutorial-master/ray_tracing_animation/shaders/raytraceShadow.rmiss.spv"
      "/home/lidiane/CLionProjects/vk/vk_raytracing_tutorial-master/ray_tracing_animation/shaders/vert_shader.vert.spv"
      )
  endif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin_x64/vk_ray_tracing_animation_NV" TYPE DIRECTORY FILES "/home/lidiane/CLionProjects/vk/vk_raytracing_tutorial-master/ray_tracing_animation/../media")
  endif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin_x64_debug/vk_ray_tracing_animation_NV" TYPE DIRECTORY FILES "/home/lidiane/CLionProjects/vk/vk_raytracing_tutorial-master/ray_tracing_animation/../media")
  endif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
endif()

