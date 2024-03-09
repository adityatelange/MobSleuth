#!/usr/bin/env bash
#
# This script is part of the MobSleuth project.
# https://github.com/adityatelange/MobSleuth
#
# This script installs BurpSuite Community Edition on the system.

GREEN='\033[0;32m'
NC='\033[0m' # No Color
WORKING_DIR=$HOME/MobSleuth
TAG=$(cat $WORKING_DIR/src/mobsleuth.default.conf | grep "BURPSUITE_COMMUNITY_TAG" | cut -d'=' -f2)


echo -e "${GREEN}[#] BURPSUITE${NC}"

mkdir -p $WORKING_DIR/installers
wget --show-progress -O $WORKING_DIR/installers/burpsuite_community_linux.sh "https://portswigger-cdn.net/burp/releases/download?product=community&version=${TAG}&type=Linux"
chmod +x $WORKING_DIR/installers/burpsuite_community_linux.sh
bash $WORKING_DIR/installers/burpsuite_community_linux.sh -q

echo -e "${GREEN}[+] Done!${NC}"
