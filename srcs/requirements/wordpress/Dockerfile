# syntax=docker/dockerfile:1

FROM	debian:buster

ARG		PHP_VERSION=7.3

RUN		apt-get update \
			&& apt-get install -y \
			php$PHP_VERSION \
			php$PHP_VERSION-fpm \
			php$PHP_VERSION-mysqli \
			php$PHP_VERSION-redis \
			mariadb-client \
			curl

RUN		curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
			&& chmod +x wp-cli.phar \
			&& mv wp-cli.phar /usr/local/bin/wp

COPY	./conf/www.conf /etc/php/$PHP_VERSION/fpm/pool.d
COPY	tools/entrypoint.sh /

ENTRYPOINT [ "sh", "entrypoint.sh" ]

CMD		[ "/usr/sbin/php-fpm7.3", "-F" ]
