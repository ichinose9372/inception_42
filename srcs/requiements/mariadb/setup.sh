#!/bin/sh

if [ ! -d "/run/mysql" ]; then
	mkdir -p /run/mysqld
fi
chown -R mysql:mysql /run/mysqld

if [ ! -d /var/lib/mysql/mysql ]; then
	mysql_install_db --user=mysql --skip-test-db --datadir=/var/lib/mysql -basedir=/usr

mysql -u mysql --bootstrap << EOF
	flush privileges;
		create user '${MYSQL_USER}'@'%' identified by '${MYSQL_PASSWORD}';
		create database ${MYSQL_DATABASE};
		grant all on ${MYSQL_DATABASE}.* to '${MYSQL_USER}'@'%';
		delete from mysql.user where user='';
		delete from mysql.user where user='root';
		flush privileges;
EOF

fi

exec /usr/bin/mysqld --user=mysql --console
