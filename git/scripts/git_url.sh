#!/usr/bin/env bash

# Implementation of 'git url' which prints the remote URL of the given PATH.
# Usage: git url [PATH]
# Uses the current directory as the PATH if unspecified.

# Note: While 'git url' only accepts one argument, 'git_url.sh' accepts an
# extra argument, CALLING_DIRECTORY, which represents the directory from which
# the script is called. This argument is set to $GIT_PREFIX by git (via
# gitconfig) when calling git_url.sh. This is done since there is no other way
# to determine the calling directory from within git_url.sh: the script's
# working directory is _always_ the repo's root directory (where the .git
# directory is stored) no matter from where in the repo the script is called.

source ~/.dotfiles/shell/helpers

if ! is_pwd_in_git_repo; then
    echo "error: not in a git repository."
    exit 1
fi

calling_directory=${1}
path=${2}
case ${path} in
    "") path_relative_to_repo_root=${calling_directory} ;;
    *)  path_relative_to_repo_root=${calling_directory}${path} ;; # Note: ${calling_directory} already ends in a slash, so no need to add one
esac

remote_url=$(git remote get-url --push origin)
case ${remote_url} in
    # GitHub repository (SSH)
    "git@github.com:"*".git")
        url_without_prefix="${remote_url#"git@github.com:"}"
        url_without_suffix="${url_without_prefix%".git"}"
        echo "https://github.com/${url_without_suffix}/tree/master/${path_relative_to_repo_root}"
    ;;

    # GitHub repository (HTTPS)
    "https://github.com/"*".git")
        url_without_suffix="${remote_url%".git"}"
        echo "${url_without_suffix}/tree/master/${path_relative_to_repo_root}"
    ;;

    # Unregonized repository
    *)
        echo "error: unrecognized remote url: ${remote_url}"
        exit 1
    ;;
esac
