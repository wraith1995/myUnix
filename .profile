# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022
#load files
#source ~/.bash_tests #run tests
# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi



PATH=$PATH:~/bin
PATH=$PATH:~/.cabal/bin #because cabal feels special when it comes to arbtt
PATH=$PATH:~/Downloads/google_appengine
PATH=$PATH:~/.local/bin #because stack also feel special
DUMMYPROFILE="THIS IS A DUMMY"
