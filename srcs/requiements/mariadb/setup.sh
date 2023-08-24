#!/bin/sh

if [ ! -d /var/lib/mysql/mysql ]; then
mysql_install_db --user=mysql --skip-test-db --datadir=/var/lib/mysql -basedir=/usr
mysqld --user=mysql --bootstrap << EOF
FLUSH PRIVILEGES ;
CREATE USER '$WP_DB_USER'@'%' IDENTIFIED BY '$WP_DB_PASSWORD';
CREATE DATABASE $WP_DB_NAME ;
GRANT ALL ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root'
FLUSH PRIVILEGES ;
EOF
fi

exec mysqld --user=mysql --console
