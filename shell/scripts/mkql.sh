#!/usr/bin/env bash

# Create a symlink to the current directory in ~/Quicklinks/
# Usage: mkql.sh LINKNAME
# Note: treats multiple arguments as one filename with spaces

link="$@"

if [[ ! -d ~/Quicklinks/ ]]; then
    echo "Error: ~/Quicklinks/ does not exist."
    exit 1
elif [[ -z $link ]]; then
    echo "Error: no argument provided for link name."
    exit 1
fi

ln -s "$(pwd -P)" ~/Quicklinks/"$link"
