#!/bin/bash -e
rm -rf build
idf.py set-target "esp32C6"
idf.py build
idf.py flash