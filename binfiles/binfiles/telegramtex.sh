#!/bin/bash
#sends image of tex via tg
#first argument is tex, 2nd arg is user, 3rd is list of includes
touch tsend.tex


echo "
\documentclass[preview]{standalone}
$3
\begin{document}
$1
\end{document}
" > tsend.tex

pdflatex tsend.tex

convert -density 300 tsend.pdf tsend.png

FILE=` realpath tsend.png`
cd tg
echo $FILE
sleep 5
(echo "contact_list"; sleep 10;echo "send_photo $2 $FILE") | bin/telegram-cli
cd
rm tsend*
