# CLAUDE.md

This repository contains shell scripts to set up a fresh Mac with all necessary software and developer tools.

## Purpose

Automates the installation and configuration of daily-use software and development tools on a clean macOS installation.

## Structure

- `mac_setup.sh` - Main entry point that orchestrates all other scripts
- `homebrew_install.sh` - Installs Homebrew and applications (git, zsh, Fork, VS Code, 1Password, Xcodes, etc.)
- `oh_my_zsh_install.sh` - Installs Oh My Zsh
- `zshrc_alias_setup.sh` - Configures shell aliases (git shortcuts, utilities)
- `ssh_key_setup.sh` - Sets up SSH keys

## Running the Setup

```bash
chmod 0700 mac_setup.sh
./mac_setup.sh
```

Note: Oh My Zsh installation interrupts the script, so you may need to run it twice.

## Key Conventions

- All scripts use `#!/bin/zsh`
- Scripts modify `~/.zshrc` directly by appending configuration
- Homebrew apps are installed via `brew install` (casks auto-detected)
