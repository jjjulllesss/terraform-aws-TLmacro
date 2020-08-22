#!/bin/bash

url_live="ftp://ftp.ateme.com/BB/Titan/TitanLive/4.1.22.2/Binaries/"
live="titanlive-4_1_22_2-0-x64-linux.tar.gz"

sudo apt-get -y update
sudo apt -y install docker.io

sudo systemctl start docker
sudo systemctl enable docker

mkdir /licenseTitanLive
mkdir /titanlivedb

# Install ATEME live
wget $url_live$live
sudo docker load -i $live
sudo docker run --restart always --privileged --network host --name=titanlive -v /sys/fs/cgroup:/sys/fs/cgroup -v /licenseTitanLive:/var/opt/ateme/rms/bin -v /titanlivedb:/var/opt/ateme/mongodb -d --shm-size=2g -ti titanlive-4_1_22_2-0-x64-linux