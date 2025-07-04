#!/bin/sh

: '
# This script is owned by Wayoyo Digital and licensed under the MIT License.
# It was inspired by the work of webdevops.
# It downloads and extracts the latest Docker-BaseLayout files.
# For apt-based systems, see root/usr/local/bin/apt-install.sh and apt-update.sh for package management.
'

set -o nounset   ## set -u : exit the script if you try to use an uninitialised variable
set -o errexit   ## set -e : exit the script if any statement returns a non-true return value

TARGET_DIR="/"

if [ "$#" -eq 1 ]; then
    TARGET_DIR="$1"
    mkdir -p "$1"
fi

umask 0022

if [ -f "/sbin/apk" ]; then
    # Alpine linux
    apk add --no-cache ca-certificates wget --virtual .d2F5b3lvLWxheW91dA-deps
    update-ca-certificates
    wget -O /tmp/baselayout.tar.gz https://github.com/Wayoyo-Digital/Docker-BaseLayout/archive/refs/heads/main.tar.gz
    apk del .d2F5b3lvLWxheW91dA-deps
else
    # General linux
    wget -O /tmp/baselayout.tar.gz https://github.com/Wayoyo-Digital/Docker-BaseLayout/archive/refs/heads/main.tar.gz
fi

tar --no-same-permissions --strip-components=2 -xf /tmp/baselayout.tar.gz  -C "$TARGET_DIR"
rm -f /tmp/baselayout.tar.gz