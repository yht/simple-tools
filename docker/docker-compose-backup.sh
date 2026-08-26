#!/bin/bash
CWD="$(pwd)"

if [ -d "$1" ]
then
 # shutdown it first
 cd "$1"
 docker compose down
 cd "$CWD"

 # then backup
 sudo tar cf "$(basename "$1").tar" "$1"

 # make it up again
 cd "$1"
 docker compose up -d
 cd "$CWD"

 # compress
 sudo xz -9 "$(basename "$1").tar"
fi