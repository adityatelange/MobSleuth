#!/usr/bin/env bash
#
# This script installs pidcat on the system.

GREEN='\033[0;32m'
NC='\033[0m' # No Color
WORKING_DIR=$HOME/MobSleuth

echo -e "${GREEN}[#] PIDCAT${NC}"

mkdir -p $WORKING_DIR/tools
git clone https://github.com/JakeWharton/pidcat.git --depth=1 $WORKING_DIR/tools/pidcat

ln -s $WORKING_DIR/tools/pidcat/pidcat.py ~/.local/bin/pidcat

echo -e "${GREEN}[+] Done!${NC}"
