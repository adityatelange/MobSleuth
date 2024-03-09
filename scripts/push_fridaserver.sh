#!/usr/bin/env bash
#
# This script is part of the MobSleuth project.
# https://github.com/adityatelange/MobSleuth
#
# This script pushes fria server to the device.
# The frida server is saved in the $WORKING_DIR/tools directory.
# The frida server is pushed to /data/local/tmp/ on the device.

GREEN='\033[0;32m'
NC='\033[0m' # No Color
WORKING_DIR=$HOME/MobSleuth
TAG=$(cat $WORKING_DIR/src/mobsleuth.default.conf | grep "FRIDA_SERVER_TAG" | cut -d'=' -f2)

# check if adb devce is connected using adb devices command
if [ -z "$(adb devices | grep -v List)" ]; then
    echo -e "${GREEN}[+] No device connected${NC}"
    exit 1
fi

echo -e "${GREEN}[+] Pushing frida-server-$TAG ${NC}"

adb push $WORKING_DIR/tools/frida-server-$TAG-android-x86_64 /data/local/tmp/frida-server-$TAG
adb shell chmod +x /data/local/tmp/frida-server-$TAG

echo -e "${GREEN}[+] Done!${NC} Use run_fridaserver.sh to start the frida server."
