#!/usr/bin/env bash
#
# This script unsets the proxy for the Android emulator.

adb shell settings put global http_proxy :0
