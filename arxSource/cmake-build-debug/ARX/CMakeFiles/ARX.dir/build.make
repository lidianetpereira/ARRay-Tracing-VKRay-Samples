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
include ARX/CMakeFiles/ARX.dir/depend.make

# Include the progress variables for this target.
include ARX/CMakeFiles/ARX.dir/progress.make

# Include the compile flags for this target's objects.
include ARX/CMakeFiles/ARX.dir/flags.make

ARX/CMakeFiles/ARX.dir/ARX_c.cpp.o: ARX/CMakeFiles/ARX.dir/flags.make
ARX/CMakeFiles/ARX.dir/ARX_c.cpp.o: ../ARX/ARX_c.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object ARX/CMakeFiles/ARX.dir/ARX_c.cpp.o"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ARX.dir/ARX_c.cpp.o -c /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARX_c.cpp

ARX/CMakeFiles/ARX.dir/ARX_c.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ARX.dir/ARX_c.cpp.i"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARX_c.cpp > CMakeFiles/ARX.dir/ARX_c.cpp.i

ARX/CMakeFiles/ARX.dir/ARX_c.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ARX.dir/ARX_c.cpp.s"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARX_c.cpp -o CMakeFiles/ARX.dir/ARX_c.cpp.s

ARX/CMakeFiles/ARX.dir/ARController.cpp.o: ARX/CMakeFiles/ARX.dir/flags.make
ARX/CMakeFiles/ARX.dir/ARController.cpp.o: ../ARX/ARController.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object ARX/CMakeFiles/ARX.dir/ARController.cpp.o"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ARX.dir/ARController.cpp.o -c /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARController.cpp

ARX/CMakeFiles/ARX.dir/ARController.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ARX.dir/ARController.cpp.i"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARController.cpp > CMakeFiles/ARX.dir/ARController.cpp.i

ARX/CMakeFiles/ARX.dir/ARController.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ARX.dir/ARController.cpp.s"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARController.cpp -o CMakeFiles/ARX.dir/ARController.cpp.s

ARX/CMakeFiles/ARX.dir/ARTrackable.cpp.o: ARX/CMakeFiles/ARX.dir/flags.make
ARX/CMakeFiles/ARX.dir/ARTrackable.cpp.o: ../ARX/ARTrackable.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object ARX/CMakeFiles/ARX.dir/ARTrackable.cpp.o"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ARX.dir/ARTrackable.cpp.o -c /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARTrackable.cpp

ARX/CMakeFiles/ARX.dir/ARTrackable.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ARX.dir/ARTrackable.cpp.i"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARTrackable.cpp > CMakeFiles/ARX.dir/ARTrackable.cpp.i

ARX/CMakeFiles/ARX.dir/ARTrackable.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ARX.dir/ARTrackable.cpp.s"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARTrackable.cpp -o CMakeFiles/ARX.dir/ARTrackable.cpp.s

ARX/CMakeFiles/ARX.dir/ARPattern.cpp.o: ARX/CMakeFiles/ARX.dir/flags.make
ARX/CMakeFiles/ARX.dir/ARPattern.cpp.o: ../ARX/ARPattern.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object ARX/CMakeFiles/ARX.dir/ARPattern.cpp.o"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ARX.dir/ARPattern.cpp.o -c /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARPattern.cpp

ARX/CMakeFiles/ARX.dir/ARPattern.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ARX.dir/ARPattern.cpp.i"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARPattern.cpp > CMakeFiles/ARX.dir/ARPattern.cpp.i

ARX/CMakeFiles/ARX.dir/ARPattern.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ARX.dir/ARPattern.cpp.s"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARPattern.cpp -o CMakeFiles/ARX.dir/ARPattern.cpp.s

ARX/CMakeFiles/ARX.dir/ARTrackableMultiSquareAuto.cpp.o: ARX/CMakeFiles/ARX.dir/flags.make
ARX/CMakeFiles/ARX.dir/ARTrackableMultiSquareAuto.cpp.o: ../ARX/ARTrackableMultiSquareAuto.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object ARX/CMakeFiles/ARX.dir/ARTrackableMultiSquareAuto.cpp.o"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ARX.dir/ARTrackableMultiSquareAuto.cpp.o -c /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARTrackableMultiSquareAuto.cpp

ARX/CMakeFiles/ARX.dir/ARTrackableMultiSquareAuto.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ARX.dir/ARTrackableMultiSquareAuto.cpp.i"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARTrackableMultiSquareAuto.cpp > CMakeFiles/ARX.dir/ARTrackableMultiSquareAuto.cpp.i

