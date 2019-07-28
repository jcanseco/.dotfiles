#!/usr/bin/env bash

# Helper script for resetting the git working tree to HEAD.
# Usage: git_reset_hard.sh

read -n1 -p "git: Resetting the working tree to HEAD. Continue? [Y/n]: " opt
printf "\n"

if [[ $opt == "Y" ]]; then
    git add -A && git reset --hard
fi
