# Config Files Repository

This repository contains configuration files for various applications across different operating systems.

## Repository Structure

```
config/
├── common/           # Cross-platform configuration files
│   └── zed/          # Zed editor configurations
│       ├── keymap.json
│       ├── miguel-blur-3.json
│       └── settings.json
├── macos/            # macOS-specific configurations
│   └── setup.sh      # Installation script (includes common configs)
├── ubuntu/           # Ubuntu-specific configurations
│   ├── setup.sh      # Installation script (includes common configs)
│   └── terminal/     # Terminal configurations
│       ├── gnomeProfile.dconf
│       └── conf_zsh.txt
└── windows/          # Windows-specific configurations
    └── setup.ps1     # Installation script (includes common configs)
```

## What's Included

### Common Configurations
Configurations in the `common/` directory are designed to work across all operating systems:

- **Zed Editor**: Key bindings, settings, and theme configuration files in `common/zed/`

### macOS
Currently contains no OS-specific configuration files. The setup script will install common configurations.

### Ubuntu
Contains Ubuntu-specific terminal configurations:

- **GNOME Terminal Profile**: `gnomeProfile.dconf` - Terminal profile with custom font (JetBrainsMono NL Nerd Font), color palette, and transparency settings
- **ZSH Setup Instructions**: `conf_zsh.txt` - Contains links and instructions for setting up ZSH on Ubuntu

The setup script will install both Ubuntu-specific and common configurations.

### Windows
Currently contains no OS-specific configuration files. The setup script will install common configurations.

## Installation

Each OS-specific setup script automatically installs both the OS-specific configurations (if any) and the common configurations (like Zed editor).

### Prerequisites

For Ubuntu setup:

- `dconf-cli` package must be installed for GNOME Terminal profile loading

### Installing for Ubuntu

1. Navigate to the ubuntu directory:

   ```bash
   cd config/ubuntu
   ```

2. Make the setup script executable (if not already):

   ```bash
   chmod +x setup.sh
   ```

3. Run the setup script:

   ```bash
   ./setup.sh
   ```

   This will:
   - Load the GNOME Terminal profile into dconf (creates the "Miguel" profile and sets it as default)
   - Install Zed editor configurations to `~/.config/zed/` (keymap and settings at the root, theme in `~/.config/zed/themes/`)
   - Note: For ZSH setup, follow the instructions in `terminal/conf_zsh.txt` manually

### Installing for macOS

1. Navigate to the macos directory:

   ```bash
   cd config/macos
   ```

2. Make the setup script executable:

   ```bash
   chmod +x setup.sh
   ```

3. Run the setup script:

   ```bash
   ./setup.sh
   ```

   This will:
   - Install Zed editor configurations to `~/.config/zed/` (keymap and settings at the root, theme in `~/.config/zed/themes/`)

### Installing for Windows

1. Navigate to the windows directory in PowerShell:

   ```powershell
   cd config\windows
   ```

2. Run the setup script:

   ```powershell
   .\setup.ps1
   ```

   This will:
   - Install Zed editor configurations to `%APPDATA%\Zed` (keymap and settings at the root, theme in `%APPDATA%\Zed\themes\`)

## Configuration Details

### Zed Editor (Common)

Installed per OS to the Zed config directory (`~/.config/zed/` on Linux/macOS, `%APPDATA%\Zed` on Windows):

- `keymap.json`: Custom key bindings
- `miguel-blur-3.json`: Custom theme (installed into the `themes/` subdirectory)
- `settings.json`: Editor settings

### Ubuntu Terminal
- `gnomeProfile.dconf`: GNOME Terminal profile with:
  - Font: JetBrainsMono NL Nerd Font 12pt
  - Custom color palette
  - Transparency settings
  - Profile name: "Miguel"
- `conf_zsh.txt`: Setup instructions for ZSH (Oh My Posh, etc.)

## Notes

- The `common/` directory contains configurations that work across all platforms
- Each OS directory contains platform-specific configurations
- Setup scripts are provided for each OS to automate configuration installation
- The shell scripts (`setup.sh`) use LF line endings so they run correctly on Linux/macOS; `.gitattributes` enforces this
- Some configurations (like ZSH setup) require manual steps - refer to the instruction files
