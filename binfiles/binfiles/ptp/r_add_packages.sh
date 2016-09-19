#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "error: This script must b1e run as root" 
   exit 1
fi

if [ ! -f `pwd`/r_packages ]; then
    echo "error: r_packages file DNE"
fi

touch install.R
#function from http://stackoverflow.com/questions/9341635/check-for-installed-packages-before-running-install-packages because I'm lazy
echo "pkgTest <- function(x)
  {
    if (!require(x,character.only = TRUE))
    {
      install.packages(x,dep=TRUE, repos=\"http://cran.fhcrc.org\")
    }
  }" > install.R

for pckg in $( cat r_packages ); do
    #sudo R
    #install.packages()
    echo "pkgTest(\"$pckg\")" >> install.R
done


sudo Rscript install.R > routput
rm install.R
