#!/usr/bin/env bash

# Installs Gemini CLI for Debian-like Linux distros (e.g. Ubuntu).
# Usage: install_gemini_cli.sh

set -o errexit
set -o nounset
set -o pipefail

# Gemini CLI requires Node.js 20+ per
# https://github.com/google-gemini/gemini-cli/issues/14739#issuecomment-3652221623.
# Note that nodejs automatically comes with the npm command.
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install -y nodejs

sudo npm install -g @google/gemini-cli
