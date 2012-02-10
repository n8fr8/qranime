#!/bin/bash

i=1
filename=$1

while read line; do
    /usr/bin/qrencode -s 5 -o $filename$i.png "#$i: $line"
    i=`expr $i + 1`	
done < "$filename"

convert -delay 20 $filename*.png -resize 240x240 -colors 2 $filename.gif
rm $filename*.png

