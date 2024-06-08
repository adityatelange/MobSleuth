#!/usr/bin/env bash
#
# This script is part of the MobSleuth project.
# https://github.com/adityatelange/MobSleuth
#
# This script installs JADX on the system.

GREEN='\033[0;32m'
NC='\033[0m' # No Color
WORKING_DIR=$HOME/MobSleuth
TAG=$(cat $WORKING_DIR/src/mobsleuth.default.conf | grep "JADX_TAG" | cut -d'=' -f2)


echo -e "${GREEN}[#] JADX${NC}"

mkdir -p $WORKING_DIR/tools
wget --show-progress -O $WORKING_DIR/tools/jadx-$TAG.zip "https://github.com/skylot/jadx/releases/download/v${TAG}/jadx-${TAG}.zip"
unzip -o -d $WORKING_DIR/tools/jadx $WORKING_DIR/tools/jadx-$TAG.zip
rm $WORKING_DIR/tools/jadx-*.zip

ln -s $WORKING_DIR/tools/jadx/bin/jadx $HOME/.local/bin/jadx
ln -s $WORKING_DIR/tools/jadx/bin/jadx-gui $HOME/.local/bin/jadx-gui

echo -e "${GREEN}[+] Done!${NC}"
echo -e "${GREEN}[+] jadx and jadx-gui are now available in your PATH${NC}"
