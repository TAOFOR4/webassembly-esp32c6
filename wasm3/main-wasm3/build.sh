## Build for ESP-IDF

source $IDF_PATH/export.sh

idf.py menuconfig

# Select target:
idf.py set-target esp32c6
#idf.py set-target esp32s2
#idf.py --preview set-target esp32c3

idf.py build

idf.py -p /dev/ttyUSB0 flash monitor


