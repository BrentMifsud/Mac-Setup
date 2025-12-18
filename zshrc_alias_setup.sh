#!/bin/zsh

# Ensure .zshrc exists
touch ~/.zshrc

## Add DEFAULT_USER export (if not already configured)
if ! grep -q 'DEFAULT_USER' ~/.zshrc 2>/dev/null; then
    echo "\n## Remove user@macbook from prompt" >> ~/.zshrc
    echo 'export DEFAULT_USER=$USER' >> ~/.zshrc
fi

## Add Aliases (if not already configured)
if ! grep -q '## git aliases' ~/.zshrc 2>/dev/null; then
    echo "\nAdding aliases to .zshrc file..."

    aliases='
## git aliases
function gc { git commit -m "$@" }
alias gcm="git checkout master"
alias gs="git status"
alias gpull="git pull"
alias gf="git fetch"
alias gfa="git fetch --all"
alias gpush="git push"
alias gd="git diff"
alias ga="git add ."
alias gb="git branch"
alias gbr="git branch remote"
alias gfr="git remote update"
alias gbn="git checkout -B "
alias grf="git reflog"
alias grh="git reset HEAD~" # last commit
alias gac="git add . && git commit -a -m "
alias gsu="git push --set-upstream origin "
alias glog="git log --color --graph --pretty=format:'\''%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --abbrev-commit --branches"

## other aliases
alias zshrc="code ~/.zshrc"
alias refresh="source ~/.zshrc"
alias update="brew update; brew upgrade; brew cleanup;"
alias myip="curl http://ipecho.net/plain; echo"
alias sshdir="cd ~/.ssh"
alias home="cd ~"

## Kill all java instances. Because java sucks.
alias order66="echo execute order 66; sudo killall -v -9 java"

## Purge the Xcode Derived Data folder.
alias xcpurge="rm -rf ~/Library/Developer/Xcode/DerivedData; rm -rf ~/Library/Caches/org.swift.swiftpm; rm -rf \$TMPDIR/../C/clang/ModuleCache"

## Reinstall Command line tools
alias xcode-cli-reinstall="sudo rm -rf /Library/Developer/CommandLineTools; xcode-select --install"
'

    echo "$aliases" >> ~/.zshrc
    echo "Aliases added."
else
    echo "Aliases already configured. Skipping..."
fi
