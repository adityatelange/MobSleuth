#!/usr/bin/env bash
#
# This script is part of the MobSleuth project.
# https://github.com/adityatelange/MobSleuth
#
# This script installs JADX on the system.

GREEN='\033[0;32m'
NC='\033[0m' # No Color
WORKING_DIR=$HOME/MobSleuth
TAG=$(cat $WORKING_DIR/src/mobsleuth.default.conf | grep "APKTOOL_TAG" | cut -d'=' -f2 | cut -d'v' -f2)

echo $TAG
echo -e "${GREEN}[#] APK TOOL${NC}"
mkdir -p $WORKING_DIR/tools/apktool
wget --show-progress -O $WORKING_DIR/tools/apktool/apktool.jar "https://github.com/iBotPeaches/Apktool/releases/download/v${TAG}/apktool_${TAG}.jar"
wget --show-progress -O $WORKING_DIR/tools/apktool/apktool.sh "https://raw.githubusercontent.com/iBotPeaches/Apktool/v${TAG}/scripts/linux/apktool"

ln -sf $WORKING_DIR/tools/apktool/apktool.jar $HOME/.local/bin/apktool.jar
ln -sf $WORKING_DIR/tools/apktool/apktool.sh $HOME/.local/bin/apktool

chmod +x $HOME/.local/bin/apktool

echo -e "${GREEN}[+] Done!${NC}"
