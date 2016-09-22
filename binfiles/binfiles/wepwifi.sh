#!/bin/sh
##connects to a wep network with essid $1 and password $2
sudo ifdown wlp3s0
sudo rfkill unblock wifi
sudo iwconfig wlp3s0 essid $1
sudo iwconfig wlp3s0 key $2
sudo ifconfig wlp3s0 up
sudo dhclient wlp3s0
