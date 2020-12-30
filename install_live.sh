#!/bin/bash

url_live="ftp://ftp.ateme.com/BB/Titan/TitanLive/${TL_majorVersion}.${TL_minorVersion}.${TL_GAVersion}.${TL_fixVersion}/Binaries/"
live="titanlive-${TL_majorVersion}_${TL_minorVersion}_${TL_GAVersion}_${TL_fixVersion}-0-x64-linux.tar.gz"

sudo apt-get -y update
sudo apt -y install docker.io

sudo systemctl start docker
sudo systemctl enable docker

wget $url_live$live
sudo docker load -i $live
sudo docker run --restart always --privileged --network host --name=titanlive -v /sys/fs/cgroup:/sys/fs/cgroup -d --shm-size=2g -ti titanlive-${TL_majorVersion}_${TL_minorVersion}_${TL_GAVersion}_${TL_fixVersion}-0-x64-linux