# webassembly-esp32c6
This is a experiment for running wasm (webassembly) on esp32c6.

## webassembly runtime
[wasm-micro-runtime ](https://github.com/bytecodealliance/wasm-micro-runtime) has supported ESP32 ,ESP32C3 ,ESP32S3 ,ESP32C6

## Hardware selection
I am using ESP32C6 :)

ESP32 ,ESP32C3 ,ESP32S3 also works.

## Software setup
- Setup `esp-idf` toolchain using the instructions [here](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/get-started/linux-macos-setup.html). Make sure that you add `IDF_PATH` to your user profile as mentioned [here](https://docs.espressif.com/projects/esp-idf/en/v3.3.1/get-started/add-idf_path-to-profile.html).
- Clone `wasm-micro-runtime` from [here](https://github.com/bytecodealliance/wasm-micro-runtime). Set `WAMR_PATH` to this path in your user profile.
- Install `wasi-sdk` as mentioned [here](https://github.com/WebAssembly/wasi-sdk).
    - Its okay to use release downloads but it didn't work for me on Linux. I had to compile it.
    - Set `WASI_SDK_PATH` in your profile correctly to the folder where the artifacts are untar'ed.### Software setup
- Setup `esp-idf` toolchain using the instructions [here](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/get-started/linux-macos-setup.html). Make sure that you add `IDF_PATH` to your user profile as mentioned [here](https://docs.espressif.com/projects/esp-idf/en/v3.3.1/get-started/add-idf_path-to-profile.html).
- Clone `wasm-micro-runtime` from [here](https://github.com/bytecodealliance/wasm-micro-runtime). Set `WAMR_PATH` to this path in your user profile.
- Install `wasi-sdk` as mentioned [here](https://github.com/WebAssembly/wasi-sdk).
    - Its okay to use release downloads but it didn't work for me on Linux. I had to compile it.
    - Set `WASI_SDK_PATH` in your profile correctly to the folder where the artifacts are untar'ed.


## Tutorial


### Step 1: Init

Remember to bring esp-idf into path,
```
$ export $IDF_PATH/export.sh
```

Clone this repo,
```
$ git clone https://github.com/TAOFOR4/webassembly-esp32c6.git
$ cd hello-wasm-esp32
```

### Step 2.a: Build wasm binary using clang
```
$ cd hello-wasm
$ ./build.sh; cd ..
```

### Step 2.b: Build wasm binary using Rust instead
```
$ cd hello-wasm-rs
$ ./build.sh; cd ..
```

### Step 3: Build IDF image and flash it

```
$ ./build_and_run.sh
```

### Step 4: Check logs
```
$ idf.py monitor
```
