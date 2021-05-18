#!/bin/zsh

echo "Begin Setup..."

chmod 0700 oh_my_zsh_install.sh
chmod 0700 homebrew_install.sh
chmod 0700 zshrc_alias_setup.sh
chmod 0700 ssh_key_setup.sh

sh oh_my_zsh_install.sh
sh homebrew_install.sh
sh zshrc_alias_setup.sh
sh ssh_key_setup.sh

echo "\nEnvironment Setup Complete."

exit 0
