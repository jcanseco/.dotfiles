#!/usr/bin/env bash

# Implementation of 'git rh' which resets the git working tree to HEAD.
# Usage: git rh

source ~/.dotfiles/shell/helpers

if ! is_pwd_in_git_repo; then
    echo "error: not in a git repository."
    exit 1
fi

read -n1 -p "git: Resetting the working tree to HEAD. Continue? [Y/n]: " opt
printf "\n"

if [[ $opt == "Y" ]]; then
    git add -A :/ && git reset --hard
fi
