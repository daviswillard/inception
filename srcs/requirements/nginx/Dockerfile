# syntax=docker/dockerfile:1

FROM	debian:buster

RUN		mkdir -p /var/www/wordpress/output \
			&& apt-get update && apt-get install -y \
			nginx openssl

COPY	./tools/entrypoint.sh /
COPY	./conf/default /etc/nginx/sites-enabled/

ENTRYPOINT	["sh", "entrypoint.sh"]

CMD		["nginx", "-g", "daemon off;"]
