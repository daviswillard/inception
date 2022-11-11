#FROM	debian:buster
#
#RUN		apt-get update && apt-get install -y \
#			vsftpd
#
##COPY	conf/vsftpd.conf /etc/vsftpd/
#COPY	tools/entrypoint.sh /
#
#ENTRYPOINT	["sh", "entrypoint.sh"]
#
#EXPOSE	21
#
#CMD	["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]
FROM	debian:buster

RUN	apt update &&		\
	apt install -y vsftpd

COPY	tools/entrypoint.sh /

ENTRYPOINT ["sh", "entrypoint.sh"]

CMD	["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]
