# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.15

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/lidiane/Downloads/CLion-2019.3.5/clion-2019.3.5/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /home/lidiane/Downloads/CLion-2019.3.5/clion-2019.3.5/bin/cmake/linux/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/lidiane/CLionProjects/artoolkitx-master/Source

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug

# Include any dependencies generated for this target.
include ARX/ARVideo/CMakeFiles/ARVideo.dir/depend.make

# Include the progress variables for this target.
include ARX/ARVideo/CMakeFiles/ARVideo.dir/progress.make

# Include the compile flags for this target's objects.
include ARX/ARVideo/CMakeFiles/ARVideo.dir/flags.make

ARX/ARVideo/CMakeFiles/ARVideo.dir/cparamSearch.c.o: ARX/ARVideo/CMakeFiles/ARVideo.dir/flags.make
ARX/ARVideo/CMakeFiles/ARVideo.dir/cparamSearch.c.o: ../ARX/ARVideo/cparamSearch.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object ARX/ARVideo/CMakeFiles/ARVideo.dir/cparamSearch.c.o"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARVideo && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ARVideo.dir/cparamSearch.c.o   -c /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARVideo/cparamSearch.c

ARX/ARVideo/CMakeFiles/ARVideo.dir/cparamSearch.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ARVideo.dir/cparamSearch.c.i"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARVideo && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARVideo/cparamSearch.c > CMakeFiles/ARVideo.dir/cparamSearch.c.i

ARX/ARVideo/CMakeFiles/ARVideo.dir/cparamSearch.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ARVideo.dir/cparamSearch.c.s"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARVideo && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARVideo/cparamSearch.c -o CMakeFiles/ARVideo.dir/cparamSearch.c.s

ARX/ARVideo/CMakeFiles/ARVideo.dir/nxjson.c.o: ARX/ARVideo/CMakeFiles/ARVideo.dir/flags.make
ARX/ARVideo/CMakeFiles/ARVideo.dir/nxjson.c.o: ../ARX/ARVideo/nxjson.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object ARX/ARVideo/CMakeFiles/ARVideo.dir/nxjson.c.o"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARVideo && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ARVideo.dir/nxjson.c.o   -c /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARVideo/nxjson.c

ARX/ARVideo/CMakeFiles/ARVideo.dir/nxjson.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ARVideo.dir/nxjson.c.i"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARVideo && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARVideo/nxjson.c > CMakeFiles/ARVideo.dir/nxjson.c.i

ARX/ARVideo/CMakeFiles/ARVideo.dir/nxjson.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ARVideo.dir/nxjson.c.s"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARVideo && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARVideo/nxjson.c -o CMakeFiles/ARVideo.dir/nxjson.c.s

ARX/ARVideo/CMakeFiles/ARVideo.dir/video.c.o: ARX/ARVideo/CMakeFiles/ARVideo.dir/flags.make
ARX/ARVideo/CMakeFiles/ARVideo.dir/video.c.o: ../ARX/ARVideo/video.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object ARX/ARVideo/CMakeFiles/ARVideo.dir/video.c.o"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARVideo && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ARVideo.dir/video.c.o   -c /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARVideo/video.c

ARX/ARVideo/CMakeFiles/ARVideo.dir/video.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ARVideo.dir/video.c.i"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARVideo && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARVideo/video.c > CMakeFiles/ARVideo.dir/video.c.i

ARX/ARVideo/CMakeFiles/ARVideo.dir/video.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ARVideo.dir/video.c.s"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARVideo && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARVideo/video.c -o CMakeFiles/ARVideo.dir/video.c.s

ARX/ARVideo/CMakeFiles/ARVideo.dir/video2.c.o: ARX/ARVideo/CMakeFiles/ARVideo.dir/flags.make
ARX/ARVideo/CMakeFiles/ARVideo.dir/video2.c.o: ../ARX/ARVideo/video2.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object ARX/ARVideo/CMakeFiles/ARVideo.dir/video2.c.o"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARVideo && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ARVideo.dir/video2.c.o   -c /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARVideo/video2.c

ARX/ARVideo/CMakeFiles/ARVideo.dir/video2.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ARVideo.dir/video2.c.i"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARVideo && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARVideo/video2.c > CMakeFiles/ARVideo.dir/video2.c.i

ARX/ARVideo/CMakeFiles/ARVideo.dir/video2.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ARVideo.dir/video2.c.s"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARVideo && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARVideo/video2.c -o CMakeFiles/ARVideo.dir/video2.c.s

