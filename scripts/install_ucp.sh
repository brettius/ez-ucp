#!/bin/bash

sudo sh -c "echo 'nameserver 8.8.8.8
nameserver 8.8.4.4' >> /etc/resolvconf/resolv.conf.d/base"
sudo resolvconf -u

UCP_IP=172.28.128.31
UCP_FQDN=ucp.local

sudo docker container run --rm --name ucp -v /var/run/docker.sock:/var/run/docker.sock docker/ucp:3.2.6 install \
  --admin-username admin --admin-password adminadmin \
  --host-address ${UCP_IP} --san ${UCP_IP} --san ${UCP_FQDN} \
  --force-minimums
