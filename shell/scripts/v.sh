#!/bin/bash

# Helper for opening files in vim
# Usage: v.sh <filename>

# Open current directory by default if no file argument given.
if [[ $# == 0 ]]; then
    vim .
    exit
fi

# Open file or directory if it exists.
if [[ -f $1 ]] || [[ -d $1 ]]; then
    vim $1
    exit
fi

# Prompt user regarding creating a new file if it does not exist.
read -n1 -p "vim: Creating new file '$1'. Continue? [Y/n]: " opt
printf "\n"
if [[ $opt == "Y" ]]; then
    vim $1
    exit
fi
