#!/bin/bash

touch apt-repo
#help from https://askubuntu.com/questions/148932/how-can-i-get-a-list-of-all-repositories-and-ppas-from-the-command-line
# listppa Script to get all the PPA installed on a system ready to share for reininstall
for APT in `find /etc/apt/ -name \*.list`; do
    grep -o "^deb http://ppa.launchpad.net/[a-z0-9\-]\+/[a-z0-9\-]\+" $APT | while read ENTRY ; do
        USER=`echo $ENTRY | cut -d/ -f4`
        PPA=`echo $ENTRY | cut -d/ -f5`
        echo ppa:$USER/$PPA >> apt-repo
    done
done


# Script to get all the PPA installed on a system
for APT in `find /etc/apt/ -name \*.list`; do
    grep -Po "(?<=^deb\s).*?(?=#|$)" $APT | while read ENTRY ; do
        HOST=`echo $ENTRY | cut -d/ -f3`
        USER=`echo $ENTRY | cut -d/ -f4`
        PPA=`echo $ENTRY | cut -d/ -f5`
        #echo sudo apt-add-repository ppa:$USER/$PPA
        if [ "ppa.launchpad.net" = "$HOST" ]; then
            echo ppa:$USER/$PPA >> apt-repo
        else
            echo \'${ENTRY}\' >> apt-repo
        fi
    done
done
