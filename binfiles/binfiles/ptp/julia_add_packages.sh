#!/bin/bash

if [ -e "juliapackages" ]; then
    for pkg in $(cat juliapackages); do
	julia -E "Pkg.add(\"$pkg\")" | > /dev/null
    done
else
    echo "Julia packages file missing"
fi
exit 0
