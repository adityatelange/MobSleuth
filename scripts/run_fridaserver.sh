#!/usr/bin/env bash
#
# This script is part of the MobSleuth project.
# https://github.com/adityatelange/MobSleuth
#
# This script starts the frida server on the device.

GREEN='\033[0;32m'
NC='\033[0m' # No Color
WORKING_DIR=$HOME/MobSleuth
TAG=$(cat $WORKING_DIR/src/mobsleuth.default.conf | grep "FRIDA_SERVER_TAG" | cut -d'=' -f2)

# check if adb devce is connected using adb devices command
if [ -z "$(adb devices | grep -v List)" ]; then
    echo -e "${GREEN}[+] No device connected${NC}"
    exit 1
fi

echo -e "${GREEN}[+] Starting frida-server${NC}"

adb shell /data/local/tmp/frida-server-$TAG -D &
echo -e "${GREEN}[+] Done!${NC}"
