#!/bin/bash
echo "Getting apt packages"
#sudo apt-cache pkgnames > apt-packages
sudo dpkg --get-selections | awk '{ print $1 }' > apt-packages

echo "Got apt packages"
