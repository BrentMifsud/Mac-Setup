#!/bin/zsh

## Check if SSH key already exists
PUBLICKEY=~/.ssh/id_rsa.pub
PRIVATEKEY=~/.ssh/id_rsa

if test -f "$PUBLICKEY" && test -f "$PRIVATEKEY"; then
    echo "\nSSH key already exists.";
    echo "Skipping SSH Keygen..."
else
    ## Setup ssh
    echo "\nSSH key not found."
    echo "Setting up ssh key. Please follow the prompts..."
    ssh-keygen
    echo "\nDone."
fi