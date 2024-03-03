#!/usr/bin/env bash
#
# This script installs BurpSuite Community Edition on the system.

GREEN='\033[0;32m'
NC='\033[0m' # No Color
WORKING_DIR=$HOME/MobSleuth


echo -e "${GREEN}[#] BURPSUITE${NC}"

mkdir -p $WORKING_DIR/installers
wget --show-progress -O $WORKING_DIR/installers/burpsuite_community_linux.sh "https://portswigger-cdn.net/burp/releases/download?product=community&version=2023.12.1.5&type=Linux"
chmod +x $WORKING_DIR/installers/burpsuite_community_linux.sh
bash $WORKING_DIR/installers/burpsuite_community_linux.sh -q

echo -e "${GREEN}[+] Done!${NC}"