ARX/ARVideo/CMakeFiles/ARVideo.dir/videoAspectRatio.c.o: ARX/ARVideo/CMakeFiles/ARVideo.dir/flags.make
ARX/ARVideo/CMakeFiles/ARVideo.dir/videoAspectRatio.c.o: ../ARX/ARVideo/videoAspectRatio.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object ARX/ARVideo/CMakeFiles/ARVideo.dir/videoAspectRatio.c.o"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARVideo && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ARVideo.dir/videoAspectRatio.c.o   -c /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARVideo/videoAspectRatio.c

ARX/ARVideo/CMakeFiles/ARVideo.dir/videoAspectRatio.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ARVideo.dir/videoAspectRatio.c.i"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARVideo && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARVideo/videoAspectRatio.c > CMakeFiles/ARVideo.dir/videoAspectRatio.c.i

ARX/ARVideo/CMakeFiles/ARVideo.dir/videoAspectRatio.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ARVideo.dir/videoAspectRatio.c.s"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARVideo && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARVideo/videoAspectRatio.c -o CMakeFiles/ARVideo.dir/videoAspectRatio.c.s

ARX/ARVideo/CMakeFiles/ARVideo.dir/videoLuma.c.o: ARX/ARVideo/CMakeFiles/ARVideo.dir/flags.make
ARX/ARVideo/CMakeFiles/ARVideo.dir/videoLuma.c.o: ../ARX/ARVideo/videoLuma.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object ARX/ARVideo/CMakeFiles/ARVideo.dir/videoLuma.c.o"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARVideo && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ARVideo.dir/videoLuma.c.o   -c /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARVideo/videoLuma.c

ARX/ARVideo/CMakeFiles/ARVideo.dir/videoLuma.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ARVideo.dir/videoLuma.c.i"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARVideo && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARVideo/videoLuma.c > CMakeFiles/ARVideo.dir/videoLuma.c.i

ARX/ARVideo/CMakeFiles/ARVideo.dir/videoLuma.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ARVideo.dir/videoLuma.c.s"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARVideo && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARVideo/videoLuma.c -o CMakeFiles/ARVideo.dir/videoLuma.c.s

ARX/ARVideo/CMakeFiles/ARVideo.dir/videoRGBA.c.o: ARX/ARVideo/CMakeFiles/ARVideo.dir/flags.make
ARX/ARVideo/CMakeFiles/ARVideo.dir/videoRGBA.c.o: ../ARX/ARVideo/videoRGBA.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object ARX/ARVideo/CMakeFiles/ARVideo.dir/videoRGBA.c.o"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARVideo && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ARVideo.dir/videoRGBA.c.o   -c /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARVideo/videoRGBA.c

ARX/ARVideo/CMakeFiles/ARVideo.dir/videoRGBA.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ARVideo.dir/videoRGBA.c.i"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARVideo && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARVideo/videoRGBA.c > CMakeFiles/ARVideo.dir/videoRGBA.c.i

ARX/ARVideo/CMakeFiles/ARVideo.dir/videoRGBA.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ARVideo.dir/videoRGBA.c.s"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARVideo && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARVideo/videoRGBA.c -o CMakeFiles/ARVideo.dir/videoRGBA.c.s

ARX/ARVideo/CMakeFiles/ARVideo.dir/videoSaveImage.c.o: ARX/ARVideo/CMakeFiles/ARVideo.dir/flags.make
ARX/ARVideo/CMakeFiles/ARVideo.dir/videoSaveImage.c.o: ../ARX/ARVideo/videoSaveImage.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building C object ARX/ARVideo/CMakeFiles/ARVideo.dir/videoSaveImage.c.o"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARVideo && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ARVideo.dir/videoSaveImage.c.o   -c /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARVideo/videoSaveImage.c

ARX/ARVideo/CMakeFiles/ARVideo.dir/videoSaveImage.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ARVideo.dir/videoSaveImage.c.i"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARVideo && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARVideo/videoSaveImage.c > CMakeFiles/ARVideo.dir/videoSaveImage.c.i

ARX/ARVideo/CMakeFiles/ARVideo.dir/videoSaveImage.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ARVideo.dir/videoSaveImage.c.s"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARVideo && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARVideo/videoSaveImage.c -o CMakeFiles/ARVideo.dir/videoSaveImage.c.s

