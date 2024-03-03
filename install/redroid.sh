#!/usr/bin/env bash
#
# This script installs reDroid on the system using Docker.

GREEN='\033[0;32m'
NC='\033[0m' # No Color
WORKING_DIR=$HOME/MobSleuth


echo -e "${GREEN}[#] REDROID${NC}"

echo -e "${GREEN}[+] Pulling latest image of redroid 11${NC}"
docker pull redroid/redroid:11.0.0-latest

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
