#!/usr/bin/env bash
#
# This script installs Frida on the system.

GREEN='\033[0;32m'
NC='\033[0m' # No Color
WORKING_DIR=$HOME/MobSleuth


echo -e "${GREEN}[#] FRIDA${NC}"

pip3 install frida-tools
mkdir -p $WORKING_DIR/tools
wget --show-progress -O $WORKING_DIR/tools/frida-server-16.2.1-android-x86_64.xz "https://github.com/frida/frida/releases/download/16.2.1/frida-server-16.2.1-android-x86_64.xz"
wget --show-progress -O $WORKING_DIR/tools/frida-server-16.2.1-android-x86.xz "https://github.com/frida/frida/releases/download/16.2.1/frida-server-16.2.1-android-x86.xz"
xz -f -d $WORKING_DIR/tools/frida-server*.xz

echo -e "${GREEN}[+] Done!${NC}"