ARX/CMakeFiles/ARX.dir/ARTrackableMultiSquareAuto.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ARX.dir/ARTrackableMultiSquareAuto.cpp.s"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARTrackableMultiSquareAuto.cpp -o CMakeFiles/ARX.dir/ARTrackableMultiSquareAuto.cpp.s

ARX/CMakeFiles/ARX.dir/ARTrackableMultiSquare.cpp.o: ARX/CMakeFiles/ARX.dir/flags.make
ARX/CMakeFiles/ARX.dir/ARTrackableMultiSquare.cpp.o: ../ARX/ARTrackableMultiSquare.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object ARX/CMakeFiles/ARX.dir/ARTrackableMultiSquare.cpp.o"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ARX.dir/ARTrackableMultiSquare.cpp.o -c /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARTrackableMultiSquare.cpp

ARX/CMakeFiles/ARX.dir/ARTrackableMultiSquare.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ARX.dir/ARTrackableMultiSquare.cpp.i"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARTrackableMultiSquare.cpp > CMakeFiles/ARX.dir/ARTrackableMultiSquare.cpp.i

ARX/CMakeFiles/ARX.dir/ARTrackableMultiSquare.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ARX.dir/ARTrackableMultiSquare.cpp.s"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARTrackableMultiSquare.cpp -o CMakeFiles/ARX.dir/ARTrackableMultiSquare.cpp.s

ARX/CMakeFiles/ARX.dir/ARTrackableNFT.cpp.o: ARX/CMakeFiles/ARX.dir/flags.make
ARX/CMakeFiles/ARX.dir/ARTrackableNFT.cpp.o: ../ARX/ARTrackableNFT.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object ARX/CMakeFiles/ARX.dir/ARTrackableNFT.cpp.o"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ARX.dir/ARTrackableNFT.cpp.o -c /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARTrackableNFT.cpp

ARX/CMakeFiles/ARX.dir/ARTrackableNFT.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ARX.dir/ARTrackableNFT.cpp.i"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARTrackableNFT.cpp > CMakeFiles/ARX.dir/ARTrackableNFT.cpp.i

ARX/CMakeFiles/ARX.dir/ARTrackableNFT.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ARX.dir/ARTrackableNFT.cpp.s"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARTrackableNFT.cpp -o CMakeFiles/ARX.dir/ARTrackableNFT.cpp.s

ARX/CMakeFiles/ARX.dir/ARTrackable2d.cpp.o: ARX/CMakeFiles/ARX.dir/flags.make
ARX/CMakeFiles/ARX.dir/ARTrackable2d.cpp.o: ../ARX/ARTrackable2d.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object ARX/CMakeFiles/ARX.dir/ARTrackable2d.cpp.o"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ARX.dir/ARTrackable2d.cpp.o -c /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARTrackable2d.cpp

ARX/CMakeFiles/ARX.dir/ARTrackable2d.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ARX.dir/ARTrackable2d.cpp.i"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARTrackable2d.cpp > CMakeFiles/ARX.dir/ARTrackable2d.cpp.i

ARX/CMakeFiles/ARX.dir/ARTrackable2d.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ARX.dir/ARTrackable2d.cpp.s"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARTrackable2d.cpp -o CMakeFiles/ARX.dir/ARTrackable2d.cpp.s

ARX/CMakeFiles/ARX.dir/ARTrackableSquare.cpp.o: ARX/CMakeFiles/ARX.dir/flags.make
ARX/CMakeFiles/ARX.dir/ARTrackableSquare.cpp.o: ../ARX/ARTrackableSquare.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object ARX/CMakeFiles/ARX.dir/ARTrackableSquare.cpp.o"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ARX.dir/ARTrackableSquare.cpp.o -c /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARTrackableSquare.cpp

ARX/CMakeFiles/ARX.dir/ARTrackableSquare.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ARX.dir/ARTrackableSquare.cpp.i"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARTrackableSquare.cpp > CMakeFiles/ARX.dir/ARTrackableSquare.cpp.i

ARX/CMakeFiles/ARX.dir/ARTrackableSquare.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ARX.dir/ARTrackableSquare.cpp.s"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARTrackableSquare.cpp -o CMakeFiles/ARX.dir/ARTrackableSquare.cpp.s

ARX/CMakeFiles/ARX.dir/ARTracker.cpp.o: ARX/CMakeFiles/ARX.dir/flags.make
ARX/CMakeFiles/ARX.dir/ARTracker.cpp.o: ../ARX/ARTracker.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object ARX/CMakeFiles/ARX.dir/ARTracker.cpp.o"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ARX.dir/ARTracker.cpp.o -c /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARTracker.cpp

