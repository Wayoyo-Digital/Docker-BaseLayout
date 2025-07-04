#!/bin/bash

: '
This script installs Rust and cargo if they are not already installed,
and then installs "macchina" using cargo.
'

set -o errexit
set -o nounset
set -o pipefail

# Check if cargo is installed
if ! command -v cargo >/dev/null 2>&1; then
    echo "cargo is not installed. Installing Rust and cargo..."
    # Install Rust (this will also install cargo)
    curl https://sh.rustup.rs -sSf | sh -s -- -y
    # Add cargo to PATH for the current session
    export PATH="$HOME/.cargo/bin:$PATH"
else
    echo "cargo is already installed."
fi

# Install macchina using cargo
if ! cargo install macchina; then
    echo "Failed to install macchina." >&2
    exit 1
else    
    echo "macchina has been installed successfully."
fi
