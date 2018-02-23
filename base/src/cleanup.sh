#!/usr/bin/env bash

set -xe

echo "Clean up"

apt-get clean all
cat $KATALON_VERSION_FILE