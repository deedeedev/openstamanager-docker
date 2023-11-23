FROM php:8.0-apache

MAINTAINER "Davide Sintini" <davide.sintini@gmail.com>

WORKDIR /var/www/html

RUN apt update && apt upgrade -y
RUN apt install -y unzip wget
RUN wget --quiet -O temp.zip https://github.com/devcode-it/openstamanager/releases/download/v2.4.51/openstamanager-2.4.51.zip
RUN unzip temp.zip
RUN rm temp.zip
RUN mkdir files/temp
RUN chmod 777 -R ./

RUN curl -sSLf -o /usr/local/bin/install-php-extensions https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions
RUN chmod +x /usr/local/bin/install-php-extensions
RUN install-php-extensions gd intl ldap mysqli pdo_mysql soap xmlrpc xsl zip

COPY php.ini /usr/local/etc/php/

RUN a2enmod rewrite
RUN service apache2 restart

EXPOSE 80
