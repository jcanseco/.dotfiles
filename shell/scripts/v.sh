#!/usr/bin/env bash

# Helper for opening files in vim
# Usage: v.sh [FILE]
# Note: treats multiple arguments as one filename with spaces

file="$@"

# Open current directory by default if no file argument given.
if [[ -z $file ]]; then
    vim .
    exit
fi

# Open file or directory if it exists.
if [[ -f $file ]] || [[ -d $file ]]; then
    vim "$file"
    exit
fi

# Prompt user regarding creating a new file if it does not exist.
read -n1 -p "vim: Creating new file '$file'. Continue? [Y/n]: " opt
printf "\n"
if [[ $opt == "Y" ]]; then
    vim "$file"
    exit
fi
