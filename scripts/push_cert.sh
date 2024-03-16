#!/usr/bin/env bash
#
# This script is part of the MobSleuth project.
# https://github.com/adityatelange/MobSleuth
#
# This script pushes the custom certificate to the device.
# The certificate is saved in the $WORKING_DIR/cert directory.
# The certificate is pushed to /system/etc/security/cacerts/ on the device.

GREEN='\033[0;32m'
NC='\033[0m' # No Color
WORKING_DIR=$HOME/MobSleuth

mkdir -p $WORKING_DIR/cert
cd $WORKING_DIR/cert
openssl x509 -inform der -in certificate.der -out certificate.cer

hashed_name=`openssl x509 -inform PEM -subject_hash_old -in certificate.cer | head -1` && cp certificate.cer $hashed_name.0

# check if adb devce is connected using adb devices command
if [ -z "$(adb devices | grep -v List)" ]; then
    echo -e "${GREEN}[+] No device connected${NC}"
    exit 1
fi

adb push $hashed_name.0 /system/etc/security/cacerts

adb shell chmod 664 /system/etc/security/cacerts/$hashed_name.0
