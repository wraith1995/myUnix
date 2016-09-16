#!/bin/bash
#tries to execute $1 every 30 seconds until it is done

while ! $1; do
    sleep 30
done

xmessage "$1" completed!
