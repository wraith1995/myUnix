#!/bin/bash
echo "Getting pip2 and 3 packages"
touch p2
touch p3

pip3 list | awk '{print $1}' > p3
pip2 list | awk '{print $1}' > p2

echo "Got pip2 and 3 packages"

