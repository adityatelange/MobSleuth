#!/usr/bin/env bash
#
# This script is part of the MobSleuth project.
# https://github.com/adityatelange/MobSleuth
#
# This script generates a custom certificate and private key for the MobSleuth CA and a certificate signed by the CA.
# The generated files are:
# - ca_certificate.der: Custom CA certificate
# - certificate.der: Certificate signed by the CA
# - ca_private_key.der: Private key of the CA
# - certificate_private_key.der: Private key of the signed certificate
# The files are saved in the $WORKING_DIR/cert directory.

GREEN='\033[0;32m'
NC='\033[0m' # No Color
WORKING_DIR=$HOME/MobSleuth

rm -r $WORKING_DIR/tmpcert
mkdir -p $WORKING_DIR/tmpcert 
mkdir -p $WORKING_DIR/cert

cd $WORKING_DIR/tmpcert

openssl genpkey -algorithm RSA -out ca_private_key.key

openssl req -new -x509 -key ca_private_key.key -out ca_certificate.crt -days 365 -subj "/C=MS/ST=MobSleuth/L=MobSleuth/O=MobSleuth/OU=MobSleuth CA/CN=MobSleuth CA"

openssl genpkey -algorithm RSA -out certificate_private_key.key

openssl req -new -key certificate_private_key.key -out certificate.csr -subj "/C=MS/ST=MobSleuth/L=MobSleuth/O=MobSleuth/OU=MobSleuth CA/CN=MobSleuth CA"

openssl x509 -req -in certificate.csr -CA ca_certificate.crt -CAkey ca_private_key.key -CAcreateserial -out certificate.crt -days 365

openssl x509 -in ca_certificate.crt -outform DER -out ca_certificate.der
openssl x509 -in certificate.crt -outform DER -out certificate.der
openssl pkcs8 -topk8 -inform PEM -outform DER -in ca_private_key.key -out ca_private_key.der -nocrypt
openssl pkcs8 -topk8 -inform PEM -outform DER -in certificate_private_key.key -out certificate_private_key.der -nocrypt

cp certificate.der $WORKING_DIR/cert
cp certificate_private_key.der $WORKING_DIR/cert
cd $WORKING_DIR
rm -r $WORKING_DIR/tmpcert
