#!/usr/bin/env bash

set -euo pipefail

INSTALL_PATH="/usr/local/bin/focusctl"

if [ "$EUID" -ne 0 ]; then
    echo "Error: Run this script as root."
    echo "Usage: sudo ./install.sh"
    exit 1
fi

echo "Installing dependencies..."

# Detect package manager
if command -v apt >/dev/null 2>&1; then
    apt update
    apt install -y openbox chromium
elif command -v dnf >/dev/null 2>&1; then
    dnf install -y openbox chromium
elif command -v pacman >/dev/null 2>&1; then
    pacman -Sy --noconfirm openbox chromium
else
    echo "Unsupported Linux distribution."
    echo "Please install Openbox and Chromium manually."
    exit 1
fi

echo "Installing focusctl..."

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ ! -f "$SCRIPT_DIR/focusctl" ]; then
    echo "Error: focusctl script not found."
    exit 1
fi

install -m 755 "$SCRIPT_DIR/focusctl" "$INSTALL_PATH"

mkdir -p /etc/focusctl/users

echo
echo "✓ focusctl installed successfully"
echo
echo "Run:"
echo "  sudo focusctl help"
