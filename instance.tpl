#!/bin/bash


set -e

sudo apt-get update -y  
sudo apt-get install -y git curl wget 

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh

sudo usermod -aG docker $USER


#sudo mkdir -p /home/ubuntu/app  
#cd /home/ubuntu/app


##if ! wget -q https://raw.githubusercontent.com/thatabdullah/improved-docker-push-ci/main/app.py; then
  ##  echo "Failed to download app.py"
    ##exit 1
##fi

##if ! wget -q https://raw.githubusercontent.com/thatabdullah/improved-docker-push-ci/main/requirements.txt; then
  ##  echo "Failed to download requirements.txt"
    ##exit 1
##fi

#if ! docker pull ithatabdullah/flaskappimg; then
 #   echo "Failed to pull Docker image"
  #  exit 1
#fi

echo "ec2 setup done"
