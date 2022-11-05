#!/bin/bash

# create socket
#mkdir -p /var/run/mysqld
#mkfifo /var/run/mysqld/mysqld.sock
#chown -R mysql /var/run/mysqld
if [ ! -d /var/lib/mysql/$DB_NAME ]
then

service mysql start

mysql --user=root <<EOF
DELETE FROM mysql.user WHERE User='';
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
FLUSH PRIVILEGES;
EOF

mysql --user=root --password=$DB_ROOT_PASSWORD <<EOF
CREATE DATABASE IF NOT EXISTS $DB_NAME;
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

service mysql stop
fi

exec "$@"
