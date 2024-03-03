#!/usr/bin/env bash

WORKING_DIR=~/MobSleuth

mkdir -p $WORKING_DIR/cert
cd $WORKING_DIR/cert
openssl x509 -inform der -in certificate.der -out certificate.cer

hashed_name=`openssl x509 -inform PEM -subject_hash_old -in certificate.cer | head -1` && cp certificate.cer $hashed_name.0

adb push $hashed_name.0 /system/etc/security/cacerts

adb shell chmod 664 /system/etc/security/cacerts/$hashed_name.0
