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
include ARX/ARG/CMakeFiles/ARG.dir/depend.make

# Include the progress variables for this target.
include ARX/ARG/CMakeFiles/ARG.dir/progress.make

# Include the compile flags for this target's objects.
include ARX/ARG/CMakeFiles/ARG.dir/flags.make

ARX/ARG/CMakeFiles/ARG.dir/arg.c.o: ARX/ARG/CMakeFiles/ARG.dir/flags.make
ARX/ARG/CMakeFiles/ARG.dir/arg.c.o: ../ARX/ARG/arg.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object ARX/ARG/CMakeFiles/ARG.dir/arg.c.o"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARG && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ARG.dir/arg.c.o   -c /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARG/arg.c

ARX/ARG/CMakeFiles/ARG.dir/arg.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ARG.dir/arg.c.i"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARG && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARG/arg.c > CMakeFiles/ARG.dir/arg.c.i

ARX/ARG/CMakeFiles/ARG.dir/arg.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ARG.dir/arg.c.s"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARG && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARG/arg.c -o CMakeFiles/ARG.dir/arg.c.s

ARX/ARG/CMakeFiles/ARG.dir/arg_gl.c.o: ARX/ARG/CMakeFiles/ARG.dir/flags.make
ARX/ARG/CMakeFiles/ARG.dir/arg_gl.c.o: ../ARX/ARG/arg_gl.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object ARX/ARG/CMakeFiles/ARG.dir/arg_gl.c.o"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARG && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ARG.dir/arg_gl.c.o   -c /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARG/arg_gl.c

ARX/ARG/CMakeFiles/ARG.dir/arg_gl.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ARG.dir/arg_gl.c.i"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARG && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARG/arg_gl.c > CMakeFiles/ARG.dir/arg_gl.c.i

ARX/ARG/CMakeFiles/ARG.dir/arg_gl.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ARG.dir/arg_gl.c.s"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARG && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARG/arg_gl.c -o CMakeFiles/ARG.dir/arg_gl.c.s

ARX/ARG/CMakeFiles/ARG.dir/arg_gles2.c.o: ARX/ARG/CMakeFiles/ARG.dir/flags.make
ARX/ARG/CMakeFiles/ARG.dir/arg_gles2.c.o: ../ARX/ARG/arg_gles2.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object ARX/ARG/CMakeFiles/ARG.dir/arg_gles2.c.o"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARG && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ARG.dir/arg_gles2.c.o   -c /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARG/arg_gles2.c

ARX/ARG/CMakeFiles/ARG.dir/arg_gles2.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ARG.dir/arg_gles2.c.i"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARG && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARG/arg_gles2.c > CMakeFiles/ARG.dir/arg_gles2.c.i

ARX/ARG/CMakeFiles/ARG.dir/arg_gles2.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ARG.dir/arg_gles2.c.s"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARG && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARG/arg_gles2.c -o CMakeFiles/ARG.dir/arg_gles2.c.s

ARX/ARG/CMakeFiles/ARG.dir/arg_gl3.c.o: ARX/ARG/CMakeFiles/ARG.dir/flags.make
ARX/ARG/CMakeFiles/ARG.dir/arg_gl3.c.o: ../ARX/ARG/arg_gl3.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object ARX/ARG/CMakeFiles/ARG.dir/arg_gl3.c.o"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARG && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ARG.dir/arg_gl3.c.o   -c /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARG/arg_gl3.c

ARX/ARG/CMakeFiles/ARG.dir/arg_gl3.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ARG.dir/arg_gl3.c.i"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARG && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARG/arg_gl3.c > CMakeFiles/ARG.dir/arg_gl3.c.i

ARX/ARG/CMakeFiles/ARG.dir/arg_gl3.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ARG.dir/arg_gl3.c.s"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARG && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARG/arg_gl3.c -o CMakeFiles/ARG.dir/arg_gl3.c.s

ARX/ARG/CMakeFiles/ARG.dir/mtx.c.o: ARX/ARG/CMakeFiles/ARG.dir/flags.make
ARX/ARG/CMakeFiles/ARG.dir/mtx.c.o: ../ARX/ARG/mtx.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object ARX/ARG/CMakeFiles/ARG.dir/mtx.c.o"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARG && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ARG.dir/mtx.c.o   -c /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARG/mtx.c

ARX/ARG/CMakeFiles/ARG.dir/mtx.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ARG.dir/mtx.c.i"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARG && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARG/mtx.c > CMakeFiles/ARG.dir/mtx.c.i

