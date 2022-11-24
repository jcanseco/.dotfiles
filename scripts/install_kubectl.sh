#!/usr/bin/env bash

# Installs 'kubectl' binary into /usr/local/bin.
# Usage: install_kubectl.sh
# Note: based on instructions at
# https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/#install-kubectl-binary-with-curl-on-linux

VERSION=1.25.4 # Available versions: https://kubernetes.io/releases/

download_dir=$(mktemp -dt "install_kubectl.sh.XXXXX")

cd $download_dir
curl -LO "https://dl.k8s.io/release/v${VERSION}/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
