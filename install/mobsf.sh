#!/usr/bin/env bash
#
# This script is part of the MobSleuth project.
# https://github.com/adityatelange/MobSleuth
#
# This script installs MobSF on the system using Docker.

GREEN='\033[0;32m'
NC='\033[0m' # No Color
WORKING_DIR=$HOME/MobSleuth
TAG=$(cat $WORKING_DIR/src/mobsleuth.default.conf | grep "MOBSF_TAG" | cut -d'=' -f2)


echo -e "${GREEN}[#] MOBSF${NC}"

echo -e "${GREEN}[+] Pulling $TAG image of MobSF${NC}"
docker pull opensecurity/mobile-security-framework-mobsf:$TAG
echo -e "${GREEN}[+] creating persistent data folder for MobSF${NC}"
mkdir -p  $WORKING_DIR/mobsf_vol
sudo chown 9901:9901 $WORKING_DIR/mobsf_vol

echo -e "${GREEN}[+] Done!${NC}"
