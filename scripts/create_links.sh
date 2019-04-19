#!/bin/bash

# Creates symlinks to dotfiles (including dotdirectories) on the home directory.
# Pre-existing dotfiles (or directories) that have name conflicts are saved onto
# the .backups directory.

SCRIPTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null 2>&1 && pwd)"
DOTFILES_DIR="$(cd $SCRIPTS_DIR/.. && pwd)"

CURR_DATE_TIME="$(date '+%Y%m%d%H%M%S')"
BACKUP_DIR="${HOME}/.backups/${CURR_DATE_TIME}"

# Map of [symlink to be created on home dir] to [path to actual dotfile]
typeset -A DOTFILES
DOTFILES=(
    [".gitconfig"]="${DOTFILES_DIR}/git/gitconfig"
)

function handle_error {
    printf "\nError encountered. Stop.\n"
    exit 1
}

function main {
    echo "Backing up any pre-existing files (or directories)..."
    mkdir -p "${BACKUP_DIR}"
    for f in "${!DOTFILES[@]}"; do
        file="${HOME}/${f}"
        if [[ -e $file ]]; then
            cp -rv $file $BACKUP_DIR/ || handle_error
            rm -rf $file || handle_error
        fi
    done
    echo ""

    echo "Creating symlinks to dotfiles in the home directory..."
    for f in "${!DOTFILES[@]}"; do
        symlink="${HOME}/${f}"
        file="${DOTFILES[$f]}"
        ln -sv $file $symlink || handle_error
    done
    echo ""

    echo "Done."
}

main
