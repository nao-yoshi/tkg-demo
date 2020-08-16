#!/bin/bash

# echo "==================================================="
# echo "update"
# sudo yum update -y

echo "==================================================="
echo "set timezone as JST"
sudo timedatectl set-timezone Asia/Tokyo

echo "==================================================="
echo "disable firewall as for PoC"
sudo systemctl stop firewalld
sudo systemctl disable firewalld

echo "==================================================="
echo "install vim, git"
sudo yum install -y vim git

echo "==================================================="
echo "install Docker"
sudo yum remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-engine
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io
sudo systemctl start docker
sudo systemctl enable docker

echo "==================================================="
echo "install Docker Compose"
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
sudo docker-compose --version

echo "==================================================="
echo "install kubectl"
sudo curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
sudo chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
sudo kubectl version --client
echo "alias k='kubectl'" >> .bashrc
source .bashrc

echo "==================================================="
echo "generate ssh pub key"
ssh-keygen -t rsa -b 4096
ssh-add ~/.ssh/id_rsa

