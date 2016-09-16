#!/bin/bash
#reports the essid
iwconfig | grep ESSID | sed -e 's/.*ESSID:"\(.*\)".*/\1/'

