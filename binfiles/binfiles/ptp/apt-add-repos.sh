#!/bin/bash
echo "Getting apt repos"

echo "[--------------------]000%"
if [ -e "apt-repo" ]; then
    repocount=$(wc -l apt-repo)
    count=0
    for repo in $( cat apt-repo | grep ppa); do
	sudo apt-add-repository -y $repo 1> /dev/null 2> /dev/null
	if [ $? -ne 0 ]; then #check this
	    echo error $? adding repo $repo >> error.log
	fi
    done
else
    echo "error: apt-repo file DNE"  >> error.log
fi

touch repo-errors
sudo apt-get -y -q update  >> error.log
echo "Got apt repos"

