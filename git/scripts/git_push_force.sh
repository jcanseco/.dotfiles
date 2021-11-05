#!/usr/bin/env bash

# Implementation of 'git psf' which force pushes BRANCH to REMOTE/BRANCH.
# Usage: git psf [REMOTE] [BRANCH]
#
# Note: First attempts the push with '--force-with-lease', which fails if the
# remote branch has new commits that you have not yet pulled (see
# https://stackoverflow.com/a/52823955)
#
# If '--force-with-lease' fails, prompts if you'd like to proceed with
# '--force' anyway.
#
# Note: even if this script accepts arguments, it actually only works if the
# arguments are what we expect them to be (i.e. BRANCH is the current branch,
# and REMOTE/BRANCH is the remote branch being tracked by BRANCH). This is done
# intentionally. The script assumes that you've made a mistake if you've called
# it with unexpected arguments, and thus brings your attention to the matter by
# failing and giving you a warning. This is done to prevent fat-finger errors.

# Terminate immediately if not currently in a git working tree
git rev-parse --is-inside-work-tree > /dev/null || exit 1

remote=$1
branch=$2

[[ -z $remote ]] && { echo "git: Error: no argument provided for remote."; exit 1; }
[[ -z $branch ]] && { echo "git: Error: no argument provided for branch."; exit 1; }

curr_branch="$(git symbolic-ref --short -q HEAD)"
if [[ $branch != $curr_branch ]]; then
    echo "git: Error: '$branch' is not the currently checked out branch."
    exit 1
fi

# Determine remote branch tracked by $branch
# (see https://stackoverflow.com/a/9753364)
remote_branch=$(git for-each-ref --format='%(upstream:short)' $(git rev-parse --symbolic-full-name $branch 2> /dev/null))
if [[ $remote/$branch != $remote_branch ]]; then
    echo "git: Error: the remote branch tracked by '$branch' is not '$remote/$branch', but '$remote_branch'"
    exit 1
fi

# Helper for generating coloured terminal output using tput
# (see https://stackoverflow.com/a/20983251)
function emph {
    local bold="$(tput bold)"
    local red="$(tput setaf 1)"
    local reset="$(tput sgr0)"

    local str="$@"
    echo $bold$red$str$reset
}

read -n1 -p "git: Force pushing $(emph $branch) to $(emph $remote/$branch) with lease. Continue? [Y/n]: " opt
printf "\n"

if [[ $opt == "Y" ]]; then
    # Command to push $branch to $remote/$branch
    # Note: it's important to understand that this commonly used syntax for
    # git-push is fairly misleading and can therefore be dangerous when used
    # with something like --force[-with-lease], hence all the safety checks
    # (see https://longair.net/blog/2011/02/27/an-asymmetry-between-git-pull-and-git-push)
    git_push_cmd="git push $remote $branch"

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
