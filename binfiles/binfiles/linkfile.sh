#! /bin/bash
#finds https links in $1 and opens them in $BROWSER
BROWSER="chromium-browser"

grep "^https" $1 | while read -r line ; do
    $BROWSER  $line
done


