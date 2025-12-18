#!/bin/zsh

## Install Homebrew
echo "\nInstalling Homebrew..."

## Check if Homebrew is already installed
if command -v brew &>/dev/null; then
    echo "Homebrew is already installed. Skipping..."
else
    ## NONINTERACTIVE=1 prevents the "Press RETURN to continue" prompt
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

## Add brew to PATH if not already in .zprofile
if ! grep -q 'brew shellenv' ~/.zprofile 2>/dev/null; then
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
fi
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "\nInstalling applications from Brewfile..."

## Copy Brewfile to home directory and install
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cp "$SCRIPT_DIR/Brewfile" ~/.Brewfile
brew bundle --file=~/.Brewfile

echo "\ndone."

## Copy Claude commands to home directory
echo "\nInstalling Claude commands..."
mkdir -p ~/.claude/commands
cp "$SCRIPT_DIR/.claude/commands/"*.md ~/.claude/commands/
echo "Claude commands installed to ~/.claude/commands/"

# Check if .zshrc exists.
ZSHRC=~/.zshrc

if test -f "$ZSHRC"; then
    echo "\n.zshrc file already exists."
else
    echo "\n.zshrc not found. Creating it..."
    touch ~/.zshrc
    echo ".zshrc created"
fi

## Configure zsh autosuggestions
echo "\n" >> ~/.zshrc
echo "source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc

## Configure zsh syntax highlighting
echo "source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
echo "export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters" >> ~/.zshenv

## Add Export Statements
echo "\n
## Add brew completion to zsh
if type brew &>/dev/null; then
  FPATH=\$(brew --prefix)/share/zsh/site-functions:\$FPATH

  autoload -Uz compinit
  compinit
fi
" >> ~/.zshrc

echo "\nDone."
