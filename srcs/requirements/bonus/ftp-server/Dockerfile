FROM	debian:buster

RUN		apt-get update && apt-get install -y \
			vsftpd

COPY	tools/entrypoint.sh /

ENTRYPOINT ["sh", "entrypoint.sh"]

CMD	["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]
