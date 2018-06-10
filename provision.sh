#!/bin/bash

sudo su -

yum install -y yum-utils \
	device-mapper-persistent-data \
	lvm2

# install docker-ce
yum-config-manager \
	--add-repo \
	https://download.docker.com/linux/centos/docker-ce.repo

yum install -y --setopt=obsoletes=0 \
  docker-ce-17.03.2.ce-1.el7.centos \
  docker-ce-selinux-17.03.2.ce-1.el7.centos

# rke requires ssh version >= 7
yum update -y openssh

# enable docker service
systemctl start docker
systemctl enable docker

# allow vagrant docker privileges
usermod -aG docker vagrant

# copy ssh key
mkdir -p /root/.ssh
cp /vagrant/id_rsa.pub /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys
