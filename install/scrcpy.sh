#!/usr/bin/env bash

GREEN='\033[0;32m'
NC='\033[0m' # No Color
WORKING_DIR=$HOME/MobSleuth


echo -e "${GREEN}[#] SCRCPY${NC}"

mkdir -p $WORKING_DIR/installers
echo -e "${GREEN}[+] Installing deps...${NC}"
sudo apt install --no-install-recommends -yqq \
    ffmpeg libsdl2-2.0-0 adb wget \
    gcc git pkg-config meson ninja-build libsdl2-dev \
    libavcodec-dev libavdevice-dev libavformat-dev libavutil-dev \
    libswresample-dev libusb-1.0-0 libusb-1.0-0-dev
rm -rf  $WORKING_DIR/installers/scrcpy
echo -e "${GREEN}[+] Cloning scrcpy src...${NC}"
git clone https://github.com/Genymobile/scrcpy --depth=1 --branch "master" --progress $WORKING_DIR/installers/scrcpy

cd $WORKING_DIR/installers/scrcpy
echo -e "${GREEN}[+] Installing scrcpy...${NC}"
bash install_release.sh

echo -e "${GREEN}[+] Done!${NC}"
