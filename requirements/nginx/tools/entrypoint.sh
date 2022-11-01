#!/bin/sh

mkdir -p /etc/ssl/certs /etc/ssl/private;

openssl req -x509 \
	-sha256 \
	-nodes \
	-days 365 \
	-subj "/C=RU/ST=Tatarstan/L=Kazan/O=School21/CN=localhost"
	-newkey rsa:2048 \
	-keyout /etc/ssl/private/nginx.key \
	-out /etc/ssl/certs/nginx.crt;

chown -R www-data:www-data /etc/ssl/;
chown -R www-data:www-data /etc/ssl;
chown -R www-data:www-data /var/lib/nginx;

exec nginx -g "daemon off;"
