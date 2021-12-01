cmake_minimum_required(VERSION 3.4)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/cmake")

# Options
option(BUILD_UTILITIES "Build the utilities" ON)

set(ARX_VERSION_MAJOR 1)
set(ARX_VERSION_MINOR 0)
set(ARX_VERSION_TINY  6)
set(ARX_VERSION_DEV   0)
set(ARX_VERSION_STRING "${ARX_VERSION_MAJOR}.${ARX_VERSION_MINOR}.${ARX_VERSION_TINY}")
math(EXPR ARX_VERSION_NUMBER "${ARX_VERSION_MAJOR}*1000000+${ARX_VERSION_MINOR}*10000+${ARX_VERSION_TINY}*100+${ARX_VERSION_DEV}")

set(CMAKE_CONFIGURATION_TYPES "Debug;Release" CACHE STRING "Specifies what build types (configurations) will be available." FORCE)
if(DEFINED CMAKE_BUILD_TYPE)
    set_property( CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS ${CMAKE_CONFIGURATION_TYPES} )
endif()

get_filename_component(PROJNAME ${CMAKE_CURRENT_SOURCE_DIR} NAME)
SET(PROJNAME vk_${PROJNAME}_NV)

Project(${PROJNAME})
Message(STATUS "-------------------------------")
Message(STATUS "Processing Project ${PROJNAME}:")

#####################################################################################

_add_project_definitions(${PROJNAME})


# Identify platform
if(${CMAKE_SYSTEM_NAME} MATCHES "iOS")
    set(ARX_PLATFORM_NAME "iOS")
