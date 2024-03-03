#!/usr/bin/env bash
#
# This script installs objection on the system.

GREEN='\033[0;32m'
NC='\033[0m' # No Color
WORKING_DIR=$HOME/MobSleuth

echo -e "${GREEN}[#] OBJECTION${NC}"

mkdir -p $WORKING_DIR/installers
echo -e "${GREEN}[+] Installing deps...${NC}"
sudo apt install aapt apksigner apktool zipalign -yqq --no-install-recommends
echo -e "${GREEN}[+] Cloning objection src...${NC}"
git clone https://github.com/sensepost/objection.git --depth=1  $WORKING_DIR/installers/objection
cd $WORKING_DIR/installers/objection
pip3 install --editable .

echo -e "${GREEN}[+] Done!${NC}"
