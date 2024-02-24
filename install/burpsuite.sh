GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}[#] BURPSUITE${NC}"
INST_DIR=~/MobSleuth

mkdir -p $INST_DIR/installers
wget --show-progress -O $INST_DIR/installers/burpsuite_community_linux.sh "https://portswigger-cdn.net/burp/releases/download?product=community&version=2023.12.1.5&type=Linux"
chmod +x $INST_DIR/installers/burpsuite_community_linux.sh
bash $INST_DIR/installers/burpsuite_community_linux.sh -q

echo -e "${GREEN}[+] Done!${NC}"
