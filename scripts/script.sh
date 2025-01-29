#!/bin/bash

local_image=$(docker inspect --format='{{.RepoDigests}}' flaskappimg:latest 2>/dev/null | cut -d '@' -f 2 | tr -d '[]')
echo "$local_image" > /home/ubuntu/app/localimage.txt
#cut -d '@' -f 2 gets rid of the text before the sha
#tr -d gets rid of ] in the end of docker inspect's output.
##
