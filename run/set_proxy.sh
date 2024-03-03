#!/usr/bin/env bash

adb shell settings put global http_proxy "$(ip -f inet addr show enp0s3 | awk '/inet/ {print $2}' | cut -d/ -f1):8080"
