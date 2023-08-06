#!/bin/sh

. ./.env

#db conection
while ! mariadb -h $MYSQL_HOST -u $WP_DB_USER -p$MYSQL_ROOT_PASSWORD $WP_DB_NAME -e "SELECT 1;" > /dev/null 2>&1; do
    echo "Waiting for database connection..."
    sleep 1
done

#wordpress
tar -xzvf /tmp/wordpress-6.2.tar.gz -C /var/www/html/ >/dev/null && chmod -R 755 /var/www/html/wordpress
cd /var/www/html/wordpress
wp config create \
    --dbname=$WP_DB_NAME \
    --dbuser=$WP_DB_USER \
    --dbpass=$WP_DB_PASSWORD \
	--dbhost=$MYSQL_HOST \
    --dbcharset="utf8" \
    --dbcollate="utf8_general_ci" \
    --allow-root
wp core install \
    --url=$DOMAIN_NAME \
    --title=$WP_TITLE \
    --admin_user=$WP_ADMIN_USER \   
	--admin_password=$WP_ADMIN_PASSWORD \
    --admin_email=$WP_ADMIN_EMAIL \
    --skip-email\
    --allow-roo t
wp user create \
    $WP_USER $WP_EMAIL \
    --role=author \
    --user_pass=$WP_PASSWORD \
    --allow-root
wp plugin update --all --allow-root
  mv /tmp/index.html /var/www/html/wordpress
	touch /var/www/html/$WP_FILE_ONINSTALL
mkdir -p /var/run/php-fpm7
exec "$@"