ARX/CMakeFiles/ARX.dir/ARTracker.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ARX.dir/ARTracker.cpp.i"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARTracker.cpp > CMakeFiles/ARX.dir/ARTracker.cpp.i

ARX/CMakeFiles/ARX.dir/ARTracker.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ARX.dir/ARTracker.cpp.s"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARTracker.cpp -o CMakeFiles/ARX.dir/ARTracker.cpp.s

ARX/CMakeFiles/ARX.dir/ARTrackerNFT.cpp.o: ARX/CMakeFiles/ARX.dir/flags.make
ARX/CMakeFiles/ARX.dir/ARTrackerNFT.cpp.o: ../ARX/ARTrackerNFT.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building CXX object ARX/CMakeFiles/ARX.dir/ARTrackerNFT.cpp.o"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ARX.dir/ARTrackerNFT.cpp.o -c /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARTrackerNFT.cpp

ARX/CMakeFiles/ARX.dir/ARTrackerNFT.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ARX.dir/ARTrackerNFT.cpp.i"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARTrackerNFT.cpp > CMakeFiles/ARX.dir/ARTrackerNFT.cpp.i

ARX/CMakeFiles/ARX.dir/ARTrackerNFT.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ARX.dir/ARTrackerNFT.cpp.s"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARTrackerNFT.cpp -o CMakeFiles/ARX.dir/ARTrackerNFT.cpp.s

ARX/CMakeFiles/ARX.dir/ARTracker2d.cpp.o: ARX/CMakeFiles/ARX.dir/flags.make
ARX/CMakeFiles/ARX.dir/ARTracker2d.cpp.o: ../ARX/ARTracker2d.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building CXX object ARX/CMakeFiles/ARX.dir/ARTracker2d.cpp.o"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ARX.dir/ARTracker2d.cpp.o -c /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARTracker2d.cpp

ARX/CMakeFiles/ARX.dir/ARTracker2d.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ARX.dir/ARTracker2d.cpp.i"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARTracker2d.cpp > CMakeFiles/ARX.dir/ARTracker2d.cpp.i

ARX/CMakeFiles/ARX.dir/ARTracker2d.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ARX.dir/ARTracker2d.cpp.s"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARTracker2d.cpp -o CMakeFiles/ARX.dir/ARTracker2d.cpp.s

ARX/CMakeFiles/ARX.dir/ARTrackerSquare.cpp.o: ARX/CMakeFiles/ARX.dir/flags.make
ARX/CMakeFiles/ARX.dir/ARTrackerSquare.cpp.o: ../ARX/ARTrackerSquare.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building CXX object ARX/CMakeFiles/ARX.dir/ARTrackerSquare.cpp.o"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ARX.dir/ARTrackerSquare.cpp.o -c /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARTrackerSquare.cpp

ARX/CMakeFiles/ARX.dir/ARTrackerSquare.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ARX.dir/ARTrackerSquare.cpp.i"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARTrackerSquare.cpp > CMakeFiles/ARX.dir/ARTrackerSquare.cpp.i

ARX/CMakeFiles/ARX.dir/ARTrackerSquare.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ARX.dir/ARTrackerSquare.cpp.s"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARTrackerSquare.cpp -o CMakeFiles/ARX.dir/ARTrackerSquare.cpp.s

ARX/CMakeFiles/ARX.dir/ARVideoSource.cpp.o: ARX/CMakeFiles/ARX.dir/flags.make
ARX/CMakeFiles/ARX.dir/ARVideoSource.cpp.o: ../ARX/ARVideoSource.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Building CXX object ARX/CMakeFiles/ARX.dir/ARVideoSource.cpp.o"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ARX.dir/ARVideoSource.cpp.o -c /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARVideoSource.cpp

ARX/CMakeFiles/ARX.dir/ARVideoSource.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ARX.dir/ARVideoSource.cpp.i"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARVideoSource.cpp > CMakeFiles/ARX.dir/ARVideoSource.cpp.i

ARX/CMakeFiles/ARX.dir/ARVideoSource.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ARX.dir/ARVideoSource.cpp.s"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARVideoSource.cpp -o CMakeFiles/ARX.dir/ARVideoSource.cpp.s

ARX/CMakeFiles/ARX.dir/ARVideoView.cpp.o: ARX/CMakeFiles/ARX.dir/flags.make
ARX/CMakeFiles/ARX.dir/ARVideoView.cpp.o: ../ARX/ARVideoView.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_15) "Building CXX object ARX/CMakeFiles/ARX.dir/ARVideoView.cpp.o"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ARX.dir/ARVideoView.cpp.o -c /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARVideoView.cpp

