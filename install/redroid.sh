#!/usr/bin/env bash
#
# This script is part of the MobSleuth project.
# https://github.com/adityatelange/MobSleuth
#
# This script installs reDroid on the system using Docker.

GREEN='\033[0;32m'
NC='\033[0m' # No Color
WORKING_DIR=$HOME/MobSleuth
TAG=$(cat $WORKING_DIR/src/mobsleuth.default.conf | grep "REDROID_TAG" | cut -d'=' -f2)

echo -e "${GREEN}[#] REDROID${NC}"

echo -e "${GREEN}[+] Pulling $TAG image of redroid 11${NC}"
docker pull redroid/redroid:$TAG

echo -e "${GREEN}[+] creating persistent data folder for reDroid${NC}"
mkdir -p  $WORKING_DIR/data11_vol

echo -e "${GREEN}[+] enabling binder-linux service to load kernel module${NC}"
cat <<EOF | sudo tee /etc/systemd/system/load-binder-linux.service
[Unit]
Description=Load binder_linux module with options
After=network.target

[Service]
Type=oneshot
ExecStart=/sbin/modprobe binder_linux devices="binder,hwbinder,vndbinder"

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl enable load-binder-linux.service
sudo systemctl start load-binder-linux.service

echo -e "${GREEN}[+] Done!${NC}"