ARX/ARVideo/CMakeFiles/ARVideo.dir/Dummy/videoDummy.c.o: ARX/ARVideo/CMakeFiles/ARVideo.dir/flags.make
ARX/ARVideo/CMakeFiles/ARVideo.dir/Dummy/videoDummy.c.o: ../ARX/ARVideo/Dummy/videoDummy.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building C object ARX/ARVideo/CMakeFiles/ARVideo.dir/Dummy/videoDummy.c.o"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARVideo && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ARVideo.dir/Dummy/videoDummy.c.o   -c /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARVideo/Dummy/videoDummy.c

ARX/ARVideo/CMakeFiles/ARVideo.dir/Dummy/videoDummy.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ARVideo.dir/Dummy/videoDummy.c.i"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARVideo && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARVideo/Dummy/videoDummy.c > CMakeFiles/ARVideo.dir/Dummy/videoDummy.c.i

ARX/ARVideo/CMakeFiles/ARVideo.dir/Dummy/videoDummy.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ARVideo.dir/Dummy/videoDummy.c.s"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARVideo && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARVideo/Dummy/videoDummy.c -o CMakeFiles/ARVideo.dir/Dummy/videoDummy.c.s

ARX/ARVideo/CMakeFiles/ARVideo.dir/Image/videoImage.c.o: ARX/ARVideo/CMakeFiles/ARVideo.dir/flags.make
ARX/ARVideo/CMakeFiles/ARVideo.dir/Image/videoImage.c.o: ../ARX/ARVideo/Image/videoImage.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building C object ARX/ARVideo/CMakeFiles/ARVideo.dir/Image/videoImage.c.o"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARVideo && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ARVideo.dir/Image/videoImage.c.o   -c /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARVideo/Image/videoImage.c

ARX/ARVideo/CMakeFiles/ARVideo.dir/Image/videoImage.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ARVideo.dir/Image/videoImage.c.i"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARVideo && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARVideo/Image/videoImage.c > CMakeFiles/ARVideo.dir/Image/videoImage.c.i

ARX/ARVideo/CMakeFiles/ARVideo.dir/Image/videoImage.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ARVideo.dir/Image/videoImage.c.s"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARVideo && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARVideo/Image/videoImage.c -o CMakeFiles/ARVideo.dir/Image/videoImage.c.s

ARX/ARVideo/CMakeFiles/ARVideo.dir/Video4Linux2/videoV4L2.c.o: ARX/ARVideo/CMakeFiles/ARVideo.dir/flags.make
ARX/ARVideo/CMakeFiles/ARVideo.dir/Video4Linux2/videoV4L2.c.o: ../ARX/ARVideo/Video4Linux2/videoV4L2.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building C object ARX/ARVideo/CMakeFiles/ARVideo.dir/Video4Linux2/videoV4L2.c.o"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARVideo && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ARVideo.dir/Video4Linux2/videoV4L2.c.o   -c /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARVideo/Video4Linux2/videoV4L2.c

ARX/ARVideo/CMakeFiles/ARVideo.dir/Video4Linux2/videoV4L2.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ARVideo.dir/Video4Linux2/videoV4L2.c.i"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARVideo && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARVideo/Video4Linux2/videoV4L2.c > CMakeFiles/ARVideo.dir/Video4Linux2/videoV4L2.c.i

ARX/ARVideo/CMakeFiles/ARVideo.dir/Video4Linux2/videoV4L2.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ARVideo.dir/Video4Linux2/videoV4L2.c.s"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARVideo && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARVideo/Video4Linux2/videoV4L2.c -o CMakeFiles/ARVideo.dir/Video4Linux2/videoV4L2.c.s

ARX/ARVideo/CMakeFiles/ARVideo.dir/libdc1394/video1394.c.o: ARX/ARVideo/CMakeFiles/ARVideo.dir/flags.make
ARX/ARVideo/CMakeFiles/ARVideo.dir/libdc1394/video1394.c.o: ../ARX/ARVideo/libdc1394/video1394.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building C object ARX/ARVideo/CMakeFiles/ARVideo.dir/libdc1394/video1394.c.o"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARVideo && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ARVideo.dir/libdc1394/video1394.c.o   -c /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARVideo/libdc1394/video1394.c

ARX/ARVideo/CMakeFiles/ARVideo.dir/libdc1394/video1394.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ARVideo.dir/libdc1394/video1394.c.i"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARVideo && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARVideo/libdc1394/video1394.c > CMakeFiles/ARVideo.dir/libdc1394/video1394.c.i