ARX/CMakeFiles/ARX.dir/ARVideoView.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ARX.dir/ARVideoView.cpp.i"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARVideoView.cpp > CMakeFiles/ARX.dir/ARVideoView.cpp.i

ARX/CMakeFiles/ARX.dir/ARVideoView.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ARX.dir/ARVideoView.cpp.s"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARVideoView.cpp -o CMakeFiles/ARX.dir/ARVideoView.cpp.s

ARX/CMakeFiles/ARX.dir/trackingSub.c.o: ARX/CMakeFiles/ARX.dir/flags.make
ARX/CMakeFiles/ARX.dir/trackingSub.c.o: ../ARX/trackingSub.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_16) "Building C object ARX/CMakeFiles/ARX.dir/trackingSub.c.o"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ARX.dir/trackingSub.c.o   -c /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/trackingSub.c

ARX/CMakeFiles/ARX.dir/trackingSub.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ARX.dir/trackingSub.c.i"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/trackingSub.c > CMakeFiles/ARX.dir/trackingSub.c.i

ARX/CMakeFiles/ARX.dir/trackingSub.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ARX.dir/trackingSub.c.s"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/trackingSub.c -o CMakeFiles/ARX.dir/trackingSub.c.s

ARX/CMakeFiles/ARX.dir/mapper.cpp.o: ARX/CMakeFiles/ARX.dir/flags.make
ARX/CMakeFiles/ARX.dir/mapper.cpp.o: ../ARX/mapper.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_17) "Building CXX object ARX/CMakeFiles/ARX.dir/mapper.cpp.o"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ARX.dir/mapper.cpp.o -c /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/mapper.cpp

ARX/CMakeFiles/ARX.dir/mapper.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ARX.dir/mapper.cpp.i"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/mapper.cpp > CMakeFiles/ARX.dir/mapper.cpp.i

ARX/CMakeFiles/ARX.dir/mapper.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ARX.dir/mapper.cpp.s"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/mapper.cpp -o CMakeFiles/ARX.dir/mapper.cpp.s

# Object files for target ARX
ARX_OBJECTS = \
"CMakeFiles/ARX.dir/ARX_c.cpp.o" \
"CMakeFiles/ARX.dir/ARController.cpp.o" \
"CMakeFiles/ARX.dir/ARTrackable.cpp.o" \
"CMakeFiles/ARX.dir/ARPattern.cpp.o" \
"CMakeFiles/ARX.dir/ARTrackableMultiSquareAuto.cpp.o" \
"CMakeFiles/ARX.dir/ARTrackableMultiSquare.cpp.o" \
"CMakeFiles/ARX.dir/ARTrackableNFT.cpp.o" \
"CMakeFiles/ARX.dir/ARTrackable2d.cpp.o" \
"CMakeFiles/ARX.dir/ARTrackableSquare.cpp.o" \
"CMakeFiles/ARX.dir/ARTracker.cpp.o" \
"CMakeFiles/ARX.dir/ARTrackerNFT.cpp.o" \
"CMakeFiles/ARX.dir/ARTracker2d.cpp.o" \
"CMakeFiles/ARX.dir/ARTrackerSquare.cpp.o" \
"CMakeFiles/ARX.dir/ARVideoSource.cpp.o" \
"CMakeFiles/ARX.dir/ARVideoView.cpp.o" \
"CMakeFiles/ARX.dir/trackingSub.c.o" \
"CMakeFiles/ARX.dir/mapper.cpp.o"

# External object files for target ARX
ARX_EXTERNAL_OBJECTS =

