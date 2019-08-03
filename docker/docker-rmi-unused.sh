#!/bin/bash

# Make a list of exited container
list=`docker images | grep "<none>" | awk '{print $3}'`

# Remove container based on list
for i in $list
do
 docker rmi $i
done
