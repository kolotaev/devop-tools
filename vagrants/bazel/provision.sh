#!/usr/bin/env bash

BAZEL_VERSION=4.2.2

# Update sources
apt-get update
apt-get upgrade -y
apt-get dist-upgrade -y

# Install git
apt-get install git -y

# Install curl
apt-get install curl software-properties-common -y

# Install g++ and friends
apt-get install g++ autoconf libtool build-essential automake -y

# Install Bazel
apt-get install unzip zip openjdk-8-jdk -y
cd /tmp
wget "https://github.com/bazelbuild/bazel/releases/download/${BAZEL_VERSION}/bazel-${BAZEL_VERSION}-installer-linux-x86_64.sh"
chmod +x "bazel-${BAZEL_VERSION}-installer-linux-x86_64.sh"
./"bazel-${BAZEL_VERSION}-installer-linux-x86_64.sh"
