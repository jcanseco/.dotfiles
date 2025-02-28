#!/usr/bin/env bash

# Generates an ignore file such that only the directories listed in
# ALLOWLISTED_DIRS are allowlisted by the ignore file (i.e. included in fdfind
# and rg searches).
#
# Usage: generate.sh

set -o errexit
set -o nounset
set -o pipefail

# Directories to allowlist in the ignore file (i.e. include in fdfind and rg
# searches). Note: paths are relative to the monorepo root.
ALLOWLISTED_DIRS=(
    # Keep sorted.
    "my/team/project1" # My team's project 1
    "my/team/project2" # My team's project 2
    "other/team/library" # My team's dependency
)

IGNORE_FILE="${HOME}/.dotfiles/vim/ignore/ignore"
IGNORE_HEADER_FILE="${HOME}/.dotfiles/vim/ignore/ignore_header"

# added_entries is an associative array (i.e. map) containing entries already
# added to IGNORE_FILE. This is meant to be used by append_if_does_not_exist
# only.
declare -A added_entries

# append_if_does_not_exist appends the given entry to IGNORE_FILE if it does
# not exist on the file yet.
function append_if_does_not_exist {
    entry=$1
    # Return early if entry exists in the associative array already (see
    # https://stackoverflow.com/a/45385463).
    if [[ -v "added_entries[${entry}]" ]]; then
        return
    fi
    printf "\n${entry}" >> ${IGNORE_FILE}
    added_entries["${entry}"]=true
}

# Delete existing ignore file.
rm ${IGNORE_FILE}

# Write the header comment.
cat ${IGNORE_HEADER_FILE} >> ${IGNORE_FILE}

# Write the entry that says to ignore all files and directories in the monorepo root.
append_if_does_not_exist "*"
printf "\n" >> ${IGNORE_FILE}

for path in ${ALLOWLISTED_DIRS[@]}; do
    printf "\n# Allow '${path}'" >> ${IGNORE_FILE}

    # Split the path into separate tokens.
    origIFS="${IFS}"
    IFS="/"
    tokens=()
    for token in ${path[@]}; do
        tokens+=(${token})
    done
    IFS="${origIFS}"

    # Process each token.
    path_so_far=""
    for token in ${tokens[@]}; do
        path_so_far="${path_so_far}/${token}"
        path_so_far="${path_so_far#/}" # Strip leading slash

        append_if_does_not_exist "!${path_so_far}"

        # If current token is not the last token
        if [[ ${path_so_far} != ${path} ]]; then
            append_if_does_not_exist "${path_so_far}/**"
        else
            # Allowlist all files and directories inside 'path'
            append_if_does_not_exist "!${path_so_far}/**"
        fi
    done

    printf "\n" >> ${IGNORE_FILE}
done
