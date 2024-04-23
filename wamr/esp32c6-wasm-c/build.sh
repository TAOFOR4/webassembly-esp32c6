# Copyright (C) 2019 Intel Corporation.  All rights reserved.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

WAMR_DIR=${PWD}/../../..

echo "Build wasm app .."
$WASI_SDK_PATH/bin/clang -O3 \
        -z stack-size=4096 -Wl,--initial-memory=65536 \
        -o test.wasm main.c \
        -Wl,--export=main -Wl,--export=__main_argc_argv \
        -Wl,--export=__data_end -Wl,--export=__heap_base \
        -Wl,--strip-all,--no-entry \
        -Wl,--allow-undefined \
        -nostdlib \

echo "Generate readable wasm file"
wasm2wat main.wasm -o readable_module.wat


echo "Build binarydump tool .."
rm -fr build && mkdir build && cd build
cmake $WAMR_PATH/test-tools/binarydump-tool
make
cd ..

echo "Generate test_wasm.h .."
./build/binarydump -o ../c_header/test_wasm.h -n wasm_test_file_interp test.wasm

# echo "Generate main_wasm.h .."
# xxd -i main.wasm ../c_header/test_wasm.h

echo "Done"






