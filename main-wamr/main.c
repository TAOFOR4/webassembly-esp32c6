/*
 * Copyright (C) 2019-21 Intel Corporation and others.  All rights reserved.
 * SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
 */

#include <stdio.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "wasm_export.h"
#include "bh_platform.h"
#include "c_header/test_wasm.h"
#include "esp_timer.h" // Include the ESP timer library

#include "esp_log.h"

#define LOG_TAG "wamr"

static void *app_instance_main(wasm_module_inst_t module_inst)
{
    const char *exception;

    wasm_application_execute_main(module_inst, 0, NULL);
    if ((exception = wasm_runtime_get_exception(module_inst)))
        printf("%s\n", exception);
    return NULL;
}

void *iwasm_main(void *arg)
{
    (void)arg; // unused
    // setup variables for instantiating and running the wasm module
    uint8_t *wasm_file_buf = NULL;
    unsigned wasm_file_buf_size = 0;
    wasm_module_t wasm_module = NULL;
    wasm_module_inst_t wasm_module_inst = NULL;
    char error_buf[128];
    void *ret;
    RuntimeInitArgs init_args;

    // configure memory allocation
    memset(&init_args, 0, sizeof(RuntimeInitArgs));
    init_args.mem_alloc_type = Alloc_With_Allocator;
    init_args.mem_alloc_option.allocator.malloc_func = (void *)os_malloc;
    init_args.mem_alloc_option.allocator.realloc_func = (void *)os_realloc;
    init_args.mem_alloc_option.allocator.free_func = (void *)os_free;

    ESP_LOGI(LOG_TAG, "Initialize WASM runtime");
    // initialize runtime environment
    if (!wasm_runtime_full_init(&init_args))
    {
        ESP_LOGE(LOG_TAG, "Init runtime failed.");
        return NULL;
    }

    ESP_LOGI(LOG_TAG, "Run wamr with interpreter");

    wasm_file_buf = (uint8_t *)main_wasm;
    wasm_file_buf_size = sizeof(main_wasm);
    // wasm_file_buf_size = main_wasm_len;

    // load WASM module
    if (!(wasm_module = wasm_runtime_load(wasm_file_buf, wasm_file_buf_size,
                                          error_buf, sizeof(error_buf))))
    {
        ESP_LOGE(LOG_TAG, "Error in wasm_runtime_load: %s", error_buf);
        goto fail1interp;
    }

    ESP_LOGI(LOG_TAG, "Instantiate WASM runtime");
    if (!(wasm_module_inst =
              wasm_runtime_instantiate(wasm_module, 32 * 1024, // stack size
                                       32 * 1024,              // heap size
                                       error_buf, sizeof(error_buf))))
    {
        ESP_LOGE(LOG_TAG, "Error while instantiating: %s", error_buf);
        goto fail2interp;
    }

    int64_t startTime = esp_timer_get_time(); // Capture start time

    ESP_LOGI(LOG_TAG, "run main() of the application");
    ret = app_instance_main(wasm_module_inst);
    assert(!ret);

    int64_t endTime = esp_timer_get_time();      // Capture end time
    int64_t executionTime = endTime - startTime; // Calculate execution time
    ESP_LOGI(LOG_TAG, "Execution time: %lld microseconds", executionTime);

    // destroy the module instance
    ESP_LOGI(LOG_TAG, "Deinstantiate WASM runtime");
    wasm_runtime_deinstantiate(wasm_module_inst);

fail2interp:
    // unload the module
    ESP_LOGI(LOG_TAG, "Unload WASM module");
    wasm_runtime_unload(wasm_module);

fail1interp:
    // destroy runtime environment
    ESP_LOGI(LOG_TAG, "Destroy WASM runtime");
    wasm_runtime_destroy();

    return NULL;
}

void app_main(void)
{
    pthread_t t;
    int res;

    pthread_attr_t tattr;
    pthread_attr_init(&tattr);
    pthread_attr_setdetachstate(&tattr, PTHREAD_CREATE_JOINABLE);
    pthread_attr_setstacksize(&tattr, 4096);

    res = pthread_create(&t, &tattr, iwasm_main, (void *)NULL);
    assert(res == 0);

    res = pthread_join(t, NULL);
    assert(res == 0);

    ESP_LOGI(LOG_TAG, "Exiting...");
}