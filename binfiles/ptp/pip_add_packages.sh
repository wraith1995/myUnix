#!/bin/bash
#Owner Teo F. Collin
#Run with p2 and p3, which are lists of python 2 and 3 packages
#Run in the same directory of them
#Requires sudo to run
#todo:
#list failures
#better output?
#logs......hmmm



if [ -e "p2" ]; then
    for pckg in $( cat p2); do
	#echo $pckg
	sudo pip install $pckg
	if [ $? -ne 0 ]; then
	    echo error $? installing package $pckg
	fi
    done
else
    echo "error: pip2 file DNE"
fi

 
if [ -e "p3" ]; then
    for pckg in $( cat p3); do
	#echo $pckg
	sudo pip3 install $pckg
	if [ $? -ne 0 ]; then
	    echo error $? installing package $pckg
	fi
    done
else
    echo "error: pip2 file DNE"
fi

  
