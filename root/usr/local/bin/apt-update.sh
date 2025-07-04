#!/bin/bash

: '
This script is owned by webdevops and licensed under the MIT License.
It updates the apt cache using apt-get update.
If the file /tmp/.apt-update exists, it assumes "apt-get update" has already been run.
Otherwise, it updates the apt cache before installing packages.
'

set -o pipefail  # trace ERR through pipes
set -o errtrace  # trace ERR through 'time command' and other functions
set -o nounset   ## set -u : exit the script if you try to use an uninitialised variable
set -o errexit   ## set -e : exit the script if any statement returns a non-true return value

apt-get update
touch /tmp/.apt-update