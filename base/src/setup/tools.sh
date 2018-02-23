#!/usr/bin/env bash

set -xe

echo "Install tools"

apt-get update
apt-get install -y apt-utils
apt-get upgrade -y
apt-get dist-upgrade -y
apt-get install -y wget