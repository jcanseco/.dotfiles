#!/bin/bash

# Create a symlink to the current directory in ~/Quicklinks/
# Usage: mkql.sh <linkname>

if [[ ! -d ~/Quicklinks/ ]]; then
    echo "Error: ~/Quicklinks/ does not exist."
    exit 1
elif [[ -z $1 ]]; then
    echo "Error: no argument provided for link name."
    exit 1
fi

ln -s "$(pwd -P)" ~/Quicklinks/"$1"
