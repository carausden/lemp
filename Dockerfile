FROM ubuntu:20.04

MAINTAINER dcaraus "d.caraus@office.simpals.com"
ENV TZ=Europe/Chisinau
ENV DEBIAN_FRONTEND noninteractive

#nginx and php7.4
RUN apt-get update && apt-get install -y \
	lsb \
	apt-utils \
	supervisor \
	apt-transport-https \
	ca-certificates \
	software-properties-common \
	nginx-full \
	mysql-server \ 
	mysql-client \
	php \
	php-fpm \
	php-xml \
	php-mbstring \
	php-gd \
	php-gmp \
	php-mysql \
	php-curl \
	php-cli \
	php-common \
	php-json \
	php-opcache \
	php-readline \
	php-imagick \
	php-xmlrpc \
	php-cgi \
	php-dev \
	--no-install-recommends apt-utils && \
	rm -r /var/lib/apt/lists/* && \
	mkdir /run/php /data /var/run/mysqld && \
	chown -R www-data:www-data /data && \
	chown -R mysql:mysql /var/run/mysqld

#nginx conf 
COPY ./default /etc/nginx/sites-enabled/default
#php-fpm cofig
COPY ./www.conf /etc/php/7.4/fpm/pool.d/www.conf
#web pages index.php
COPY ./index.php /data/index.php
#supervisor service conf 
COPY ./service.conf /etc/supervisor/conf.d/service.conf

WORKDIR /data
VOLUME /data

#nginx
EXPOSE 80
#php-fpm
EXPOSE 9000
#mysql
EXPOSE 3306

#ENTRYPOINT ["/usr/bin/supervisord"]
CMD ["/usr/bin/supervisord", "-n"]
