#!/usr/bin/env bash

# Installs Go to /usr/local/go ('go' binary at /usr/local/go/bin)
# Usage: install_golang.sh
# Note: based on installation instructions at https://golang.org/doc/install

GO_VERSION="1.17.3" # Available versions: https://golang.org/dl/
OS="linux"
ARCH="amd64"

TARBALL_NAME="go${GO_VERSION}.${OS}-${ARCH}.tar.gz"
TARBALL_URL="https://golang.org/dl/${TARBALL_NAME}"

INSTALL_DIR="/usr/local"
INSTALL_PATH="/usr/local/go"

if [[ -f $INSTALL_PATH ]] || [[ -d $INSTALL_PATH ]]; then
    echo "error: a file or directory already exists at the installation path" \
        "'${INSTALL_PATH}'; check that it is safe to delete, then delete it" \
        "and re-run the installation script."
    exit 1
fi

download_dir=$(mktemp -dt "install_golang.sh.XXXXX")

echo "Downloading ${TARBALL_URL} to ${download_dir}..."
cd $download_dir
wget $TARBALL_URL

echo "Extracting ${TARBALL_NAME} to ${INSTALL_DIR}..."
tar -C $INSTALL_DIR -xzf $TARBALL_NAME
