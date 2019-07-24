#!/usr/bin/env bash

# Search for files within the current directory whose filename contains a given string
# Usage: search.sh <filename>

find . -iname "*$@*" | less
