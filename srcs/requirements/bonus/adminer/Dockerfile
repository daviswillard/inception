FROM	debian:buster

RUN		apt-get update && apt-get install -y \
			wget \
			adminer

RUN		sed -i "s/Listen 80/Listen 8080/" /etc/apache2/ports.conf \
		&& sed -i "s/VirtualHost *:80/VirtualHost *:8080/" /etc/apache2/sites-enabled/000-default.conf \
		&& echo "ServerName localhost" >> /etc/apache2/apache2.conf

COPY	tools/entrypoint.sh /

EXPOSE	8080

ENTRYPOINT ["sh", "entrypoint.sh"]

CMD		["apachectl", "-D", "FOREGROUND"]
