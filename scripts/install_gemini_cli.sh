#!/usr/bin/env bash

# Installs Gemini CLI for Debian-like Linux distros (e.g. Ubuntu).
# Usage: install_gemini_cli.sh

set -o errexit
set -o nounset
set -o pipefail

# Gemini CLI requires Node.js 20+ per
# https://github.com/google-gemini/gemini-cli/issues/14739#issuecomment-3652221623.
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install -y nodejs

# In some Linux distros, installing nodejs automatically installs npm, and
# trying to install npm separately results in an error. In other distros, you
# have to install npm separately.
if ! command -v npm &> /dev/null; then
  sudo apt install -y npm
fi

sudo npm install -g @google/gemini-cli
