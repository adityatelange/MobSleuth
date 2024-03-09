#!/usr/bin/env bash
#
# This script is part of the MobSleuth project.
# https://github.com/adityatelange/MobSleuth
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

# check if MobSleuth is already installed
if [ -d "$WORKING_DIR" ]; then
    echo -e "${GREEN}[+] MobSleuth is already installed at $WORKING_DIR${NC}"
    # ask confirmation for updating
    echo -e "(Updating will not affect your existing data and only updates $WORKING_DIR/src)"
    read -p "Do you want to update? (y/N) " -n 1 -r </dev/tty
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
        echo -e "${GREEN}[+] Exiting...${NC}"
        exit 1
    fi

    echo -e "${GREEN}[+] Updating MobSleuth...${NC}"
    cd $WORKING_DIR/src
    git reset --hard HEAD
    git clean -f -d
    git pull

    echo -e "${GREEN}[+] Done!${NC}"
    exit 1
else
    echo -e "${GREEN}[+] MobSleuth will be installed at $WORKING_DIR${NC}"

    # ask confirmation from the user
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
    exit 1
fi
