#!/bin/sh

for i in `ls *.MPG`
do
 avconv -i $i -f mp4 -movflags frag_keyframe+empty_moov -c:v libx264 -c:a copy `basename -s .MPG $i`.mp4
done
