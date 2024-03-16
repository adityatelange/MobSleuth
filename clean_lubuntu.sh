#!/usr/bin/env bash
#
# This script is part of the MobSleuth project.
# https://github.com/adityatelange/MobSleuth
#
# This script cleans the system by removing unnecessary packages and files.

GREEN='\033[0;32m'
NC='\033[0m' # No Color
WORKING_DIR=$HOME/MobSleuth


echo -e "${GREEN}[+] Cleaning stuff...${NC}"
sudo apt purge libreoffice-* quassel* transmission-* qpdfview* skanlite* 2048-qt* bluedevil* vlc-* imagemagick* noblenote -y
sudo apt autoremove -y
sudo apt autoclean
echo -e "${GREEN}[+] Done!${NC}"
