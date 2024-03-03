#!/usr/bin/env bash
#
# This script sets the proxy for the Android emulator.

# check if adb devce is connected using adb devices command
if [ -z "$(adb devices | grep -v List)" ]; then
    echo -e "${GREEN}[+] No device connected${NC}"
    exit 1
fi

adb shell settings put global http_proxy "$(ip -f inet addr show enp0s3 | awk '/inet/ {print $2}' | cut -d/ -f1):8080"