ARX/libARX.so.1.0.6: ARX/CMakeFiles/ARX.dir/ARX_c.cpp.o
ARX/libARX.so.1.0.6: ARX/CMakeFiles/ARX.dir/ARController.cpp.o
ARX/libARX.so.1.0.6: ARX/CMakeFiles/ARX.dir/ARTrackable.cpp.o
ARX/libARX.so.1.0.6: ARX/CMakeFiles/ARX.dir/ARPattern.cpp.o
ARX/libARX.so.1.0.6: ARX/CMakeFiles/ARX.dir/ARTrackableMultiSquareAuto.cpp.o
ARX/libARX.so.1.0.6: ARX/CMakeFiles/ARX.dir/ARTrackableMultiSquare.cpp.o
ARX/libARX.so.1.0.6: ARX/CMakeFiles/ARX.dir/ARTrackableNFT.cpp.o
ARX/libARX.so.1.0.6: ARX/CMakeFiles/ARX.dir/ARTrackable2d.cpp.o
ARX/libARX.so.1.0.6: ARX/CMakeFiles/ARX.dir/ARTrackableSquare.cpp.o
ARX/libARX.so.1.0.6: ARX/CMakeFiles/ARX.dir/ARTracker.cpp.o
ARX/libARX.so.1.0.6: ARX/CMakeFiles/ARX.dir/ARTrackerNFT.cpp.o
ARX/libARX.so.1.0.6: ARX/CMakeFiles/ARX.dir/ARTracker2d.cpp.o
ARX/libARX.so.1.0.6: ARX/CMakeFiles/ARX.dir/ARTrackerSquare.cpp.o
ARX/libARX.so.1.0.6: ARX/CMakeFiles/ARX.dir/ARVideoSource.cpp.o
ARX/libARX.so.1.0.6: ARX/CMakeFiles/ARX.dir/ARVideoView.cpp.o
ARX/libARX.so.1.0.6: ARX/CMakeFiles/ARX.dir/trackingSub.c.o
ARX/libARX.so.1.0.6: ARX/CMakeFiles/ARX.dir/mapper.cpp.o
ARX/libARX.so.1.0.6: ARX/CMakeFiles/ARX.dir/build.make
ARX/libARX.so.1.0.6: ARX/AR/libAR.a
ARX/libARX.so.1.0.6: ARX/ARVideo/libARVideo.a
ARX/libARX.so.1.0.6: ARX/ARUtil/libARUtil.a
ARX/libARX.so.1.0.6: ARX/ARG/libARG.a
ARX/libARX.so.1.0.6: /usr/lib/x86_64-linux-gnu/libGL.so
ARX/libARX.so.1.0.6: /usr/lib/x86_64-linux-gnu/libGLU.so
ARX/libARX.so.1.0.6: ARX/AR2/libAR2.a
ARX/libARX.so.1.0.6: ARX/KPM/libKPM.a
ARX/libARX.so.1.0.6: ARX/OCVT/libOCVT.a
ARX/libARX.so.1.0.6: /usr/lib/x86_64-linux-gnu/libcurl.so
ARX/libARX.so.1.0.6: /usr/lib/x86_64-linux-gnu/libz.so
ARX/libARX.so.1.0.6: /usr/lib/x86_64-linux-gnu/libopencv_calib3d.so
ARX/libARX.so.1.0.6: /usr/lib/x86_64-linux-gnu/libopencv_features2d.so
ARX/libARX.so.1.0.6: /usr/lib/x86_64-linux-gnu/libopencv_flann.so
ARX/libARX.so.1.0.6: /usr/lib/x86_64-linux-gnu/libopencv_highgui.so
ARX/libARX.so.1.0.6: /usr/lib/x86_64-linux-gnu/libopencv_videoio.so
ARX/libARX.so.1.0.6: /usr/lib/x86_64-linux-gnu/libopencv_imgcodecs.so
ARX/libARX.so.1.0.6: /usr/lib/x86_64-linux-gnu/libopencv_video.so
ARX/libARX.so.1.0.6: /usr/lib/x86_64-linux-gnu/libopencv_imgproc.so
ARX/libARX.so.1.0.6: /usr/lib/x86_64-linux-gnu/libopencv_core.so
ARX/libARX.so.1.0.6: /usr/lib/x86_64-linux-gnu/libjpeg.so
ARX/libARX.so.1.0.6: ARX/CMakeFiles/ARX.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_18) "Linking CXX shared library libARX.so"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ARX.dir/link.txt --verbose=$(VERBOSE)
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && $(CMAKE_COMMAND) -E cmake_symlink_library libARX.so.1.0.6 libARX.so.1 libARX.so

ARX/libARX.so.1: ARX/libARX.so.1.0.6
	@$(CMAKE_COMMAND) -E touch_nocreate ARX/libARX.so.1

ARX/libARX.so: ARX/libARX.so.1.0.6
	@$(CMAKE_COMMAND) -E touch_nocreate ARX/libARX.so

# Rule to build all files generated by this target.
ARX/CMakeFiles/ARX.dir/build: ARX/libARX.so

.PHONY : ARX/CMakeFiles/ARX.dir/build

ARX/CMakeFiles/ARX.dir/clean:
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX && $(CMAKE_COMMAND) -P CMakeFiles/ARX.dir/cmake_clean.cmake
.PHONY : ARX/CMakeFiles/ARX.dir/clean

ARX/CMakeFiles/ARX.dir/depend:
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/lidiane/CLionProjects/artoolkitx-master/Source /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/CMakeFiles/ARX.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : ARX/CMakeFiles/ARX.dir/depend

