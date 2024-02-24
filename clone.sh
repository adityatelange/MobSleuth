FILEDIR=$(dirname -- "$( readlink -f -- "$0"; )";)
INST_DIR=~/MobSleuth

rm -rf $INST_DIR/src
mkdir -p $INST_DIR/src
cp -r $FILEDIR/* $INST_DIR/src
cd $INST_DIR/src
