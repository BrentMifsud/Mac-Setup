#!/bin/zsh

# Check if .zshrc exists.
ZSHRC=~/.zshrc

if test -f "$ZSHRC"; then
    echo "\n.zshrc file already exists."
else
    echo "\n.zshrc not found. Creating it..."
    touch ~/.zshrc
    echo ".zshrc created"
fi

## Add Export Statements
echo "\n
## Remove user@macbook from prompt
export DEFAULT_USER=\$USER
" >> ~/.zshrc

## Add Aliases
echo "\nAdding aliases to .zshrc file..."

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
alias update=\"brew upgrade; brew update; brew cleanup;\"
alias myip=\"curl http://ipecho.net/plain; echo\"
alias sshdir=\"cd ~/.ssh\"
alias home=\"cd ~\"

## Kill all java instances. Because java sucks.
alias order66=\"echo execute order 66; sudo killall -v -9 java\"

## Purge the Xcode Derrived Data folder.
alias xcpurge=\"rm -rf ~/Library/Developer/Xcode/DerivedData; rm -rf ~/Library/Caches/org.swift.swiftpm\"

## Reinstall Command line tools
alias xcode-cli-reinstall=\"sudo rm -rf /Library/Developer/CommandLineTools; xcode-select --install\"
"

echo "$aliases" >> ~/.zshrc