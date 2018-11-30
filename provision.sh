#!/usr/bin/env bash

sudo locale-gen "en_US.UTF-8"
sudo dpkg-reconfigure locales

sudo sysctl -w vm.max_map_count=262144

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

echo "deb http://ppa.launchpad.net/nginx/stable/ubuntu $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/nginx-stable.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C300EE8C

apt-get install software-properties-common python-software-properties
sudo add-apt-repository -y ppa:ondrej/php

apt-get update
apt-get install -y \
    linux-image-extra-$(uname -r) \
    linux-image-extra-virtual \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    docker-ce \
    php7.2-common \
    git \
    php-codesniffer \
    vim


sudo curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
usermod -aG docker vagrant
