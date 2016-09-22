#!/bin/sh
sudo macfanctld
echo XHC1 | sudo tee /proc/acpi/wakeup
powertop --auto-tune
nmcli device set wlp3s0 managed no
indicator-multiload &
touch /home/teodoro/Desktop/working

