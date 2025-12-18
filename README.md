# Mac Setup Script

Automates the installation and configuration of daily-use software and development tools on a clean macOS installation.

## Features

- **One-command setup** - Install everything with a single script
- **Idempotent** - Safe to re-run if interrupted
- **Non-interactive** - Runs without user prompts (except SSH key setup)
- **Claude Code integration** - Includes slash commands for managing software

## What Gets Installed

### CLI Tools
- git, gh (GitHub CLI), glab (GitLab CLI)
- jq (JSON processor)
- zsh, swift-format, swiftlint
- xcodes (Xcode version manager)
- zsh-autosuggestions, zsh-syntax-highlighting

### Applications
- Setapp
- Fork (Git client)
- Visual Studio Code
- 1Password
- RapidAPI
- Proxyman
- Claude
- DB Browser for SQLite
- SSH Config Editor
- Warp (terminal)

### Fonts
- JetBrains Mono

### Shell
- Oh My Zsh
- Custom aliases (git shortcuts, utilities)

## Usage

```bash
# Clone the repo
git clone https://github.com/BrentMifsud/Mac-Setup.git
cd Mac-Setup

# Run the setup
chmod 0700 mac_setup.sh
./mac_setup.sh
```

## Claude Code Commands

After running setup, these commands are available globally in Claude Code:

| Command | Description |
|---------|-------------|
| `/install` | Install individual software packages |
| `/uninstall` | Uninstall packages (includes Homebrew cleanup) |
| `/update` | Update installed software (individual or all) |
| `/xcode` | Manage Xcode installations via xcodes CLI |

### Examples

```
/install                  # Shows list, prompts for selection
/install proxyman claude  # Installs specific packages directly
/update all               # Updates everything
/xcode                    # Manage Xcode versions
```

## Project Structure

```
Mac-Setup/
├── mac_setup.sh           # Main entry point
├── Brewfile               # Homebrew packages (copied to ~/.Brewfile)
├── homebrew_install.sh    # Installs Homebrew and apps
├── oh_my_zsh_install.sh   # Installs Oh My Zsh
├── zshrc_alias_setup.sh   # Configures shell aliases
├── ssh_key_setup.sh       # Sets up SSH keys
├── claude_config_setup.sh # Installs Claude Code commands and settings
└── .claude/
    ├── CLAUDE.md          # Global preferences (copied to ~/.claude/CLAUDE.md)
    ├── settings.json      # Permission settings (merged into ~/.claude/settings.json)
    └── commands/          # Claude Code commands (copied to ~/.claude/commands/)
        ├── install.md
        ├── uninstall.md
        ├── update.md
        └── xcode.md
```

## Customization

### Adding/Removing Software

Edit the `Brewfile` to add or remove Homebrew packages:

```ruby
# CLI tools
brew "package-name"

# GUI applications
cask "app-name"

# Fonts
cask "font-name"
```

### Adding Aliases

Edit `zshrc_alias_setup.sh` to add custom shell aliases.

## Shell Aliases Included

### Git Aliases
| Alias | Command |
|-------|---------|
| `gs` | `git status` |
| `ga` | `git add .` |
| `gc "msg"` | `git commit -m "msg"` |
| `gpush` | `git push` |
| `gpull` | `git pull` |
| `glog` | Pretty git log |
| `gac "msg"` | Add all and commit |

### Utility Aliases
| Alias | Description |
|-------|-------------|
| `update` | Update all Homebrew packages |
| `refresh` | Reload .zshrc |
| `xcpurge` | Clear Xcode derived data |
| `myip` | Show public IP address |

## License

MIT
