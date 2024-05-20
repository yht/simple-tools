#!/bin/bash

# Make a list of exited container
list=`docker images | grep "<none>" | awk '{print $3}' | grep -n +2`

# Remove container based on list
for i in $list
do
 echo "[Remove: $i]"
 docker rmi $i
done
