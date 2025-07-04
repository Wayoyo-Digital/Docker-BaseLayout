#!/bin/bash

: '
This script installs oh-my-posh.
'

set -o errexit
set -o nounset
set -o pipefail

# Install oh-my-posh
if ! command -v oh-my-posh >/dev/null 2>&1; then
    echo "Installing oh-my-posh..."
    curl -s https://ohmyposh.dev/install.sh | bash -s
else
    echo "oh-my-posh is already installed."
fi
