#!/usr/bin/env bash

# Background: Running FZF on big monorepos is slow due to the sheer number of
# files. We work around this issue by limiting the search space, which is
# achieved by configuring FZF to use fdfind and rg for file searches
# under-the-hood, and setting their `--ignore-file` flag. The flag takes a path
# to an ignore file which has the same syntax as .gitignore, .fdignore, and
# .ignore. Using the ignore file syntax, we limit the search to just the
# directories in the monorepo that we care about.
#
# Therefore, the goal is: when running FZF within the monorepo, use an ignore
# file to limit the search space. Otherwise, if outside the monorepo, perform a
# search on the whole project root directory as usual.
#
# flag.sh helps accomplish the above by printing out an `--ignore-file` flag if
# the current directory is within the monorepo. Otherwise, it prints nothing.
#
# For more details, see:
# https://matt-a-bennett.github.io/fzf_search_dirs/fzf_search_dirs.html
#
# Usage: flag.sh

source ~/.dotfiles/shell/helpers

if is_pwd_in_monorepo; then
    echo "--ignore-file ${HOME}/.dotfiles/vim/ignore/ignore"
fi
