# CLAUDE.md

This repository contains shell scripts to set up a fresh Mac with all necessary software and developer tools.

## Purpose

Automates the installation and configuration of daily-use software and development tools on a clean macOS installation.

## Structure

- `mac_setup.sh` - Main entry point that orchestrates all other scripts
- `homebrew_install.sh` - Installs Homebrew and applications from the Brewfile
- `Brewfile` - Declarative list of all Homebrew packages and casks (copied to `~/.Brewfile` during setup)
- `.claude/commands/` - Claude Code commands (copied to `~/.claude/commands/` during setup)
- `oh_my_zsh_install.sh` - Installs Oh My Zsh
- `zshrc_alias_setup.sh` - Configures shell aliases (git shortcuts, utilities)
- `ssh_key_setup.sh` - Sets up SSH keys

## Installed Software

### CLI Tools
- git, zsh, swift-format, swiftlint
- xcodes (Xcode version manager)
- zsh-autosuggestions, zsh-syntax-highlighting

### Applications
- Setapp, Fork, Visual Studio Code, 1Password
- RapidAPI, Proxyman, Claude, DB Browser for SQLite

### Fonts
- JetBrains Mono

### Shell
- Oh My Zsh

## Running the Setup

```bash
chmod 0700 mac_setup.sh
./mac_setup.sh
```

The script is idempotent and can be safely re-run if interrupted.

## Claude Commands

These commands are installed globally to `~/.claude/commands/` during setup:

- `/install` - Install individual software packages
- `/uninstall` - Uninstall individual software packages
- `/update` - Update installed software (individual or all)
- `/xcode` - Manage Xcode installations via xcodes CLI

Commands read from `~/.Brewfile` to determine available software.

## Key Conventions

- All scripts use `#!/bin/zsh`
- Scripts modify `~/.zshrc` directly by appending configuration
- Homebrew apps are defined in `Brewfile` and installed via `brew bundle`

## Allowed Commands

```
brew install:*
brew uninstall:*
brew bundle:*
brew update
brew upgrade:*
brew cleanup
omz update
xcodes install:*
xcodes uninstall:*
xcodes installed
xcodes list
xcodes select:*
```

When running the `/install`, `/update`, or `/uninstall` commands, do not ask for permission to run brew commands. Only ask for confirmation if the user chooses to uninstall all software.
