#!/usr/bin/env bash
#
# This script clones the repository to the working directory.

GREEN='\033[0;32m'
NC='\033[0m' # No Color
WORKING_DIR=$HOME/MobSleuth

print_banner () {
    printf """
    ╔╦╗┌─┐┌┐ ╔═╗┬  ┌─┐┬ ┬┌┬┐┬ ┬
    ║║║│ │├┴┐╚═╗│  ├┤ │ │ │ ├─┤
    ╩ ╩└─┘└─┘╚═╝┴─┘└─┘└─┘ ┴ ┴ ┴
    \n"""
}
print_banner

# ask confirmation from the user
echo -e "[+] This script will clone the MobSleuth repository to $WORKING_DIR/src"
read -p "Do you want to continue? (y/N) " -n 1 -r </dev/tty
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo -e "${GREEN}[+] Exiting...${NC}"
    exit 1
fi

rm -rf $WORKING_DIR/src
mkdir -p $WORKING_DIR
echo -e "${GREEN}[+] Cloning MobSleuth to $WORKING_DIR/src${NC}"
git clone https://github.com/adityatelange/MobSleuth $WORKING_DIR/src

echo -e "${GREEN}[+] Done!${NC}"