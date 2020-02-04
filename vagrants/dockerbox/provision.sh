#!/usr/bin/env bash

# Update sources
apt-get update -y
apt-get upgrade -y
# apt-get dist-upgrade -y

# Install git
# apt-get install git -y

# Install curl
apt-get install curl software-properties-common -y

# Install g++ and friends
apt-get install g++ autoconf libtool build-essential automake -y

# Install Docker
if [ -x "$(command -v docker)" ]; then
    echo "Docker is already installed"
else
    echo "Install docker"
    cd /tmp
    curl -fsSL get.docker.com -o get-docker.sh
    sh get-docker.sh
    usermod -aG docker vagrant
fi
