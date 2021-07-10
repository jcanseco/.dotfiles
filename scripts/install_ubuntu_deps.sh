#!/usr/bin/env bash

# Installs dependencies for Ubuntu
# Usage: install_ubuntu_deps.sh
# Note: tested on Ubuntu 16.04 and 18.04

# Repositories
sudo add-apt-repository -y ppa:longsleep/golang-backports # Golang (see https://github.com/golang/go/wiki/Ubuntu)
sudo apt update

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
    zathura \
    golang-go

# YouCompleteMe
sudo apt install -y \
    build-essential \
    cmake \
    python3-dev
