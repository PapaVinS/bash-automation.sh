#!/bin/bash

#set time zone
sudo timedatectl set-timezone Asia/Jakarta

#Update & upgrade
sudo apt update && sudo apt upgrade -y && sudo apt full-upgrade -y && sudo apt autoremove -y

#install Git, Curl, ZIP, Python & Python-pip

#Git
sudo apt install git

#Curl
sudo apt install curl

#ZIP
sudo apt-get install zip

#Python, Python-pip
# Open your terminal and enter the following command:
# wget https://gist.github.com/vbe0201/b85ec47bc198d1c8471acbf016922005/raw/get-python.sh && chmod +x get-python.sh && ./get-python.sh

apt update -y
apt upgrade

apt install build-essential checkinstall libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev -y

mkdir python_installation && cd python_installation

wget https://www.python.org/ftp/python/3.7.2/Python-3.7.2.tgz
tar xzvf Python-3.7.2.tgz
rm -f Python-3.7.2.tgz

cd Python-3.7.2
./configure --enable-optimizations
make -j 4
make altinstall

cd ../..
rm -rf python_installation

apt --purge remove build-essential checkinstall libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev -y
apt autoremove -y
apt clean

python3.7 -m pip install -U pip
echo '$alias pip3="python3.7 -m pip"' >> ~/.bashrc

#Install Docker

sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install -y docker-ce
sudo docker run hello-world
# Linux post-install
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable docker
