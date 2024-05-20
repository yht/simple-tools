#!/bin/sh

for i in $@
do
 if [ -f $i ]
 then
  echo Do: $i
  xz -9 $i
 else
  echo Skip: $i
 fi
done
