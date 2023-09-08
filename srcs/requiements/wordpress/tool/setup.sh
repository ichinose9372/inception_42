#!/bin/sh
while ! mariadb -h $MYSQL_HOST -u $WP_DB_USER -p$WP_DB_PASSWORD $WP_DB_NAME --silent 2>/dev/null; do
	sleep 1 
done 

#wordpress
wp core download --allow-root

wp config create \
	--dbname="wordpress" \
	--dbuser=$WP_DB_USER \
	--dbpass=$WP_DB_PASSWORD \
	--dbhost=$MYSQL_HOST \
	--allow-root 
wp core install \
	--admin_user=$WP_USER \
	--admin_password=$WP_PASSWORD \
	--admin_email=$WP_EMAIL \
	--url=$WP_ADMIN_EMAIL \
	--allow-root 
wp user create \
	$WP_TMP_USER \
	$WP_TMP_EMAIL \
	--user_pass=$WP_PASSWORD \

exec "$@"
