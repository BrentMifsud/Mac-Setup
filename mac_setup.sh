#!/bin/zsh
echo "Begin Setup...";

##Check if github is available
echo "Checking if github is available..."
ping -c 1 www.github.com 1>/dev/null 2>/dev/null
SUCCESS=$?

if [ $SUCCESS -eq 0 ]
then
  echo "Github is available. Continuing...";
else
  echo "Setup requires github to complete. Please try on home wifi or get access from network security.";
  echo "Exiting...";
  exit 0;
fi

## Install Homebrew
echo;
echo "Installing Homebrew...";
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
source ~/.zshrc;

echo;
echo "Installing applications...";

## Open JDK
brew cask install adoptopenjdk
 
## Appcleaner
brew cask install appcleaner;
 
## Dbeaver database viewer
brew cask install dbeaver-community;
 
## Iterm2
brew cask install iterm2;
 
## Jetbrains toolbox
brew cask install jetbrains-toolbox;
 
## Postman
brew cask install postman;
 
## Slack
brew cask install slack;
 
## Sourcetree
brew cask install sourcetree;
 
## visual studio code
brew cask install visual-studio-code;

echo;
echo "Done installing applications."
 
## Install oh-my-zsh
echo;
echo "Installing oh-my-zsh...";
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";
source ~/.zshrc;

## zsh autosuggestions
echo "\n" >> ~/.zshrc;
brew install zsh-autosuggestions;
echo "source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc;
source ~/.zshrc;
 
## zsh syntax highlighting
brew install zsh-syntax-highlighting;
echo "export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters" >> ~/.zshrc; 
echo "source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc;
source ~/.zshrc

## Add Aliases

echo "
## git aliases
function gc { git commit -m \"\$@\"; }
alias gcm=\"git checkout master\";
alias gs=\"git status\";
alias gpull=\"git pull\";
alias gf=\"git fetch\";
alias gfa=\"git fetch --all\";
alias gf=\"git fetch origin\";
alias gpush=\"git push\";
alias gd=\"git diff\";
alias ga=\"git add .\";
alias gb=\"git branch\";
alias gbr=\"git branch remote\"
alias gfr=\"git remote update\"
alias gbn=\"git checkout -B \"
alias grf=\"git reflog\";
alias grh=\"git reset HEAD~\" # last commit
alias gac=\"git add . && git commit -a -m \"
alias gsu=\"git gpush --set-upstream origin \"
alias glog=\"git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --branches\"

## other aliases
alias zshrc=\"code ~/.zshrc\"
alias refresh=\"source ~/.zshrc\"
alias update=\"brew update; brew upgrade;\"
" >> ~/.zshrc

## Setup ssh (comment out if re-running the script)
echo;
echo "Setting up ssh key...";
echo "Press enter when prompted to set ssh password file location if you want to use default settings.";
echo;
ssh-keygen;
echo "SSH keygen complete.";

echo;

echo "Setup Complete."