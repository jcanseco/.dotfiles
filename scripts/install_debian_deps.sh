#!/usr/bin/env bash

# Installs dependencies for Debian-like Linux distros (e.g. Ubuntu).
# Usage: install_debian_deps.sh

SCRIPTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null 2>&1 && pwd)"

# Required
sudo apt install -y \
    git \
    curl \
    python3 \
    exuberant-ctags \
    vim \
    tmux \
    zsh \
    fd-find

# Extras
sudo apt install -y \
    tree \
    ripgrep \
    vim-gtk \
    libterm-readkey-perl

# YouCompleteMe
sudo apt install -y \
    build-essential \
    cmake \
    python3-dev

# go
sudo ${SCRIPTS_DIR}/install_golang.sh

# kubectl
sudo ${SCRIPTS_DIR}/install_kubectl.sh

# docker
sudo ${SCRIPTS_DIR}/install_docker.sh
