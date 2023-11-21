#!/bin/sh

#wordpress
wp core download --allow-root

wp config create \
	--dbname="wordpress" \
	--dbuser=$WP_DB_USER \
	--dbpass=$WP_DB_PASSWORD \
	--dbhost=$MYSQL_HOST  \
	--allow-root
wp core install \
	--title="yichinos is" \
	--admin_user=$WP_USER \
	--admin_password=$WP_PASSWORD \
	--admin_email=$WP_ADMIN_EMAIL \
	--url=$DOMAIN_NAME

wp user create $WP_USER2 $WP_EMAIL --role=author --user_pass=$WP_PASSWORD2 --allow-root

sed -i "/That's all, stop editing!/a define('RELOCATE', true);" wp-config.php

exec "$@"
