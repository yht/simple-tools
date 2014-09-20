#!/bin/sh
for i in `ls`
do
 if [ -d $i ]
  then
   echo $i...
   tar -cf $i.tar $i/
   xz -9 $i.tar
   rm -rf $i
 fi
done
