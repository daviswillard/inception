# syntax=docker/dockerfile:1

FROM	debian:buster

RUN		apt-get update \
		&& apt-get install -y mariadb-server

#COPY	./conf/my.cnf /etc/mysql/mariadb.conf.d/
COPY	./conf/my.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY	./tools/entrypoint.sh /

ENTRYPOINT	["sh", "entrypoint.sh"]

CMD		["mysqld_safe"]
