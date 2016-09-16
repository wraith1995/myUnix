#!/bin/bash
#transfers key unix files to a repo; commits
# $1 is git
path=$1

cp -R ~/bin $1/bin
cp -R ~/binfiles $1/binfiles
cp .bash_profile $1/.bash_profiles
cp .bashrc $1/.bashrc
cp .profile $1/.profile
cp .emacs $1/.emacs
cp -R .emacs.d $1/.emacs.d

cd $1
git add -A
temp=`date`
git commit -m "script save "$temp
