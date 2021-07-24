#!/usr/bin/env bash

# Usage: bootstrap.sh
# Note: safe to re-run; logs to $LOG_FILE

SCRIPTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null 2>&1 && pwd)"

CURR_DATE_TIME="$(date '+%Y%m%d%H%M%S')"
LOG_DIR="${HOME}/.bootstrap.log"
LOG_FILE="${LOG_DIR}/bootstrap-${CURR_DATE_TIME}.log"

function handle_error {
    printf "\n[Bootstrap] Error encountered. Stop.\n"
    exit 1
}

function check_cmd_exists {
    cmd=$1
    command -v $cmd > /dev/null 2>&1 || {
        echo >&2 "[Bootstrap] Command not found: $cmd. Aborting."
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

function bootstrap {
    # Create directories
    printf "\n[Bootstrap] Creating the Workspace and Quicklinks directories...\n"
    mkdir -p ~/Workspace || handle_error
    mkdir -p ~/Quicklinks || handle_error

    # Create symlinks
    printf "\n[Bootstrap] Creating symlinks to dotfiles...\n"
    $SCRIPTS_DIR/create_links.sh || handle_error

    # Download Base16 Shell
    printf "\n[Bootstrap] Downloading Base16 Shell...\n"
    git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell || handle_error

    # Download zgen
    printf "\n[Bootstrap] Downloading zgen...\n"
    git clone https://github.com/jcanseco/zgen.git ~/.zgen || handle_error

    # Download zsh plugins
    printf "\n[Bootstrap] Downloading zsh plugins...\n"
    zsh -c 'source ~/.dotfiles/shell/zsh/plugins' || handle_error

    # Download Tmux Plugin Manager
    printf "\n[Bootstrap] Downloading Tmux Plugin Manager...\n"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm || handle_error

    # Download tmux plugins
    # Requires a bit of a hack to work (see https://github.com/tmux-plugins/tpm/issues/151)
    printf "\n[Bootstrap] Downloading tmux plugins...\n"
    tmux new-session -d "sleep 1" \
        && sleep 0.1 \
        && ~/.tmux/plugins/tpm/bin/install_plugins \
        || handle_error

    # Download vim-plug
    printf "\n[Bootstrap] Downloading vim-plug...\n"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim || handle_error

    # Download vim plugins
    printf "\n[Bootstrap] Downloading vim plugins...\n"
    vim +PlugInstall +qa!

    # Done
    printf "\n[Bootstrap] Done.\n"
}

function main {
    check_deps_exist

    mkdir -p $LOG_DIR || handle_error
    touch $LOG_FILE || handle_error

    # Run bootstrap with logging
    # Different ways of saving terminal output to a file: https://askubuntu.com/a/731237
    # Using tee with '|&' but in a way that works with older versions of bash: https://askubuntu.com/a/485762
    bootstrap 2>&1 | tee $LOG_FILE

    printf "\n[Bootstrap] Logs: $LOG_FILE\n"
}

main
