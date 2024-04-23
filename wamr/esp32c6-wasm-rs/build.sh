#!/bin/bash

# Compile the Rust code to WASM using optimized settings
rustc -C debuginfo=0 -C opt-level=3 -C panic=abort -C link-self-contained=no -C link-args=-zstack-size=32768 -C link-args=--no-entry --target wasm32-wasi main.rs

# Check if compilation was successful
if [ $? -ne 0 ]; then
    echo "Compilation failed"
    exit 1
fi

echo "Optimize the WASM binary"
wasm-opt -Oz main.wasm -o main.wasm

# Check if wasm-opt operation was successful
if [ $? -ne 0 ]; then
    echo "Failed to optimize WASM"
    exit 1
fi

echo "Generate readable wasm file"
wasm2wat main.wasm -o readable_module.wat

# Check if the wasm2wat conversion was successful
if [ $? -ne 0 ]; then
    echo "Failed to convert WASM to WAT"
    exit 1
fi

echo "Generate C header file from the optimized WASM"
xxd -i main.wasm ../c_header/test_wasm.h

# Check if the xxd operation was successful
if [ $? -ne 0 ]; then
    echo "Failed to generate C header file"
    exit 1
fi

echo "Done"
