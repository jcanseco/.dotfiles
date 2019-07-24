#!/bin/bash

# Helper for opening files in zathura (PDF reader)
# Usage: za.sh <filename>

if [[ ! -f $1 ]]; then
    echo "Error: file not found: '$1'"
    exit 1
fi

zathura --fork $1
