#!/bin/bash
#tests if various commands and conditions are meet. Outputs virst error
#reports all systems go if everything is fine
	   
macfanctld=`ps -ef | grep macfanctld | wc -l`
if [ 2 -ne $macfanctld ]
then
    echo "Missing macfanctld"
    exit 1
fi

echo "All systems go"
