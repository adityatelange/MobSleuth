#!/usr/bin/env bash
#
# This script is part of the MobSleuth project.
# https://github.com/adityatelange/MobSleuth
#
# This script installs droidlysis on the system.

GREEN='\033[0;32m'
NC='\033[0m' # No Color
WORKING_DIR=$HOME/MobSleuth
TAG=$(cat $WORKING_DIR/src/mobsleuth.default.conf | grep "DROIDLYSIS_TAG" | cut -d'=' -f2 | cut -d'v' -f2)

echo -e "${GREEN}[#] DROIDLYSIS${NC}"

mkdir -p $WORKING_DIR/installers
echo -e "${GREEN}[+] Installing deps...${NC}"
sudo apt install default-jre git python3 python3-pip unzip wget libmagic-dev libxml2-dev libxslt-dev -yqq --no-install-recommends
echo -e "${GREEN}[+] Installing droidlysis...${NC}"
pip3 install droidlysis==$TAG

echo -e "${GREEN}[+] Done!${NC}"
