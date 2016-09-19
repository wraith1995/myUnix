#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "error: This script must b1e run as root" 
   exit 1
fi
export DEBIAN_FRONTEND=noninteractive
sudo -E apt-get update -q -y
if [ ! -f `pwd`/apt-packages ]; then
    echo "error: apt-packages file DNE"
fi
touch apt-packages-install

sudo dpkg --get-selections | awk '{ print $1 }' > test-apt


diff --new-line-format="" --unchanged-line-format=""  apt-packages test-apt > apt-packages-install
#https://stackoverflow.com/questions/18204904/fast-way-of-finding-lines-in-one-file-that-are-not-in-another
END=$( wc -l apt-packages-install)
COUNTER=1
for pckg in $( cat apt-packages-install); do
    echo "Dealing with package "$COUNTER" out of "$END
    dpkg -l $pckg 1> /dev/null 2> /dev/null
    if [ $? -ne 0 ]; then
       
       sudo -E apt-get -y -q -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" install $pckg 1> /dev/null 2> /dev/null
       if [ $? -ne 0 ]; then
	   echo error $? adding package $pckg > crap
       fi
    fi
    COUNTER=$((COUNTER + 1))
done

rm apt-packages-install









