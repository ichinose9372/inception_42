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

# chown -R mysql:mysql /var/lib/mysql
# chown -R mysql /var/lib/mysql	
# mysql_install_db --user=mysql --skip-test-db --datadir=/var/lib/mysql -basedir=/usr
# mysqld --user=mysql --bootstrap << EOF
# USE mysql ;
# FLUSH PRIVILEGES ;
# DROP DATABASE IF EXISTS test ;
# GRANT ALL ON *.* TO 'root'@'%' identified by '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION ;
# GRANT ALL ON *.* TO 'root'@'localhost' identified by '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION ;
# SET PASSWORD FOR 'root'@'localhost'=PASSWORD('${MYSQL_ROOT_PASSWORD}') ;
# SET PASSWORD FOR 'root'@'%'=PASSWORD('${MYSQL_ROOT_PASSWORD}') ;
# FLUSH PRIVILEGES ;
# CREATE DATABASE IF NOT EXISTS $WP_DB_NAME CHARACTER SET utf8 COLLATE utf8_general_ci ;
# CREATE USER '$WP_DB_USER'@'localhost' IDENTIFIED BY '$WP_DB_PASSWORD';
# CREATE USER '$WP_DB_USER'@'%' IDENTIFIED BY '$WP_DB_PASSWORD';
# GRANT ALL PRIVILEGES ON *.* TO '$WP_DB_USER'@'localhost';
# GRANT ALL PRIVILEGES ON *.* TO '$WP_DB_USER'@'%';
# FLUSH PRIVILEGES ;
# EOF
# fi

exec mysqld --user=mysql --console