elseif(${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
    if(${CMAKE_TOOLCHAIN_FILE} MATCHES "ios.toolchain.cmake")
        set(ARX_PLATFORM_NAME "iOS")
    else()
        set(ARX_PLATFORM_NAME "macOS")
    endif()
elseif(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
    set(ARX_PLATFORM_NAME "Linux")
elseif(${CMAKE_SYSTEM_NAME} MATCHES "Android")
    set(ARX_PLATFORM_NAME "Android")
elseif(${CMAKE_SYSTEM_NAME} MATCHES "Windows")
    set(ARX_PLATFORM_NAME "Windows")
else()
    message(FATAL_ERROR "Unsupported platform \"${CMAKE_SYSTEM_NAME}\".")
endif()
string(TOUPPER ${ARX_PLATFORM_NAME} ARX_PLATFORM_NAME_UC)
string(TOLOWER ${ARX_PLATFORM_NAME} ARX_PLATFORM_NAME_LC)
set(ARX_TARGET_PLATFORM_${ARX_PLATFORM_NAME_UC} ON)
if(ARX_TARGET_PLATFORM_VARIANT)
    set(ARX_PLATFORM_NAME_FILESYSTEM "${ARX_PLATFORM_NAME_LC}-${ARX_TARGET_PLATFORM_VARIANT}")
else()
    set(ARX_PLATFORM_NAME_FILESYSTEM "${ARX_PLATFORM_NAME_LC}")
endif()

# Set supported platform and SDK.
if (ARX_TARGET_PLATFORM_IOS)
    set(CMAKE_XCODE_ATTRIBUTE_IPHONEOS_DEPLOYMENT_TARGET "8.0" CACHE STRING "Code will load on this and later versions of iOS.")
elseif(ARX_TARGET_PLATFORM_MACOS)
    set(CMAKE_OSX_DEPLOYMENT_TARGET "10.9" CACHE STRING "Code will load on this and later versions of macOS." FORCE)
    execute_process(COMMAND /usr/bin/xcrun -sdk macosx --show-sdk-path OUTPUT_VARIABLE CMAKE_OSX_SYSROOT OUTPUT_STRIP_TRAILING_WHITESPACE)
    set(CMAKE_OSX_SYSROOT "${CMAKE_OSX_SYSROOT}" CACHE STRING "The product will be built against the headers and libraries located inside the indicated SDK." FORCE)
endif()

# Add project-wide definitions.
add_definitions("-DARX_TARGET_PLATFORM_${ARX_PLATFORM_NAME_UC}=1")
if(CMAKE_CONFIGURATION_TYPES)
    # Definitions for multi-configuration generator, e.g. Xcode, Visual Studio.
    set_property(DIRECTORY APPEND PROPERTY
            COMPILE_DEFINITIONS $<$<CONFIG:Debug>:DEBUG=1>
            )
else()
    # Definitions for single-configuration generator, e.g. Makefiles.
    if (${CMAKE_BUILD_TYPE} MATCHES "Debug")
        add_definitions("-DDEBUG=1")
    endif()
endif()

set(ARTOOLKITX_HOME "${CMAKE_CURRENT_SOURCE_DIR}")

add_definitions("-DARX_TARGET_PLATFORM_LINUX=1")

if (${CMAKE_BUILD_TYPE} MATCHES "Debug")
    add_definitions("-DDEBUG=1")
endif()

# Search prefix.
list(APPEND CMAKE_MODULE_PATH "${ARTOOLKITX_HOME}/arxSource/cmake")
if(ARX_TARGET_PLATFORM_VARIANT)
    list(APPEND CMAKE_FIND_ROOT_PATH "${ARTOOLKITX_HOME}/arxSource/depends/linux-${ARX_TARGET_PLATFORM_VARIANT}")
else()
    list(APPEND CMAKE_FIND_ROOT_PATH "${ARTOOLKITX_HOME}/arxSource/depends/linux")
endif()
if ("${ARX_TARGET_PLATFORM_VARIANT}" STREQUAL "raspbian")
    list(APPEND CMAKE_FIND_ROOT_PATH "/opt/vc/")
    set(GL_PREFER_EMBEDDED 1)
endif()

#####################################################################################
# Source files for this project
#
file(GLOB SOURCE_FILES *.cpp *.hpp *.inl *.h *.c)
file(GLOB EXTRA_COMMON "../common/*.*")
list(APPEND COMMON_SOURCE_FILES ${EXTRA_COMMON})
include_directories("../common")

find_package(OpenCV REQUIRED)
find_package(OpenGL)
find_package(OpenGLES2)
find_package(OpenGL3)
if ((OPENGL_FOUND OR OpenGL3_FOUND) AND OPENGLES2_FOUND)
    if(GL_PREFER_EMBEDDED)
        set(OPENGL_FOUND 0)
        set(OpenGL3_FOUND 0)
        message(STATUS "Opting for embedded OpenGL")
    else()
        set(OPENGLES2_FOUND 0)
        message(STATUS "Opting for desktop OpenGL. Set GL_PREFER_EMBEDDED to change.")
    endif()
endif()

include(${ARTOOLKITX_HOME}/SDK/lib/ARX/ARX.cmake)

if ("${ARX_TARGET_PLATFORM_VARIANT}" STREQUAL "raspbian")
    if(ARX_TARGET_DEVICE_RASPBERRY_PI_2_MODEL_B)
        set(DEVICE_FLAGS "-march=armv7-a+neon-vfpv4 -mtune=cortex-a7 -mfpu=neon-vfpv4 -mfloat-abi=hard -ftree-vectorize")
        set(HAVE_ARM_NEON 1)
    elseif(ARX_TARGET_DEVICE_RASPBERRY_PI_3)
        set(DEVICE_FLAGS "-march=armv8-a+crc -mtune=cortex-a53 -mfpu=crypto-neon-fp-armv8 -mfloat-abi=hard -ftree-vectorize")
        set(HAVE_ARM64_NEON 1)
    else()
        set(DEVICE_FLAGS "-march=armv6z -mtune=arm1176jzf-s -mfpu=vfp -mfloat-abi=hard")
    endif()
else()
    set(DEVICE_FLAGS "-march=core2")
endif()
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${DEVICE_FLAGS} -DGL_GLEXT_PROTOTYPES=1 -fPIC")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${DEVICE_FLAGS} -DGL_GLEXT_PROTOTYPES=1 -fPIC")

# For gcc < 5, ensure C99 compliance. (As of gcc v5, gnu11 is the default.)
if(CMAKE_COMPILER_IS_GNUCXX)
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -std=gnu11")
endif()

add_definitions("-DARX_TARGET_PLATFORM_LINUX=1")

if (${CMAKE_BUILD_TYPE} MATCHES "Debug")
    add_definitions("-DDEBUG=1")
endif()


#####################################################################################
# GLSL to SPIR-V custom build
#
# more than one file can be given: _compile_GLSL("GLSL_mesh.vert;GLSL_mesh.frag" "GLSL_mesh.spv" GLSL_SOURCES)
# the SpirV validator is fine as long as files are for different pipeline stages (entry points still need to be main())
#_compile_GLSL(<source(s)> <target spv> <LIST where files are appended>)
SET(VULKAN_TARGET_ENV vulkan1.2)

UNSET(GLSL_SOURCES)
UNSET(SPV_OUTPUT)
file(GLOB_RECURSE GLSL_HEADER_FILES "shaders/*.h" "shaders/*.glsl")
file(GLOB_RECURSE GLSL_SOURCE_FILES
    "shaders/*.comp"
    "shaders/*.frag"
    "shaders/*.vert"
    "shaders/*.rchit"
    "shaders/*.rahit"
    "shaders/*.rint"
    "shaders/*.rmiss"
    "shaders/*.rgen"
    "shaders/*.rcall"
    )
foreach(GLSL ${GLSL_SOURCE_FILES})
    get_filename_component(FILE_NAME ${GLSL} NAME)
    _compile_GLSL(${GLSL} "shaders/${FILE_NAME}.spv" GLSL_SOURCES SPV_OUTPUT)
endforeach(GLSL)

list(APPEND GLSL_SOURCES ${GLSL_HEADER_FILES})
source_group(Shader_Files FILES ${GLSL_SOURCES})


#####################################################################################
# Executable
#
# if(WIN32 AND NOT GLUT_FOUND)
#   add_definitions(/wd4996) #remove printf warning
#   add_definitions(/wd4244) #remove double to float conversion warning
#   add_definitions(/wd4305) #remove double to float truncation warning
# else()
#   add_definitions(-fpermissive)
# endif()
add_executable(${PROJNAME} ${SOURCE_FILES} ${COMMON_SOURCE_FILES} ${PACKAGE_SOURCE_FILES} ${GLSL_SOURCES} ${CUDA_FILES} ${CUBIN_SOURCES})

#####################################################################################
# common source code needed for this sample
#
source_group(common FILES 
  ${COMMON_SOURCE_FILES}
  ${PACKAGE_SOURCE_FILES}
)
source_group("Source Files" FILES ${SOURCE_FILES})

# if(UNIX)
#   set(UNIXLINKLIBS dl pthread)
# else()
#   set(UNIXLINKLIBS)
# endif()

add_dependencies(${PROJECT_NAME} ARX)

#####################################################################################
# Linkage
#
target_link_libraries(${PROJNAME} ${PLATFORM_LIBRARIES} shared_sources ARX ${OpenCV_LIBS})

if(OPENGL_FOUND)
    target_include_directories(${PROJECT_NAME} PRIVATE ${OPENGL_INCLUDE_DIR})
endif()
if(OPENGLES2_FOUND)
    target_include_directories(${PROJECT_NAME} PRIVATE ${OPENGLES2_INCLUDE_DIR})
endif()
if(OpenGL3_FOUND)
    target_include_directories(${PROJECT_NAME} PRIVATE ${OpenGL3_INCLUDE_PATH})
endif()

foreach(DEBUGLIB ${LIBRARIES_DEBUG})
  target_link_libraries(${PROJNAME} debug ${DEBUGLIB})
endforeach(DEBUGLIB)

foreach(RELEASELIB ${LIBRARIES_OPTIMIZED})
  target_link_libraries(${PROJNAME} optimized ${RELEASELIB})
endforeach(RELEASELIB)

#####################################################################################
# copies binaries that need to be put next to the exe files (ZLib, etc.)
#
_copy_binaries_to_target( ${PROJNAME} )


install(FILES ${SPV_OUTPUT} CONFIGURATIONS Release DESTINATION "bin_${ARCH}/${PROJNAME}/shaders")
install(FILES ${SPV_OUTPUT} CONFIGURATIONS Debug DESTINATION "bin_${ARCH}_debug/${PROJNAME}/shaders")
install(FILES ${CUBIN_SOURCES} CONFIGURATIONS Release DESTINATION "bin_${ARCH}/${PROJNAME}")
install(FILES ${CUBIN_SOURCES} CONFIGURATIONS Debug DESTINATION "bin_${ARCH}_debug/${PROJNAME}")
install(DIRECTORY "../media" CONFIGURATIONS Release DESTINATION "bin_${ARCH}/${PROJNAME}")
install(DIRECTORY "../media" CONFIGURATIONS Debug DESTINATION "bin_${ARCH}_debug/${PROJNAME}")
