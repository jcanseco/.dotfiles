#!/usr/bin/env bash

# Installs Docker and sets it up so that 'docker' can be executed without
# needing to prepend it with 'sudo'.
# Usage: install_docker.sh
# Note: based on instructions at
# https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-debian-10

# Update your existing list of packages
sudo apt update

# Install prerequisites which let 'apt' use packages over HTTPS
sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common

# Add GPG key for official Docker repository to your system
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

# Add Docker repository to APT sources
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

# Update package database with Docker packages from newly added repo
sudo apt update

# Install Docker
sudo apt install docker-ce

# Allow current ${USER} to run 'docker' without 'sudo'
sudo usermod -aG docker ${USER}

cat << EOF


!!!!! ACTION REQUIRED !!!!!

*  Log out then log back in (if you're on SSH, disconnect then reconnect). You
   need to do this to apply the changes that'd allow you to run 'docker'
   without 'sudo'.

*  Verify success by running 'id -nG' and verifying that your user is in the
   group 'docker'.

*  If that didn't work, try rebooting the system.

!!!!!!!!!!!!!!!!!!!!!!!!!!!

EOF
