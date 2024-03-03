GREEN='\033[0;32m'
NC='\033[0m' # No Color
WORKING_DIR=$HOME/MobSleuth


FILEDIR=$(dirname -- "$( readlink -f -- "$0"; )";)

rm -rf $WORKING_DIR/src
mkdir -p $WORKING_DIR/src
cp -r $FILEDIR/* $WORKING_DIR/src
cd $WORKING_DIR/src
