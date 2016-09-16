#!/bin/bash
echo "Getting R packages"
touch get_r_packages.R
touch r_packages
echo "installed.packages()" > get_r_packages.R
Rscript get_r_packages.R  | awk '{print $1}' | tail -n +4 > r_packages
rm get_r_packages.R

echo "Got R packages"
