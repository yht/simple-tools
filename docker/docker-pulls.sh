#!/bin/bash

# Make a list of all images:tags
list=`docker image list --format "table {{.Repository}}\t{{.Tag}}" | awk '{print $1 ":" $2}' | tail -n +2`

# Remove container based on list
for i in $list
do
 echo "[Pull: $i]"
 docker pull $i
done
