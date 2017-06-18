#!/bin/bash
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

# Berkas ini untuk menyimpan pengaturan output video
# agar bisa diputar di headrest monitor.

# Folder dimana hasil keluaran di simpan
Folder="$1"

for i in $(ls)
do
 echo "$i"
 avconv -y -i "$i" -f dvd -target pal-dvd -b:v 5000k -r 25 \
    -filter:v scale=640:480 -ar 48000 -b:a 44k -b:a 44k \
    "$Folder$(echo `basename -s .mp4 $i`).mpg"
done

IFS=$SAVEIFS
