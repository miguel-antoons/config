#!/bin/bash

# macOS setup script - installs config files to their correct locations

set -e

echo "Setting up macOS configurations..."

# Common configurations
COMMON_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../common" && pwd)"

# Zed editor configurations
ZED_DIR="$COMMON_DIR/zed"
ZED_TARGET_DIR="$HOME/.config/zed"

if [ -d "$ZED_DIR" ]; then
    echo "Installing Zed configurations..."
    mkdir -p "$ZED_TARGET_DIR"
    cp "$ZED_DIR"/keymap.json "$ZED_TARGET_DIR/keymap.json"
    cp "$ZED_DIR"/settings.json "$ZED_TARGET_DIR/settings.json"
    cp "$ZED_DIR"/miguel-blur-3.json.json "$ZED_TARGET_DIR/themes/miguel-blur-3.json"
    
    echo "Zed configurations installed."
fi

echo "macOS configuration setup complete!"
