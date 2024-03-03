GREEN='\033[0;32m'
NC='\033[0m' # No Color
WORKING_DIR=$HOME/MobSleuth


echo -e "${GREEN}[#] DOCKER${NC}"

echo -e "${GREEN}[+] Updating package list${NC}"
sudo apt update -yqq
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg --yes
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
echo -e "${GREEN}[+] Updating package list${NC}"
sudo apt update -yqq
echo -e "${GREEN}[+] Installing docker${NC}"
sudo apt install docker-ce -y
echo -e "${GREEN}[+] Adding '${USER}' to 'docker' group${NC}"
sudo usermod -aG docker ${USER}

echo -e "${GREEN}[+] Done! Logout and Log back in${NC}"
