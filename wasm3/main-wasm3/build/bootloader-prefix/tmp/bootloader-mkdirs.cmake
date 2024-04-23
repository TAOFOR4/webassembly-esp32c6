# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/opt/esp/v5.2.1/esp-idf/components/bootloader/subproject"
  "/home/tao/Desktop/webassembly-experiments/webassembly-esp32c6/wasm3/main-wasm3/build/bootloader"
  "/home/tao/Desktop/webassembly-experiments/webassembly-esp32c6/wasm3/main-wasm3/build/bootloader-prefix"
  "/home/tao/Desktop/webassembly-experiments/webassembly-esp32c6/wasm3/main-wasm3/build/bootloader-prefix/tmp"
  "/home/tao/Desktop/webassembly-experiments/webassembly-esp32c6/wasm3/main-wasm3/build/bootloader-prefix/src/bootloader-stamp"
  "/home/tao/Desktop/webassembly-experiments/webassembly-esp32c6/wasm3/main-wasm3/build/bootloader-prefix/src"
  "/home/tao/Desktop/webassembly-experiments/webassembly-esp32c6/wasm3/main-wasm3/build/bootloader-prefix/src/bootloader-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/home/tao/Desktop/webassembly-experiments/webassembly-esp32c6/wasm3/main-wasm3/build/bootloader-prefix/src/bootloader-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/home/tao/Desktop/webassembly-experiments/webassembly-esp32c6/wasm3/main-wasm3/build/bootloader-prefix/src/bootloader-stamp${cfgdir}") # cfgdir has leading slash
endif()
