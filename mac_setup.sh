#!/bin/zsh
echo "Begin Setup..."

## Install Homebrew
echo "\n
Installing Homebrew...
"

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Check if .zshrc exists.
ZSHRC=~/.zshrc

if test -f "$ZSHRC"; then
    echo "$ZSHRC already exists."
else
    echo ".zshrc not found. Creating it..."
    touch ~/.zshrc
    echo ".zshrc created."
fi

echo "\nInstalling applications from homebrew..."

## Tap fonts so that they can be installed via homebrew
brew tap homebrew/cask-fonts

## Get latest version of git
brew install git

## get latest version of zsh
brew install zsh
 
## Iterm2
brew cask install iterm2

## Setapp
brew cask install setapp

## Realm Studio
brew cask install mongodb-realm-studio
 
## Jetbrains toolbox
brew cask install jetbrains-toolbox
 
## Postman
brew cask install postman
 
## GitKraken
brew cask install gitkraken
 
## Visual Studio Code
brew cask install visual-studio-code
 
## Jetbrains Mono font
brew cask install font-jetbrains-mono
 
## SwiftLint
brew install swiftlint
 
## Swiftformat
brew install swiftformat
 
echo "\ndone."

## Add Export Statements
echo "\n
## Remove user@macbook from prompt
export DEFAULT_USER=\$USER
" >> ~/.zshrc

## zsh autosuggestions
echo "\n" >> ~/.zshrc
brew install zsh-autosuggestions
echo "source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
 
## zsh syntax highlighting
brew install zsh-syntax-highlighting
echo "source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc

echo "\nDone."

## Add Aliases
echo "Adding aliases to .zshrc file..."

aliases="
## git aliases
function gc { git commit -m \"\$@\" }
alias gcm=\"git checkout master\"
alias gs=\"git status\"
alias gpull=\"git pull\"
alias gf=\"git fetch\"
alias gfa=\"git fetch --all\"
alias gf=\"git fetch origin\"
alias gpush=\"git push\"
alias gd=\"git diff\"
alias ga=\"git add .\"
alias gb=\"git branch\"
alias gbr=\"git branch remote\"
alias gfr=\"git remote update\"
alias gbn=\"git checkout -B \"
alias grf=\"git reflog\"
alias grh=\"git reset HEAD~\" # last commit
alias gac=\"git add . && git commit -a -m \"
alias gsu=\"git gpush --set-upstream origin \"
alias glog=\"git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --branches\"

## other aliases
alias zshrc=\"code ~/.zshrc\"
alias refresh=\"source ~/.zshrc\"
alias update=\"brew cleanup; brew update; brew upgrade;\"
alias myip=\"curl http://ipecho.net/plain; echo\"
alias sshdir=\"cd ~/.ssh\"
alias home=\"cd ~\"

## Kill all java instances. Because java sucks.
alias order66=\"echo execute order 66; sudo killall -v -9 java\"

## Purge the Xcode Derrived Data folder.
alias xcpurge=\"rm -rf ~/Library/Developer/Xcode/DerivedData\"
"

echo "$aliases" >> ~/.zshrc

echo "\nDone."

## Setup ssh
echo "\nSetting up ssh key. Please follow the prompts..."

ssh-keygen

echo "\nDone."

## Install oh-my-zsh
echo "\n
Installing oh-my-zsh...
\n"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "\nFinished installing oh-my-zsh."

echo "\nEnvironment Setup Complete."

echo "
\nRemember to add oh-my-zsh plugins to .zshrc:

plugins=(git encode64 z history)
"

echo "
\nRemember to change zsh theme to \"agnoster\"

ZSH_THEME="agnoster"
"

exit 0
