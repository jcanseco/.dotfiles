#!/usr/bin/env bash

# Installs dependencies for Ubuntu
# Usage: install_ubuntu_deps.sh
# Note: tested on Ubuntu 16.04 and 18.04

# Required
sudo apt install -y \
    git \
    curl \
    python \
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
    python-dev \
    python3-dev
