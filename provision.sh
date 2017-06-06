#!/usr/bin/env bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

echo "deb http://ppa.launchpad.net/nginx/stable/ubuntu $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/nginx-stable.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C300EE8C

apt-get update
apt-get install -y \
    linux-image-extra-$(uname -r) \
    linux-image-extra-virtual \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    docker-ce \
    php7.0-common \
    php7.0-pgsql \
    php7.0-mysql \
    php7.0-fpm \
    nginx

curl -L https://github.com/docker/compose/releases/download/1.13.0/docker-compose-`uname -s`-`uname -m` > /usr/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
usermod -aG docker ubuntu

wget "http://www.adminer.org/latest.php" -O /var/www/html/index.php

echo "server {
	listen 8080;
	listen [::]:8080;
	root "/var/www/html";
	charset utf-8;
	index index.php index.html index.htm index.nginx-debian.html;
	server_name adminer;
	location / {
      try_files \$uri \$uri/ /index.php?\$query_string;
    	sendfile off;
  }
	location ~ \.php$ {
		try_files \$uri =404;
		fastcgi_split_path_info ^(.+\.php)(/.+)$;
  	fastcgi_pass unix:/var/run/php/php7.0-fpm.sock;
  	fastcgi_index index.php;
  	include fastcgi_params;
  	fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
	}
}" > /etc/nginx/sites-available/default
service nginx restart
