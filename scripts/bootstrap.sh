#!/usr/bin/env bash

# Usage: bootstrap.sh
# Note: safe to re-run; logs to $LOG_FILE

set -o errexit
set -o nounset
set -o pipefail

SCRIPTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null 2>&1 && pwd)"

CURR_DATE_TIME="$(date '+%Y%m%d%H%M%S')"
LOG_DIR="${HOME}/.bootstrap.log"
LOG_FILE="${LOG_DIR}/bootstrap-${CURR_DATE_TIME}.log"

function check_cmd_exists {
    cmd=$1
    command -v ${cmd} > /dev/null 2>&1 || {
        echo >&2 "[Bootstrap] Command not found: ${cmd}. Aborting."
        exit 1
    }
}

function check_deps_exist {
    check_cmd_exists tee
    check_cmd_exists git
    check_cmd_exists curl
    check_cmd_exists zsh
    check_cmd_exists tmux
    check_cmd_exists vim
}

function git_clone {
    url=$1
    directory=$2

    rm -rf ${directory} && git clone --depth 1 ${url} ${directory}
}

function bootstrap {
    # Create directories
    printf "\n[Bootstrap] Creating directories: Workspace, Quicklinks, scripts, notes...\n"
    mkdir -p ~/Quicklinks
    mkdir -p ~/Workspace
    mkdir -p ~/Workspace/go
    mkdir -p ~/Workspace/go/bin
    mkdir -p ~/Workspace/go/src
    mkdir -p ~/Workspace/scripts
    mkdir -p ~/Documents/notes

    # Create symlinks
    printf "\n[Bootstrap] Creating symlinks to dotfiles...\n"
    ${SCRIPTS_DIR}/create_links.sh

    # Source env file to set GOPATH; must be done before vim-go begins
    # installing go packages so that packages can be installed under GOPATH
    # instead of the home directory
    printf "\n[Bootstrap] Sourcing env file to set up environment variables...\n"
    source ~/.dotfiles/shell/env

    # Download Base16 Shell
    printf "\n[Bootstrap] Downloading Base16 Shell...\n"
    git_clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

    # Download zgenom
    printf "\n[Bootstrap] Downloading zgenom...\n"
    git_clone https://github.com/jandamm/zgenom.git ~/.zgenom

    # Download fzf
    printf "\n[Bootstrap] Downloading fzf...\n"
    git_clone https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --bin # Install binary only (don't touch bash/zsh configs)

    # Download zsh plugins
    printf "\n[Bootstrap] Downloading zsh plugins...\n"
    zsh -c 'source ~/.dotfiles/shell/zsh/plugins'

    # Download Tmux Plugin Manager
    printf "\n[Bootstrap] Downloading Tmux Plugin Manager...\n"
    git_clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

    # Download tmux plugins
    # Requires a bit of a hack to work (see https://github.com/tmux-plugins/tpm/issues/151)
    printf "\n[Bootstrap] Downloading tmux plugins...\n"
    tmux new-session -d "sleep 1" \
        && sleep 0.1 \
        && ~/.tmux/plugins/tpm/bin/install_plugins

    # Download vim-plug
    printf "\n[Bootstrap] Downloading vim-plug...\n"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    # Download vim plugins
    printf "\n[Bootstrap] Downloading vim plugins...\n"
    vim +PlugInstall +qa!

    # Done
    printf "\n[Bootstrap] Done.\n"
}

function main {
    check_deps_exist

    mkdir -p ${LOG_DIR}
    touch ${LOG_FILE}

    # Run bootstrap with logging
    # Different ways of saving terminal output to a file: https://askubuntu.com/a/731237
    # Using tee with '|&' but in a way that works with older versions of bash: https://askubuntu.com/a/485762
    bootstrap 2>&1 | tee ${LOG_FILE}

    printf "\n[Bootstrap] Logs: ${LOG_FILE}\n"
}

main
