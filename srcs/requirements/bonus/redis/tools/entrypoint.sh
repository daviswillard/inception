#!/bin/bash

#if [ ! -f /var/www/wordpress/wp-content/object-cacher.php ] ; then
#	wget https://assets.digitalocean.com/articles/wordpress_redis/object-cache.php
#	mv object-cache.php /var/www/wordpress/wp-content/
#fi

exec redis-server \
		--daemonize no \
		--protected-mode no \
		--maxmemory 2mb \
		--maxmemory-policy allkeys-lru
