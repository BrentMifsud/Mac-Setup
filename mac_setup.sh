#!/bin/zsh
echo "Begin Setup..."

##Check if github is available
echo "Checking if github is available..."
ping -c 1 www.github.com 1>/dev/null 2>/dev/null
SUCCESS=$?

if [ $SUCCESS -eq 0 ]
then
  echo "Github is available. Continuing..."
else
  echo "Setup requires github to complete. Please try on home wifi or get access from network security."
  echo "Exiting..."
  exit
fi

## Install Homebrew
echo "\n
Installing Homebrew...
"

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
source ~/.zshrc

echo "\n
Installing applications from homebrew...
"

## Get latest version of git
brew install git

## get latest version of zsh
brew install zsh

## Open JDK
brew cask install adoptopenjdk
 
## Appcleaner
brew cask install appcleaner
 
## Dbeaver database viewer
brew cask install dbeaver-community
 
## Iterm2
brew cask install iterm2
 
## Jetbrains toolbox
brew cask install jetbrains-toolbox
 
## Postman
brew cask install postman
 
## Slack
brew cask install slack

## Whatsapp
brew cask install whatsapp
 
## Sourcetree
brew cask install gitkraken
 
## Visual Studio Code
brew cask install visual-studio-code

## Bettertouchtool
brew cask install bettertouchtool

## Icons8
brew cask install icons8

## Fira Code Awesome Font
brew cask install homebrew/cask-fonts/font-fira-code

echo "\ndone."

## Install oh-my-zsh
echo "\n
Installing oh-my-zsh...
\n"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
source ~/.zshrc

## Add Export Statements
echo "\n
## Remove user@macbook from prompt
export DEFAULT_USER=\$USER
" >> ~/.zshrc

## zsh autosuggestions
echo "\n" >> ~/.zshrc
brew install zsh-autosuggestions
echo "source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
source ~/.zshrc
 
## zsh syntax highlighting
brew install zsh-syntax-highlighting
echo "source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
source ~/.zshrc

echo "\ndone."

## Add Aliases
echo "
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
alias update=\"brew update; brew upgrade;\"
alias myip="curl http://ipecho.net/plain; echo"
alias sshdir="cd ~/.ssh"
alias home="cd ~"
alias order66="echo execute order 66; sudo killall -v -9 java"
" >> ~/.zshrc

## Add repos folders
mkdir ~/Repos
mkdir ~/Repos/iOS

## Get Screensavers
echo "\n
Getting Screensavers from github...
"
mkdir ~/Repos/screensavers
git clone https://github.com/agarrharr/awesome-macos-screensavers.git ~/Repos/screensavers

echo "\nDone."

## Setup ssh
echo "\n
Setting up ssh key. Please follow the prompts...
"

ssh-keygen

echo "\ndone."

echo "\nSetup Complete."

exit 0