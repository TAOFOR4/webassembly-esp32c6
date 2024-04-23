#!/bin/bash

echo "Building WASM app..."
$WASI_SDK_PATH/bin/clang -O3 \
    -z stack-size=4096 -Wl,--initial-memory=65536 \
    -o main.wasm main.c \
    -Wl,--export=fib \
    -Wl,--strip-all -Wl,--no-entry \
    -Wl,--allow-undefined \
    -nostdlib
#-Wl,--export=matrixMultiply \ export multiple functions


echo "Generate readable wasm file"
wasm2wat main.wasm -o readable_module.wat



echo "Generate main_wasm.h .."
xxd -i main.wasm ../c_header/test_wasm.h

echo "Done"

