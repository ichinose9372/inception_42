#!/bin/sh

if [ ! -d "/run/mysqld" ]; then

	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
fi

if [ ! -d /var/lib/mysql/mysql ]; then
    mysql_install_db --user=mysql --skip-test-db --basedir=/usr --datadir=/var/lib/mysql

    mysqld -u mysql --bootstrap <<EOF
		flush privileges;
		create user '${WP_DB_USER}'@'%' identified by '${WP_DB_PASSWORD}';
		create database ${WP_DB_NAME};
		grant all on ${WP_DB_NAME}.* to '${WP_DB_USER}'@'%';
		delete from mysql.user where user='';
		delete from mysql.user where user='root';
		flush privileges;
EOF

fi


exec mysqld --user=mysql --console