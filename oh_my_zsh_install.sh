#!/bin/zsh

## Install oh-my-zsh
echo "\n
Installing oh-my-zsh...
\n"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "\nFinished installing oh-my-zsh."

echo "\n
Remember to do the followingin .zshrc:
1. change zsh theme to ZSH_THEME="agnoster"
2. plugins=(git encode64 z history)
"