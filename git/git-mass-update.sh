#!/bin/sh
for i in *
 do
 if [ -d "$i/.git" ]
 then
  echo "Sinkronisasi $i"
  cd "$i"
  git pull
  cd ..
 fi done
