#!/bin/bash

# Ubuntu setup script - installs config files to their correct locations

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Setting up Ubuntu configurations..."

# Terminal configurations
TERMINAL_DIR="$SCRIPT_DIR/terminal"

# Create ~/.config/dconf directory if it doesn't exist
mkdir -p ~/.config/dconf

# Load GNOME Terminal profile
if [ -f "$TERMINAL_DIR/gnomeProfile.dconf" ]; then
    echo "Loading GNOME Terminal profile..."
    dconf load /org/gnome/terminal/legacy/profiles:/ < "$TERMINAL_DIR/gnomeProfile.dconf"
    echo "GNOME Terminal profile loaded."
fi

# Note: conf_zsh.txt contains setup instructions, not actual config
# Users should follow the instructions in that file manually

# Common configurations
COMMON_DIR="$(cd "$SCRIPT_DIR/../common" && pwd)"

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

echo "Ubuntu configuration setup complete!"

