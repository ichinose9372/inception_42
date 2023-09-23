#!/bin/sh


# if [ ! -d /var/lib/mysql/mysql ]; then
#     mysql_install_db --user=mysql --skip-test-db --basedir=/usr --datadir=/var/lib/mysql

#     mysqld -u mysql --bootstrap <<EOF
# 		flush privileges;
# 		create user '${WP_DB_USER}'@'%' identified by '${WP_DB_PASSWORD}';
# 		create database ${WP_DB_NAME};
# 		grant all on ${WP_DB_NAME}.* to '${WP_DB_USER}'@'%';
# 		delete from mysql.user where user='';
# 		delete from mysql.user where user='root';
# 		flush privileges;
# EOF

# fi

# exec mysqld --user=mysql --console


echo "CREATE DATABASE IF NOT EXISTS ${WP_DB_NAME};" > db1,sql
echo "CREATE USER IF NOT EXISTS '${WP_DB_USER}'@'%' IDENTIFIED BY '${WP_DB_PASSWORD}';" >> db1,sql
echo "GRANT ALL PRIVILEGES ON ${WP_DB_NAME}.* TO '${WP_DB_USER}'@'%';" >> db1,sql	
echo "FLUSH PRIVILEGES;" >> db1,sql

mysql < db1.sql