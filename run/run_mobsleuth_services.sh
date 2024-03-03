#!/usr/bin/env bash

GREEN='\033[0;32m'
NC='\033[0m' # No Color
WORKING_DIR=$HOME/MobSleuth


cd $WORKING_DIR/src/run
docker compose up
