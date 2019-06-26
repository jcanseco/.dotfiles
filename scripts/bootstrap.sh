#!/bin/bash

SCRIPTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null 2>&1 && pwd)"

function check_cmd_exists {
    cmd=$1
    command -v $cmd > /dev/null 2>&1 || {
        echo >&2 "[Bootstrap] Command not found: $cmd. Aborting."
        exit 1
    }
}

# Check if git and curl exist
check_cmd_exists git
check_cmd_exists curl

# Create directories
printf "\n[Bootstrap] Creating the Workspace and Quicklinks directories...\n"
mkdir -p ~/Workspace
mkdir -p ~/Quicklinks

# Download Base16 Shell
printf "\n[Bootstrap] Downloading Base16 Shell...\n"
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

# Download zgen
printf "\n[Bootstrap] Downloading zgen...\n"
git clone https://github.com/tarjoilija/zgen.git ~/.zgen

# Download vim-plug
printf "\n[Bootstrap] Downloading vim-plug...\n"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Download Tmux Plugin Manager
printf "\n[Bootstrap] Downloading Tmux Plugin Manager...\n"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Download tmux plugins
printf "\n[Bootstrap] Downloading tmux plugins...\n"
~/.tmux/plugins/tpm/bin/install_plugins

# Create symlinks
printf "\n[Bootstrap] Creating symlinks to dotfiles...\n"
$SCRIPTS_DIR/create_links.sh