ARX/ARVideo/CMakeFiles/ARVideo.dir/libdc1394/video1394.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ARVideo.dir/libdc1394/video1394.c.s"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARVideo && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARVideo/libdc1394/video1394.c -o CMakeFiles/ARVideo.dir/libdc1394/video1394.c.s

ARX/ARVideo/CMakeFiles/ARVideo.dir/libdc1394/video1394Format.c.o: ARX/ARVideo/CMakeFiles/ARVideo.dir/flags.make
ARX/ARVideo/CMakeFiles/ARVideo.dir/libdc1394/video1394Format.c.o: ../ARX/ARVideo/libdc1394/video1394Format.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building C object ARX/ARVideo/CMakeFiles/ARVideo.dir/libdc1394/video1394Format.c.o"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARVideo && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ARVideo.dir/libdc1394/video1394Format.c.o   -c /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARVideo/libdc1394/video1394Format.c

ARX/ARVideo/CMakeFiles/ARVideo.dir/libdc1394/video1394Format.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ARVideo.dir/libdc1394/video1394Format.c.i"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARVideo && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARVideo/libdc1394/video1394Format.c > CMakeFiles/ARVideo.dir/libdc1394/video1394Format.c.i

ARX/ARVideo/CMakeFiles/ARVideo.dir/libdc1394/video1394Format.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ARVideo.dir/libdc1394/video1394Format.c.s"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARVideo && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARVideo/libdc1394/video1394Format.c -o CMakeFiles/ARVideo.dir/libdc1394/video1394Format.c.s

ARX/ARVideo/CMakeFiles/ARVideo.dir/libdc1394/video1394Setting.c.o: ARX/ARVideo/CMakeFiles/ARVideo.dir/flags.make
ARX/ARVideo/CMakeFiles/ARVideo.dir/libdc1394/video1394Setting.c.o: ../ARX/ARVideo/libdc1394/video1394Setting.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Building C object ARX/ARVideo/CMakeFiles/ARVideo.dir/libdc1394/video1394Setting.c.o"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARVideo && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ARVideo.dir/libdc1394/video1394Setting.c.o   -c /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARVideo/libdc1394/video1394Setting.c

ARX/ARVideo/CMakeFiles/ARVideo.dir/libdc1394/video1394Setting.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ARVideo.dir/libdc1394/video1394Setting.c.i"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARVideo && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARVideo/libdc1394/video1394Setting.c > CMakeFiles/ARVideo.dir/libdc1394/video1394Setting.c.i

ARX/ARVideo/CMakeFiles/ARVideo.dir/libdc1394/video1394Setting.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ARVideo.dir/libdc1394/video1394Setting.c.s"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARVideo && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARVideo/libdc1394/video1394Setting.c -o CMakeFiles/ARVideo.dir/libdc1394/video1394Setting.c.s

ARX/ARVideo/CMakeFiles/ARVideo.dir/GStreamer/videoGStreamer.c.o: ARX/ARVideo/CMakeFiles/ARVideo.dir/flags.make
ARX/ARVideo/CMakeFiles/ARVideo.dir/GStreamer/videoGStreamer.c.o: ../ARX/ARVideo/GStreamer/videoGStreamer.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_15) "Building C object ARX/ARVideo/CMakeFiles/ARVideo.dir/GStreamer/videoGStreamer.c.o"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARVideo && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ARVideo.dir/GStreamer/videoGStreamer.c.o   -c /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARVideo/GStreamer/videoGStreamer.c

ARX/ARVideo/CMakeFiles/ARVideo.dir/GStreamer/videoGStreamer.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ARVideo.dir/GStreamer/videoGStreamer.c.i"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARVideo && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARVideo/GStreamer/videoGStreamer.c > CMakeFiles/ARVideo.dir/GStreamer/videoGStreamer.c.i

ARX/ARVideo/CMakeFiles/ARVideo.dir/GStreamer/videoGStreamer.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ARVideo.dir/GStreamer/videoGStreamer.c.s"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARVideo && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARVideo/GStreamer/videoGStreamer.c -o CMakeFiles/ARVideo.dir/GStreamer/videoGStreamer.c.s

