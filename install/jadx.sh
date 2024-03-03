#!/usr/bin/env bash
#
# This script installs JADX on the system.

GREEN='\033[0;32m'
NC='\033[0m' # No Color
WORKING_DIR=$HOME/MobSleuth


echo -e "${GREEN}[#] JADX${NC}"

mkdir -p $WORKING_DIR/tools
wget --show-progress -O $WORKING_DIR/tools/jadx-1.4.7.zip "https://github.com/skylot/jadx/releases/download/v1.4.7/jadx-1.4.7.zip"
unzip -o -d $WORKING_DIR/tools/jadx $WORKING_DIR/tools/jadx-1.4.7.zip
rm $WORKING_DIR/tools/jadx-*.zip

ln -s $WORKING_DIR/tools/jadx/bin/jadx ~/.local/bin/jadx
ln -s $WORKING_DIR/tools/jadx/bin/jadx-gui ~/.local/bin/jadx-gui

echo -e "${GREEN}[+] Done!${NC}"
echo -e "${GREEN}[+] jadx and jadx-gui are now available in your PATH${NC}"