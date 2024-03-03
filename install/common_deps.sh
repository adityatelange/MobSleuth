#!/usr/bin/env bash
#
# This script installs common dependencies on the system.

GREEN='\033[0;32m'
NC='\033[0m' # No Color
WORKING_DIR=$HOME/MobSleuth


echo -e "${GREEN}[#] COMMON DEPS${NC}"

echo -e "${GREEN}[+] Updating package list${NC}"
sudo apt update -yqq
echo -e "${GREEN}[+] Installing deps${NC}"
sudo apt install apt-transport-https ca-certificates curl software-properties-common python3-pip -yqq --no-install-recommends

# Check if $HOME.local/bin is in PATH and add it if not
if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
    echo -e "${GREEN}[+] Adding ~/.local/bin to PATH in $HOME/.bashrc${NC}"
    echo "" >> $HOME/.bashrc
    echo "# set PATH so it includes user's private bin if it exists" >> $HOME/.bashrc
    echo "export PATH=\$HOME/.local/bin:\$PATH" >> $HOME/.bashrc
    source $HOME/.bashrc
fi

echo -e "${GREEN}[+] Done!${NC}"
