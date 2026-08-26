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
 avconv -y -i "$i" -filter:v scale=640:360 "$Folder$i"
done

IFS=$SAVEIFS
