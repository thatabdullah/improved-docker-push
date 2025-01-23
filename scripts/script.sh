#!/bin/bash

local_image=$(docker inspect --format='{{index .RepoDigests 0}}' ithatabdullah/flaskappimg:latest | cut -d '@' -f 2 || echo "failed local inspect")
echo "$local_image" > /home/ubuntu/app/localimage.txt
#cut -d '@' -f 2 gets rid of the text before the sha
