#!/bin/bash

if ! wp core version --allow-root --path=/var/www/wordpress &>/dev/null 2>&1
then
	wp core download --allow-root \
		--path=/var/www/wordpress \
#		--version=latest \
fi

if [ ! -f /var/www/wordpress/wp-config.php ]
then
	wp config create --allow-root \
		--path=/var/www/wordpress \
		--dbname=$DB_NAME \
		--dbuser=$DB_USER \
		--dbpass=$DB_PASSWORD \
		--dbhost=$DB_HOST
fi

if ! wp core is-installed --allow-root --path=/var/www/wordpress
then
	wp core install \
		--allow-root \
		--path=/var/www/wordpress \
		--url=$DOMAIN_NAME \
		--title=$WP_TITLE \
		--admin_user=$WP_ADMIN_USER \
		--admin_password=$WP_ADMIN_PASSWORD \
		--admin_email=$WP_ADMIN_EMAIL \
		--skip-email
fi

#if [ ! -f /var/www/wordpress/wp-config.php ]
#then
#    echo "Config not found..."
#    exit 1
#fi

mkdir -p ./run/php/

exec "$@"
