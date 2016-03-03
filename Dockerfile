FROM centos:7
MAINTAINER Akel <akel@akelmaister.com>

## install base-packages
RUN yum -y install epel-release
RUN yum -y install nginx php-fpm php-devel gcc libtool php-mysql wget git nano mariadb-server mariadb

## Get latest Phalcon sources
RUN cd /usr/local/src/ && git clone --depth=1 git://github.com/phalcon/cphalcon.git

## Build Phalcon2 module
RUN cd /usr/local/src/cphalcon/build && /bin/sh install

## Add Phalcon module to php (need to connect after mysql extension)
RUN echo "extension=phalcon.so" >> /etc/php.d/pdo_mysql.ini

EXPOSE 22 80
