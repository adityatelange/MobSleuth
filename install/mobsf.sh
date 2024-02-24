GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}[#] MOBSF${NC}"
INST_DIR=~/MobSleuth

echo -e "${GREEN}[+] Pulling latest image of MobSF${NC}"
docker pull opensecurity/mobile-security-framework-mobsf:latest
echo -e "${GREEN}[+] creating persistent data folder for MobSF${NC}"
mkdir -p  $INST_DIR/mobsf_vol
sudo chown 9901:9901 $INST_DIR/mobsf_vol

echo -e "${GREEN}[+] Done!${NC}"
