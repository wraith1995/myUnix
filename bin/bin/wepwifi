#!/bin/sh
##connects to a wep network with essid $1 and password $2
sudo ifdown wlan0
sudo rfkill unblock wifi
sudo iwconfig wlan0 essid $1
sudo iwconfig wlan0 key $2
sudo ifconfig wlan0 up
sudo dhclient wlan0
