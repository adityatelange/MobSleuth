#!/usr/bin/env bash
#
# This script is part of the MobSleuth project.
# https://github.com/adityatelange/MobSleuth
#
# This script installs APKiD on the system.

GREEN='\033[0;32m'
NC='\033[0m' # No Color
WORKING_DIR=$HOME/MobSleuth
TAG=$(cat $WORKING_DIR/src/mobsleuth.default.conf | grep "APKID_TAG" | cut -d'=' -f2)


echo -e "${GREEN}[#] APKID${NC}"

pip3 install apkid==$TAG

echo -e "${GREEN}[+] Done!${NC}"
