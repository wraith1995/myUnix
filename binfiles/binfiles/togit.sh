#!/bin/bash
#transfers key unix files to a repo; commits
# $1 is git
path=`realpath $1`
cd

sudo cp -R ~/bin $1/bin
sudo cp -R ~/binfiles $1/binfiles
sudo cp .bash_profile $1/.bash_profiles
sudo cp .bashrc $1/.bashrc
sudo cp .profile $1/.profile
sudo cp .emacs $1/.emacs
sudo cp -R .emacs.d $1/.emacs.d

cd $1
rm -rf ~/bin/Telegram
rm -rf ~/bin/tor-browser_en-US/
git add -A
temp=`date`
git commit -m "script save ""$temp"
