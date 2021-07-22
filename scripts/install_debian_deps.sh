#!/usr/bin/env bash

# Installs dependencies for Debian-like Linux distros (e.g. Ubuntu).
# Usage: install_debian_deps.sh

# Required
sudo apt install -y \
    git \
    curl \
    python3 \
    exuberant-ctags \
    vim \
    tmux \
    zsh

# Extras
sudo apt install -y \
    tree \
    silversearcher-ag \
    vim-gtk \
    libterm-readkey-perl \
    zathura

# YouCompleteMe
sudo apt install -y \
    build-essential \
    cmake \
    python3-dev
