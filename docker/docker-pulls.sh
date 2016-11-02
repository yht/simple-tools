#!/bin/bash

# Make a list of exited container
list=`docker images | grep "latest" | awk '{print $1}'`

# Remove container based on list
for i in $list
do
 docker pull $i
done
