#!/bin/bash
#kills network manager
RES=1

while [ $RES -ne 0 ]
do
    w -s | awk '{print $1}' | grep teodoro > /dev/null
    RES=$?
done

sudo stop network-manager