ARX/ARG/CMakeFiles/ARG.dir/mtx.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ARG.dir/mtx.c.s"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARG && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARG/mtx.c -o CMakeFiles/ARG.dir/mtx.c.s

ARX/ARG/CMakeFiles/ARG.dir/glStateCache2.c.o: ARX/ARG/CMakeFiles/ARG.dir/flags.make
ARX/ARG/CMakeFiles/ARG.dir/glStateCache2.c.o: ../ARX/ARG/glStateCache2.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object ARX/ARG/CMakeFiles/ARG.dir/glStateCache2.c.o"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARG && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ARG.dir/glStateCache2.c.o   -c /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARG/glStateCache2.c

ARX/ARG/CMakeFiles/ARG.dir/glStateCache2.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ARG.dir/glStateCache2.c.i"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARG && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARG/glStateCache2.c > CMakeFiles/ARG.dir/glStateCache2.c.i

ARX/ARG/CMakeFiles/ARG.dir/glStateCache2.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ARG.dir/glStateCache2.c.s"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARG && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARG/glStateCache2.c -o CMakeFiles/ARG.dir/glStateCache2.c.s

ARX/ARG/CMakeFiles/ARG.dir/shader_gl.c.o: ARX/ARG/CMakeFiles/ARG.dir/flags.make
ARX/ARG/CMakeFiles/ARG.dir/shader_gl.c.o: ../ARX/ARG/shader_gl.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object ARX/ARG/CMakeFiles/ARG.dir/shader_gl.c.o"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARG && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ARG.dir/shader_gl.c.o   -c /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARG/shader_gl.c

ARX/ARG/CMakeFiles/ARG.dir/shader_gl.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ARG.dir/shader_gl.c.i"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARG && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARG/shader_gl.c > CMakeFiles/ARG.dir/shader_gl.c.i

ARX/ARG/CMakeFiles/ARG.dir/shader_gl.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ARG.dir/shader_gl.c.s"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARG && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARG/shader_gl.c -o CMakeFiles/ARG.dir/shader_gl.c.s

# Object files for target ARG
ARG_OBJECTS = \
"CMakeFiles/ARG.dir/arg.c.o" \
"CMakeFiles/ARG.dir/arg_gl.c.o" \
"CMakeFiles/ARG.dir/arg_gles2.c.o" \
"CMakeFiles/ARG.dir/arg_gl3.c.o" \
"CMakeFiles/ARG.dir/mtx.c.o" \
"CMakeFiles/ARG.dir/glStateCache2.c.o" \
"CMakeFiles/ARG.dir/shader_gl.c.o"

# External object files for target ARG
ARG_EXTERNAL_OBJECTS =

ARX/ARG/libARG.a: ARX/ARG/CMakeFiles/ARG.dir/arg.c.o
ARX/ARG/libARG.a: ARX/ARG/CMakeFiles/ARG.dir/arg_gl.c.o
ARX/ARG/libARG.a: ARX/ARG/CMakeFiles/ARG.dir/arg_gles2.c.o
ARX/ARG/libARG.a: ARX/ARG/CMakeFiles/ARG.dir/arg_gl3.c.o
ARX/ARG/libARG.a: ARX/ARG/CMakeFiles/ARG.dir/mtx.c.o
ARX/ARG/libARG.a: ARX/ARG/CMakeFiles/ARG.dir/glStateCache2.c.o
ARX/ARG/libARG.a: ARX/ARG/CMakeFiles/ARG.dir/shader_gl.c.o
ARX/ARG/libARG.a: ARX/ARG/CMakeFiles/ARG.dir/build.make
ARX/ARG/libARG.a: ARX/ARG/CMakeFiles/ARG.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Linking C static library libARG.a"
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARG && $(CMAKE_COMMAND) -P CMakeFiles/ARG.dir/cmake_clean_target.cmake
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARG && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ARG.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
ARX/ARG/CMakeFiles/ARG.dir/build: ARX/ARG/libARG.a

.PHONY : ARX/ARG/CMakeFiles/ARG.dir/build

ARX/ARG/CMakeFiles/ARG.dir/clean:
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARG && $(CMAKE_COMMAND) -P CMakeFiles/ARG.dir/cmake_clean.cmake
.PHONY : ARX/ARG/CMakeFiles/ARG.dir/clean

ARX/ARG/CMakeFiles/ARG.dir/depend:
	cd /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/lidiane/CLionProjects/artoolkitx-master/Source /home/lidiane/CLionProjects/artoolkitx-master/Source/ARX/ARG /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARG /home/lidiane/CLionProjects/artoolkitx-master/Source/cmake-build-debug/ARX/ARG/CMakeFiles/ARG.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : ARX/ARG/CMakeFiles/ARG.dir/depend

