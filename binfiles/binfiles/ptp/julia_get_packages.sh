#!/bin/bash
echo "Getting Julia Packages"
julia -E "Pkg.installed()" > tempjulia

IFS=","
for i in $(cat tempjulia);do
    echo "${i//\"}" | tr -d [ | tr -d ] | cut -d "=" -f 1 >> juliapackages
done
rm tempjulia
echo "Got Julia Packages"

