GREEN='\033[0;32m'
NC='\033[0m' # No Color
WORKING_DIR=$HOME/MobSleuth


echo -e "${GREEN}[#] COMMON DEPS${NC}"

echo -e "${GREEN}[+] Updating package list${NC}"
sudo apt update -yqq
echo -e "${GREEN}[+] Installing deps${NC}"
sudo apt install apt-transport-https ca-certificates curl software-properties-common python3-pip -yqq --no-install-recommends

echo -e "${GREEN}[+] Done!${NC}"
