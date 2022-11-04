# syntax=docker/dockerfile:1

FROM	debian:buster

ARG		PHP_VERSION=7.3

RUN		apt-get update \
		&& apt-get install -y php$PHP_VERSION \
		php-cli php$PHP_VERSION-fpm php$PHP_VERSION-mysql \
		php$PHP_VERSION-json php$PHP_VERSION-opcache php$PHP_VERSION-mbstring \
		php$PHP_VERSION-xml php$PHP_VERSION-gd php$PHP_VERSION-curl

COPY	./conf/www.conf /etc/php/7.3/fpm/pool.d
COPY	./conf/wp-config.php ./var/www/wordpress/
COPY	tools/entrypoint.sh /

ENTRYPOINT [ "sh", "entrypoint.sh" ]

CMD		[ "./usr/sbin/php-fpm7.3", "-F" ]
