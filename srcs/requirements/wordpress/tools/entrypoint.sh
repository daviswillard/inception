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

wp config set --allow-root --path=/var/www/wordpress --anchor="/**#@+" --separator="\n\n" WP_REDIS_HOST redis
wp config set --allow-root --path=/var/www/wordpress --anchor="/**#@+" --separator="\n\n" --raw WP_REDIS_PORT 6379
wp config set --allow-root --path=/var/www/wordpress --anchor="/**#@+" --separator="\n\n" --raw WP_REDIS_TIMEOUT 1
wp config set --allow-root --path=/var/www/wordpress --anchor="/**#@+" --separator="\n\n" --raw WP_REDIS_READ_TIMEOUT 1
wp config set --allow-root --path=/var/www/wordpress --anchor="/**#@+" --separator="\n\n" --raw WP_REDIS_DATABASE 0
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

if ! wp plugin is-installed --allow-root --path=/var/www/wordpress redis-cache
then
	wp plugin install redis-cache \
		--allow-root \
		--path=/var/www/wordpress \
		--activate
fi

wp redis enable \
	--allow-root \
	--path=/var/www/wordpress

mkdir -p ./run/php/

if [ ! -d /var/www/wordpress/bonus ]; then

mv /site /var/www/wordpress/bonus
fi

exec "$@"
