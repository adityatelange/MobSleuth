# ca_certificate.der: Custom CA certificate
# certificate.der: Certificate signed by the CA
# ca_private_key.der: Private key of the CA
# certificate_private_key.der: Private key of the signed certificate
INST_DIR=~/MobSleuth

rm -r $INST_DIR/tmpcert
mkdir -p $INST_DIR/tmpcert 
mkdir -p $INST_DIR/cert

cd $INST_DIR/tmpcert

openssl genpkey -algorithm RSA -out ca_private_key.key

openssl req -new -x509 -key ca_private_key.key -out ca_certificate.crt -days 365 -subj "/C=MS/ST=MobSleuth/L=MobSleuth/O=MobSleuth/OU=MobSleuth CA/CN=MobSleuth CA"

openssl genpkey -algorithm RSA -out certificate_private_key.key

openssl req -new -key certificate_private_key.key -out certificate.csr -subj "/C=MS/ST=MobSleuth/L=MobSleuth/O=MobSleuth/OU=MobSleuth CA/CN=MobSleuth CA"

openssl x509 -req -in certificate.csr -CA ca_certificate.crt -CAkey ca_private_key.key -CAcreateserial -out certificate.crt -days 365

openssl x509 -in ca_certificate.crt -outform DER -out ca_certificate.der
openssl x509 -in certificate.crt -outform DER -out certificate.der
openssl pkcs8 -topk8 -inform PEM -outform DER -in ca_private_key.key -out ca_private_key.der -nocrypt
openssl pkcs8 -topk8 -inform PEM -outform DER -in certificate_private_key.key -out certificate_private_key.der -nocrypt

cp certificate.der $INST_DIR/cert
cp certificate_private_key.der $INST_DIR/cert
cd $INST_DIR
rm -r $INST_DIR/tmpcert
