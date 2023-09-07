if [ ! -d "/run/mysqld" ]; then
    mkdir -p /run/mysqld
    chown -R mysql:mysql /run/mysqld
fi

if [ ! -d /var/lib/mysql/mysql ]; then
    mysql_install_db --user=mysql --skip-test-db --basedir=/usr --datadir=/var/lib/mysql

    mysqld --user=mysql --skip-networking & # バックグラウンドでmysqldを起動

    # mysqldが起動するまで待機（最大60秒）
    for i in $(seq 1 60); do
        if mysqladmin ping &>/dev/null; then
            break
        fi
        sleep 1
    done

    if [ "$i" -eq 60 ]; then
        echo "MySQL server took too long to start. Aborting."
        exit 1
    fi

    # ルートユーザのパスワードを設定
    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"

    # データベースとユーザーの作成
    mysql -e "CREATE DATABASE IF NOT EXISTS $WP_DB_NAME CHARACTER SET utf8 COLLATE utf8_general_ci;"
    mysql -e "CREATE USER '$WP_DB_USER'@'%' IDENTIFIED BY '$WP_DB_PASSWORD';"
    mysql -e "GRANT ALL PRIVILEGES ON $WP_DB_NAME.* TO '$WP_DB_USER'@'%';"
    mysql -e "FLUSH PRIVILEGES;"

    # mysqldを終了してフォアグラウンドで再起動
    mysqladmin shutdown
fi

exec mysqld --user=mysql --console