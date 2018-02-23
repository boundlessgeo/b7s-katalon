#!/usr/bin/env bash

set -xe

echo "Install Mozilla Firefox"

if [[ -v FIREFOX_DEB_URL ]]; then
  package='firefox.deb'
  wget -O $package  $FIREFOX_DEB_URL
  dpkg -i $package || apt-get install -y -f
  rm $package
else
  apt-get install -y firefox
fi

# Install 'pulseaudio' package to support WebRTC audio streams
apt install -y pulseaudio

echo "$(firefox -version)" >> $KATALON_VERSION_FILE
