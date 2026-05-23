#!/usr/bin/env bash

# Creates symlinks to dotfiles (including dotdirectories) on the home directory.
# Pre-existing dotfiles (or directories) that have name conflicts are saved onto
# the .backups directory.

# Usage: create_links.sh
# Note: safe to re-run

set -o errexit
set -o nounset
set -o pipefail

SCRIPTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null 2>&1 && pwd)"
DOTFILES_DIR="$(cd ${SCRIPTS_DIR}/.. && pwd)"

CURR_DATE_TIME="$(date '+%Y%m%d%H%M%S')"
BACKUP_DIR="${HOME}/.backups/dotfiles-${CURR_DATE_TIME}"

# Map of [symlink to be created on home dir] to [path to actual dotfile]
typeset -A DOTFILES
DOTFILES=(
    [".bash_profile"]="${DOTFILES_DIR}/shell/bash/bash_profile"
    [".bashrc"]="${DOTFILES_DIR}/shell/bash/bashrc"
    [".config/sublime-text-3/Packages/User/Preferences.sublime-settings"]="${DOTFILES_DIR}/sublime/Preferences.sublime-settings"
    [".config/sublime-text/Packages/User/Preferences.sublime-settings"]="${DOTFILES_DIR}/sublime/Preferences.sublime-settings"
    [".gemini/GEMINI.md"]="${DOTFILES_DIR}/antigravity/GEMINI.md"
    [".gemini/antigravity-cli/keybindings.json"]="${DOTFILES_DIR}/antigravity/keybindings.json"
    [".gemini/antigravity-cli/settings.json"]="${DOTFILES_DIR}/antigravity/settings.json"
    [".gemini/antigravity/skills"]="${DOTFILES_DIR}/antigravity/skills"
    [".gitconfig"]="${DOTFILES_DIR}/git/gitconfig"
    [".ssh/config"]="${DOTFILES_DIR}/ssh/config"
    [".tmux.conf"]="${DOTFILES_DIR}/tmux/tmux.conf"
    [".vimrc"]="${DOTFILES_DIR}/vim/vimrc"
    [".zshrc"]="${DOTFILES_DIR}/shell/zsh/zshrc"
)

function main {
    echo "Backing up any pre-existing files (or directories)..."
    mkdir -p "${BACKUP_DIR}"
    for f in "${!DOTFILES[@]}"; do
        parent_dirs=$(dirname ${f}) # Outputs "." if f has no parent directory (see dirname --help)
        backup_dir="${BACKUP_DIR}/${parent_dirs}"

        file="${HOME}/${f}"
        if [[ -e ${file} ]]; then
            mkdir -p ${backup_dir}
            cp -rv ${file} ${backup_dir}/
            rm -rf ${file}
        fi
    done
    echo ""

    echo "Creating symlinks to dotfiles in the home directory..."
    for f in "${!DOTFILES[@]}"; do
        parent_dirs=$(dirname ${f}) # Outputs "." if f has no parent directory (see dirname --help)
        mkdir -p "${HOME}/${parent_dirs}"

        symlink="${HOME}/${f}"
        file="${DOTFILES[${f}]}"
        ln -sv ${file} ${symlink}
    done
    echo ""

    echo "Done."
}

main
