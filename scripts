#!/bin/bash

sudo sh -c "echo 'nameserver 8.8.8.8
nameserver 8.8.4.4' >> /etc/resolvconf/resolv.conf.d/base"
sudo resolvconf -u

DOCKER_EE_URL=$(cat /vagrant/env/ee_url)

DOCKER_EE_VERSION=19.03

curl -fsSL "${DOCKER_EE_URL}/ubuntu/gpg" | sudo apt-key add -

sudo apt-key fingerprint 6D085F96

sudo add-apt-repository \
  "deb [arch=$(dpkg --print-architecture)] $DOCKER_EE_URL/ubuntu \
  $(lsb_release -cs) \
  stable-$DOCKER_EE_VERSION"

sudo apt-get update -y

sudo apt-get install docker-ee docker-ee-cli containerd.io -y

sudo docker run hello-world
