#!/bin/bash

sudo apt-get -y update
sudo apt -y install docker.io

sudo systemctl start docker
sudo systemctl enable docker

docker login hub.ateme.net -u ${harbor_username} -p ${harbor_password}

live="titanlive:${TL_majorVersion}.${TL_minorVersion}.${TL_GAVersion}.${TL_fixVersion}-0"
 
sudo docker pull hub.ateme.net/titanlive-md/$live
sudo docker run --restart always --privileged --network host --name=titanlive -v /sys/fs/cgroup:/sys/fs/cgroup -d --shm-size=2g -ti hub.ateme.net/titanlive-md/$live