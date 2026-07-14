#!/usr/bin/env bash

set -euo pipefail

INSTALL_PATH="/usr/local/bin/focusctl"

if [ "$EUID" -ne 0 ]; then
    echo "Error: Run this script as root."
    echo "Usage: sudo ./uninstall.sh"
    exit 1
fi

echo "Removing focusctl..."

if [ -f "$INSTALL_PATH" ]; then
    rm -f "$INSTALL_PATH"
    echo "✓ Removed binary"
else
    echo "! focusctl binary not found"
fi

if [ -d "/etc/focusctl" ]; then
    rm -rf /etc/focusctl
    echo "✓ Removed configuration"
fi

echo
echo "focusctl has been uninstalled."
echo
echo "Note:"
echo "Existing kiosk users were NOT deleted."
echo "Remove them manually with:"
echo "  sudo focusctl deleteuser <username>"
