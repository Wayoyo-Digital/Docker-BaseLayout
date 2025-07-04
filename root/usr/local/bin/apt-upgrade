#!/bin/bash

: '
This script is owned by webdevops and licensed under the MIT License.
It upgrades the system using apt-get dist-upgrade.
If the file /tmp/.apt-update exists, it assumes "apt-get update" has already been run.
Otherwise, it updates the apt cache before upgrading the system.
'

set -o pipefail  # trace ERR through pipes
set -o errtrace  # trace ERR through 'time command' and other functions
set -o nounset   ## set -u : exit the script if you try to use an uninitialised variable
set -o errexit   ## set -e : exit the script if any statement returns a non-true return value

export DEBIAN_FRONTEND=noninteractive

if [[ -f "/tmp/.apt-update" ]]; then
    echo "Detected prefetched 'apt-get update'"
    # Update packages
    RUNLEVEL=1 apt-get dist-upgrade -y -f
else
    # Update apt cache
    apt-get update

    # Update packages
    RUNLEVEL=1 apt-get dist-upgrade -y -f

    # Clear files (reduce snapshot size)
    rm -rf /var/lib/apt/lists/*
    apt-get clean -y
fi