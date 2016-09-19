#!/bin/bash
#attempts to collect telegram histories via the history command
#generally ineffective

RUN_DIR=`pwd`

cd ~
cd tg

CONTACT_LIST=$( (echo "contact_list"; sleep 10; echo "quit") | bin/telegram-cli -I | grep "user\#.*" )
#echo $CONTACT_LIST

touch CL
CLD=`realpath CL`


for word in $CONTACT_LIST 
do
    NAME=$( echo $word | grep "user#" | sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g" )
    touch $NAME 2> /dev/null
    if [ $? -eq 0 ]; then
	( echo "contact_list"; sleep 10; echo "history $NAME 90000" ; sleep 60; echo "safe_quit") | bin/telegram-cli -I -W | sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g" > $NAME
    fi
done
