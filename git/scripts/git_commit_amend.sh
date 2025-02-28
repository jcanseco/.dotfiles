#!/usr/bin/env bash

# Implementation of 'git amd' which amends the current git commit.
# Usage: git amd

source ~/.dotfiles/shell/helpers

if ! is_pwd_in_git_repo; then
    echo "error: not in a git repository."
    exit 1
fi

read -n1 -p "git: Amending commit. Continue? [Y/n]: " opt
printf "\n"

if [[ ${opt} == "Y" ]]; then
    git commit --amend
fi
