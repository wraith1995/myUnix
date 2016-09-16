#!/bin/bash
#a test of present progress bar like activities

sek=60
echo "60 Seconds Wait!"
echo -n "One Moment please "
while [ $sek -ge 1 ]
do
   echo -n "$sek" 

sleep 1
   sek=$[$sek-1]
   echo -en "\b\b"
done
echo
echo "ready!"
