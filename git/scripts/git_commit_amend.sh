#!/usr/bin/env bash

# Implementation of 'git amd' which amends the current git commit.
# Usage: git amd

# Terminate immediately if not currently in a git working tree
git rev-parse --is-inside-work-tree > /dev/null || exit 1

read -n1 -p "git: Amending commit. Continue? [Y/n]: " opt
printf "\n"

if [[ $opt == "Y" ]]; then
    git commit --amend
fi
