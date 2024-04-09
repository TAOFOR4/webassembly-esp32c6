
#!/bin/bash

# Compile Rust code to WebAssembly
echo "Compiling Rust code to WebAssembly..."
# 32kb stack size
rustc -C opt-level=z -C lto -C codegen-units=1 -C panic=abort -C link-self-contained=no -C link-args=-zstack-size=32768 -C link-args=--no-entry --target wasm32-wasi main.rs 

wasm-opt -Oz main.wasm -o main_optimized.wasm


# Build the binarydump tool
echo "Building binarydump tool..."
rm -fr build && mkdir build && cd build
cmake $WAMR_PATH/test-tools/binarydump-tool 
make 
cd ..

# Generate C header from the WASM binary
echo "Generating C header..."
./build/binarydump -o ../main/test_wasm.h -n wasm_test_file_interp ../main_optimized.wasm 

echo "Done"
