#!/bin/bash
#provides information about the fan speed and cpu temp
fan=`cat  /var/log/macfanctl.log | tail -n 1 | grep -o "Speed: [0-9]*"`
tmp=`cat  /var/log/macfanctl.log | tail -n 1 | grep -o "AVG: [0-9]*\.[0-9]*C"`

echo $tmp":"$fan
