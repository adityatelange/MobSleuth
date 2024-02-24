GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}[#] FRIDA${NC}"
INST_DIR=~/MobSleuth

pip3 install frida-tools
mkdir -p $INST_DIR/tools
wget --show-progress -O $INST_DIR/tools/frida-server-16.2.1-android-x86_64.xz "https://github.com/frida/frida/releases/download/16.2.1/frida-server-16.2.1-android-x86_64.xz"
wget --show-progress -O $INST_DIR/tools/frida-server-16.2.1-android-x86.xz "https://github.com/frida/frida/releases/download/16.2.1/frida-server-16.2.1-android-x86.xz"
xz -f -d $INST_DIR/tools/frida-server*.xz

echo -e "${GREEN}[+] Done!${NC}"
