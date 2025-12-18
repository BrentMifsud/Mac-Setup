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

# Ensure .zshrc exists
touch ~/.zshrc

## Configure zsh autosuggestions (if not already configured)
if ! grep -q 'zsh-autosuggestions.zsh' ~/.zshrc 2>/dev/null; then
    echo "\n## zsh-autosuggestions" >> ~/.zshrc
    echo "source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
fi

## Configure zsh syntax highlighting (if not already configured)
if ! grep -q 'zsh-syntax-highlighting.zsh' ~/.zshrc 2>/dev/null; then
    echo "\n## zsh-syntax-highlighting" >> ~/.zshrc
    echo "source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
fi

if ! grep -q 'ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR' ~/.zshenv 2>/dev/null; then
    touch ~/.zshenv
    echo "export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters" >> ~/.zshenv
fi

## Add brew completion to zsh (if not already configured)
if ! grep -q 'brew completion' ~/.zshrc 2>/dev/null; then
    echo "\n## brew completion" >> ~/.zshrc
    echo 'if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
  autoload -Uz compinit
  compinit
fi' >> ~/.zshrc
fi

echo "\nDone."
