#!/usr/bin/env bash

# Helper script for force pushing to remote.
# Usage: git_push_force.sh [REMOTE] [LOCAL_BRANCH] [REMOTE_BRANCH]
# Note: First attempts the push with '--force-with-lease', which fails if the
# remote branch has new commits that you have not yet pulled. If force-with-lease
# fails, displays a prompt if you'd like to continue with regular '--force'
# anyway (see https://stackoverflow.com/a/52823955)

curr_branch="$(git symbolic-ref --short -q HEAD)"

remote=${1:-"origin"}
local_branch=${2:-"$curr_branch"}
remote_branch=${3:-"$local_branch"}

# This is the most explicit way to make a push (and works the same way
# regardless of what push.default is set to). To understand what happens when
# you omit certain parts of this line (e.g. remote/local_branch/remote_branch),
# see https://longair.net/blog/2011/02/27/an-asymmetry-between-git-pull-and-git-push
git_push_cmd="git push $remote $local_branch:$remote_branch"

# Helper for generating coloured terminal output using tput
# (see https://stackoverflow.com/a/20983251)
function emph {
    local bold="$(tput bold)"
    local red="$(tput setaf 1)"
    local reset="$(tput sgr0)"

    local str="$@"
    echo $bold$red$str$reset
}

read -n1 -p "git: Force pushing $(emph $local_branch) to $(emph $remote/$remote_branch) with lease. Continue? [Y/n]: " opt
printf "\n"

if [[ $opt == "Y" ]]; then
    $git_push_cmd --force-with-lease

    if [[ $? -ne 0 ]]; then
        printf "\n"
        read -n1 -p "git: Force push with lease failed. Proceed with regular force push? [Y/n]: " opt
        printf "\n"

        if [[ $opt == "Y" ]]; then
            $git_push_cmd --force
        fi
    fi
fi
