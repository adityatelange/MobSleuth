#!/usr/bin/env bash

GREEN='\033[0;32m'
NC='\033[0m' # No Color
WORKING_DIR=$HOME/MobSleuth


echo -e "${GREEN}[+] Cleaning stuff...${NC}"
sudo apt purge libreoffice-* quassel* transmission-* qpdfview* skanlite* 2048-qt* bluedevil* -y
sudo apt autoremove -y
sudo apt autoclean
echo -e "${GREEN}[+] Done!${NC}"
