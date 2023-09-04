#!/bin/sh
#db conection
while ! mariadb -h $MYSQL_HOST -u $WP_DB_USER -p$WP_DB_PASSWORD $WP_DB_NAME --silent; do
	sleep 1 
done 

#wordpress
mkdir -p /var/www
mkdir -p /var/www/html
cd /var/www/html
wp core download --allow-root

wp config create \
	--dbname="wordpress" \
	--dbuser=$WP_DB_USER \
	--dbpass=$WP_DB_PASSWORD \
	--dbhost=$MYSQL_HOST 
wp core install \
	--url=$WP_ADMIN_EMAIL \
	--title=$WP_TITLE \
	--admin_user=$WP_USER \
	--admin_password=$WP_PASSWORD \
	--admin_email=$WP_EMAIL 
wp user create \
	$WP_TMP_USER \
	$WP_TMP_EMAIL \
	--user_pass=$WP_PASSWORD \

exec "$@"