# Object files for target ARVideo
ARVideo_OBJECTS = \
"CMakeFiles/ARVideo.dir/cparamSearch.c.o" \
"CMakeFiles/ARVideo.dir/nxjson.c.o" \
"CMakeFiles/ARVideo.dir/video.c.o" \
"CMakeFiles/ARVideo.dir/video2.c.o" \
"CMakeFiles/ARVideo.dir/videoAspectRatio.c.o" \
"CMakeFiles/ARVideo.dir/videoLuma.c.o" \
"CMakeFiles/ARVideo.dir/videoRGBA.c.o" \
"CMakeFiles/ARVideo.dir/videoSaveImage.c.o" \
"CMakeFiles/ARVideo.dir/Dummy/videoDummy.c.o" \
"CMakeFiles/ARVideo.dir/Image/videoImage.c.o" \
"CMakeFiles/ARVideo.dir/Video4Linux2/videoV4L2.c.o" \
"CMakeFiles/ARVideo.dir/libdc1394/video1394.c.o" \
"CMakeFiles/ARVideo.dir/libdc1394/video1394Format.c.o" \
"CMakeFiles/ARVideo.dir/libdc1394/video1394Setting.c.o" \
"CMakeFiles/ARVideo.dir/GStreamer/videoGStreamer.c.o"

# External object files for target ARVideo
ARVideo_EXTERNAL_OBJECTS =

ARX/ARVideo/libARVideo.a: ARX/ARVideo/CMakeFiles/ARVideo.dir/cparamSearch.c.o
ARX/ARVideo/libARVideo.a: ARX/ARVideo/CMakeFiles/ARVideo.dir/nxjson.c.o
ARX/ARVideo/libARVideo.a: ARX/ARVideo/CMakeFiles/ARVideo.dir/video.c.o
ARX/ARVideo/libARVideo.a: ARX/ARVideo/CMakeFiles/ARVideo.dir/video2.c.o
ARX/ARVideo/libARVideo.a: ARX/ARVideo/CMakeFiles/ARVideo.dir/videoAspectRatio.c.o
ARX/ARVideo/libARVideo.a: ARX/ARVideo/CMakeFiles/ARVideo.dir/videoLuma.c.o
ARX/ARVideo/libARVideo.a: ARX/ARVideo/CMakeFiles/ARVideo.dir/videoRGBA.c.o
ARX/ARVideo/libARVideo.a: ARX/ARVideo/CMakeFiles/ARVideo.dir/videoSaveImage.c.o
ARX/ARVideo/libARVideo.a: ARX/ARVideo/CMakeFiles/ARVideo.dir/Dummy/videoDummy.c.o
ARX/ARVideo/libARVideo.a: ARX/ARVideo/CMakeFiles/ARVideo.dir/Image/videoImage.c.o
ARX/ARVideo/libARVideo.a: ARX/ARVideo/CMakeFiles/ARVideo.dir/Video4Linux2/videoV4L2.c.o
ARX/ARVideo/libARVideo.a: ARX/ARVideo/CMakeFiles/ARVideo.dir/libdc1394/video1394.c.o
ARX/ARVideo/libARVideo.a: ARX/ARVideo/CMakeFiles/ARVideo.dir/libdc1394/video1394Format.c.o
ARX/ARVideo/libARVideo.a: ARX/ARVideo/CMakeFiles/ARVideo.dir/libdc1394/video1394Setting.c.o
ARX/ARVideo/libARVideo.a: ARX/ARVideo/CMakeFiles/ARVideo.dir/GStreamer/videoGStreamer.c.o
ARX/ARVideo/libARVideo.a: ARX/ARVideo/CMakeFiles/ARVideo.dir/build.make
ARX/ARVideo/libARVideo.a: ARX/ARVideo/CMakeFiles/ARVideo.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_16) "Linking C static library libARVideo.a"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARVideo && $(CMAKE_COMMAND) -P CMakeFiles/ARVideo.dir/cmake_clean_target.cmake
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARVideo && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ARVideo.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
ARX/ARVideo/CMakeFiles/ARVideo.dir/build: ARX/ARVideo/libARVideo.a

.PHONY : ARX/ARVideo/CMakeFiles/ARVideo.dir/build

ARX/ARVideo/CMakeFiles/ARVideo.dir/clean:
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARVideo && $(CMAKE_COMMAND) -P CMakeFiles/ARVideo.dir/cmake_clean.cmake
.PHONY : ARX/ARVideo/CMakeFiles/ARVideo.dir/clean

ARX/ARVideo/CMakeFiles/ARVideo.dir/depend:
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/lidiane/CLionProjects/artoolkitx-master/Source /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARVideo /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARVideo /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARVideo/CMakeFiles/ARVideo.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : ARX/ARVideo/CMakeFiles/ARVideo.dir/depend
