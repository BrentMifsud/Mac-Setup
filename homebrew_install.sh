#!/bin/zsh

## Install Homebrew
echo "\n
Installing Homebrew...
"

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "\nInstalling applications from homebrew..."

## Tap fonts so that they can be installed via homebrew
brew tap homebrew/cask-fonts

## Get latest version of git
brew install git

## get latest version of zsh
brew install zsh
 
## Iterm2
brew install iterm2

## Setapp
brew install setapp

## Realm Studio
brew install mongodb-realm-studio
 
## Jetbrains toolbox
brew install jetbrains-toolbox
 
## Postman
brew install postman
 
## Fork
brew install fork
 
## Visual Studio Code
brew install visual-studio-code
 
## Jetbrains Mono font
brew install font-jetbrains-mono
 
## SwiftLint
brew install swiftlint
 
## Swiftformat
brew install swiftformat
 
echo "\ndone."

# Check if .zshrc exists.
ZSHRC=~/.zshrc

if test -f "$ZSHRC"; then
    echo "\n.zshrc file already exists."
else
    echo "\n.zshrc not found. Creating it..."
    touch ~/.zshrc
    echo ".zshrc created"
fi

## zsh autosuggestions
echo "\n" >> ~/.zshrc
brew install zsh-autosuggestions
echo "source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
 
## zsh syntax highlighting
brew install zsh-syntax-highlighting
echo "source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc

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