#!/usr/bin/env bash

# Helper for quick creation of temporary sandbox projects in vim
# Usage: vs.sh <extension>

ext=$1
tmp_dir=$(mktemp -d)

if [[ -z $ext ]]; then
    vim "$tmp_dir/main"
else
    vim "$tmp_dir/main.$ext"
fi

echo "Temporary project created in: $tmp_dir"
