//
//  Wasm3 - high performance WebAssembly interpreter written in C.
//
//  Copyright © 2019 Steven Massey, Volodymyr Shymanskyy.
//  All rights reserved.
//

#include "esp_system.h"
#include "esp_timer.h" // Include the esp_timer header for high-resolution timing
#include "esp_sleep.h"

#include <stdio.h>
#include <unistd.h>

#include "wasm3.h"

#include "../../c_header/test_wasm.h"

#define FATAL(msg, ...)                            \
    {                                              \
        printf("Fatal: " msg "\n", ##__VA_ARGS__); \
        return;                                    \
    }

static void run_wasm(void)
{
    M3Result result = m3Err_none;

    uint8_t *wasm = (uint8_t *)main_wasm;
    uint32_t fsize = main_wasm_len;

    printf("Loading WebAssembly...\n");
    IM3Environment env = m3_NewEnvironment();
    if (!env)
        FATAL("m3_NewEnvironment failed");

    IM3Runtime runtime = m3_NewRuntime(env, 1024, NULL);
    if (!runtime)
        FATAL("m3_NewRuntime failed");

    IM3Module module;
    result = m3_ParseModule(env, &module, wasm, fsize);
    if (result)
        FATAL("m3_ParseModule: %s", result);

    result = m3_LoadModule(runtime, module);
    if (result)
        FATAL("m3_LoadModule: %s", result);

    IM3Function f;
    result = m3_FindFunction(&f, runtime, "main");
    if (result)
        FATAL("m3_FindFunction: %s", result);

    printf("Running...\n");

    int64_t start = esp_timer_get_time(); // Start the timer

    result = m3_CallV(f);
    if (result)
        FATAL("m3_Call: %s", result);

    unsigned value = 0;
    result = m3_GetResultsV(f, &value);
    if (result)
        FATAL("m3_GetResults: %s", result);

    int64_t end = esp_timer_get_time(); // End the timer

    printf("Result: %u\n", value);
    printf("Elapsed: %lld ms\n", (end - start)); // microseconds
}

extern "C" void app_main(void)
{
    printf("\nWasm3 v" M3_VERSION " on " CONFIG_IDF_TARGET ", build " __DATE__ " " __TIME__ "\n");

    sleep(5);

    run_wasm();

    sleep(5);

    esp_deep_sleep_start();
}
