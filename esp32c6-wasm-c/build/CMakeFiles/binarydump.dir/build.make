# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.24

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/tao/.espressif/tools/cmake/3.24.0/bin/cmake

# The command to remove a file.
RM = /home/tao/.espressif/tools/cmake/3.24.0/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/tao/wasm-micro-runtime/test-tools/binarydump-tool

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/tao/Desktop/webassembly-experiments/webassembly-esp32c6/esp32c6-wasm-c/build

# Include any dependencies generated for this target.
include CMakeFiles/binarydump.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/binarydump.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/binarydump.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/binarydump.dir/flags.make

CMakeFiles/binarydump.dir/binarydump.c.o: CMakeFiles/binarydump.dir/flags.make
CMakeFiles/binarydump.dir/binarydump.c.o: /home/tao/wasm-micro-runtime/test-tools/binarydump-tool/binarydump.c
CMakeFiles/binarydump.dir/binarydump.c.o: CMakeFiles/binarydump.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/tao/Desktop/webassembly-experiments/webassembly-esp32c6/esp32c6-wasm-c/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/binarydump.dir/binarydump.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/binarydump.dir/binarydump.c.o -MF CMakeFiles/binarydump.dir/binarydump.c.o.d -o CMakeFiles/binarydump.dir/binarydump.c.o -c /home/tao/wasm-micro-runtime/test-tools/binarydump-tool/binarydump.c

CMakeFiles/binarydump.dir/binarydump.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/binarydump.dir/binarydump.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/tao/wasm-micro-runtime/test-tools/binarydump-tool/binarydump.c > CMakeFiles/binarydump.dir/binarydump.c.i

CMakeFiles/binarydump.dir/binarydump.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/binarydump.dir/binarydump.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/tao/wasm-micro-runtime/test-tools/binarydump-tool/binarydump.c -o CMakeFiles/binarydump.dir/binarydump.c.s

# Object files for target binarydump
binarydump_OBJECTS = \
"CMakeFiles/binarydump.dir/binarydump.c.o"

# External object files for target binarydump
binarydump_EXTERNAL_OBJECTS =

binarydump: CMakeFiles/binarydump.dir/binarydump.c.o
binarydump: CMakeFiles/binarydump.dir/build.make
binarydump: CMakeFiles/binarydump.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/tao/Desktop/webassembly-experiments/webassembly-esp32c6/esp32c6-wasm-c/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable binarydump"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/binarydump.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/binarydump.dir/build: binarydump
.PHONY : CMakeFiles/binarydump.dir/build

CMakeFiles/binarydump.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/binarydump.dir/cmake_clean.cmake
.PHONY : CMakeFiles/binarydump.dir/clean

CMakeFiles/binarydump.dir/depend:
	cd /home/tao/Desktop/webassembly-experiments/webassembly-esp32c6/esp32c6-wasm-c/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/tao/wasm-micro-runtime/test-tools/binarydump-tool /home/tao/wasm-micro-runtime/test-tools/binarydump-tool /home/tao/Desktop/webassembly-experiments/webassembly-esp32c6/esp32c6-wasm-c/build /home/tao/Desktop/webassembly-experiments/webassembly-esp32c6/esp32c6-wasm-c/build /home/tao/Desktop/webassembly-experiments/webassembly-esp32c6/esp32c6-wasm-c/build/CMakeFiles/binarydump.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/binarydump.dir/depend

