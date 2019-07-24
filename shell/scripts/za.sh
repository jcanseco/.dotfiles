#!/usr/bin/env bash

# Helper for opening files in zathura (PDF reader)
# Usage: za.sh <filename>
# Note: treats multiple arguments as one filename with spaces

file="$@"

if [[ ! -f $file ]]; then
    echo "Error: file not found: '$file'"
    exit 1
fi

zathura --fork "$file"
