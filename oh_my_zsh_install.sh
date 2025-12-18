#!/bin/zsh

## Install oh-my-zsh
echo "\nInstalling oh-my-zsh..."

## Check if Oh My Zsh is already installed
if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh My Zsh is already installed. Updating..."
    "$HOME/.oh-my-zsh/tools/upgrade.sh"
else
    ## Use --unattended to prevent spawning a new shell
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    echo "\nFinished installing oh-my-zsh."
fi

echo "\n
Remember to do the following in .zshrc:
1. change zsh theme to ZSH_THEME=\"agnoster\"
2. plugins=(git encode64 z history)
"