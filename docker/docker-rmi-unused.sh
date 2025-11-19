#!/bin/bash

# Make a list of exited container
list=$(docker image list --format "table {{.ID}}\t{{.Tag}}" | grep "<none>" | awk '{print $1}')

# Remove container based on list
for i in $list
do
 echo "[Remove: $i]"
 docker rmi $i
done
