#!/bin/bash

# Make a list of exited container
list=`docker ps --filter=status=exited -q`

# Remove container based on list
for i in $list
do
 docker rm $i
done
