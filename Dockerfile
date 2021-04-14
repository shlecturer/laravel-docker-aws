FROM 060894855401.dkr.ecr.us-east-1.amazonaws.com/sandyman/php:7.3.2-apache-stretch

LABEL maintainer="Sander Huijsen <sander.huijsen@gmail.com>"
LABEL version="1.0"

COPY --chown=www-data:www-data . /srv/app

COPY .docker/vhost.conf /etc/apache2/sites-available/000-default.conf

WORKDIR /src/app

RUN docker-php-ext-install mbstring pdo pdo_mysql && \
	a2enmod rewrite negotiation && \
	docker-php-ext-install opcache
