# webassembly-esp32c6
This is a experiment for running wasm (webassembly) on esp32c6.

## webassembly runtime
1. [wasm-micro-runtime ](https://github.com/bytecodealliance/wasm-micro-runtime) has supported ESP32 ,ESP32C3 ,ESP32S3 ,ESP32C6
2. [wasm3](https://github.com/wasm3/wasm3/tree/main) has supported ESP32 ,ESP32C3 ,ESP32S3 ,ESP32C6

## Hardware selection
I am using ESP32C6 :)

ESP32 ,ESP32C3 ,ESP32S3 also works.

## Software setup

### wamr
- Setup `esp-idf` toolchain using the instructions [here](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/get-started/linux-macos-setup.html). Make sure that you add `IDF_PATH` to your user profile as mentioned [here](https://docs.espressif.com/projects/esp-idf/en/v3.3.1/get-started/add-idf_path-to-profile.html).
- Clone `wasm-micro-runtime` from [here](https://github.com/bytecodealliance/wasm-micro-runtime). Set `WAMR_PATH` to this path in your user profile.
- Install `wasi-sdk` as mentioned [here](https://github.com/WebAssembly/wasi-sdk).
    - Its okay to use release downloads but it didn't work for me on Linux. I had to compile it.
    - Set `WASI_SDK_PATH` in your profile correctly to the folder where the artifacts are untar'ed.### Software setup


### wasm3
- Setup `esp-idf` toolchain using the instructions [here](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/get-started/linux-macos-setup.html). Make sure that you add `IDF_PATH` to your user profile as mentioned [here](https://docs.espressif.com/projects/esp-idf/en/v3.3.1/get-started/add-idf_path-to-profile.html).
- Clone Wasm3 engine `git clone --depth=1 https://github.com/wasm3/wasm3.git ./wasm3`
 Set `WASM3_PATH` to this path in your user profile.
- Install `wasi-sdk` as mentioned [here](https://github.com/WebAssembly/wasi-sdk).
    - Its okay to use release downloads but it didn't work for me on Linux. I had to compile it.
    - Set `WASI_SDK_PATH` in your profile correctly to the folder where the artifacts are untar'ed.### Software setup



## Tutorial

### WAMR

#### Step 1: Init

Remember to bring esp-idf into path,
```
$ export $IDF_PATH/export.sh
```

Clone this repo,
```
$ git clone https://github.com/TAOFOR4/webassembly-esp32c6.git
$ cd wamr
```

#### Step 2.a: Build wasm binary using clang
```
$ cd esp32c6-wasm-c
$ ./build.sh; cd ..
```

#### Step 2.b: Build wasm binary using Rust instead
```
$ cd esp32c6-wasm-rs
$ ./build.sh; cd ..
```

#### Step 3: Build IDF image and flash it

```
$ ./build_and_run.sh
```

#### Step 4: Check logs
```
$ idf.py monitor
```

### WASM3
#### Step 1: Init

Remember to bring esp-idf into path,
```
$ export $IDF_PATH/export.sh
```

Clone this repo,
```
$ git clone https://github.com/TAOFOR4/webassembly-esp32c6.git
$ cd wasm3
```

#### Step 2.a: Build wasm binary using clang
```
$ cd esp32c6-wasm-c
$ ./build.sh; cd ..
```

#### Step 2.b: Build wasm binary using Rust instead
```
$ cd esp32c6-wasm-rs
$ ./build.sh; cd ..
```

#### Step 3: Build IDF image and flash it

```
$ ./build_and_run.sh
```

#### Step 4: Check logs
```
$ idf.py monitor
```

## Result analysis

### Execution time measurement
```
$ python capture_execution_time.py
```
Then check the output file 'capture_execution_time.txt'

### Memory storage measurement
```
$ python capture_memory_storage.py
```
Then check the output file 'capture_memory_storage.txt'

### Energy consumption measurement

Still ongoing. Two methods:
1. The easiest approach would be to let the device run and monitor your battery voltage, something similar to [here](https://youtu.be/auiSyk2TEjE?list=PL7aXQYRxV3CyFQ91YNUJk4Hl6IIblR_CP)
2. The more advanced way would be to invest in a device which can measure the current so that the user can do the calculation and estimate the power consumption. An example of using [Power Profiler Kit II from Nordic](https://youtu.be/LUB8RWzzLWc?list=PLOZhYVJgDmNRMSsoeJaM2o1eCSjZr4ckF)

