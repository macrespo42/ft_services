#!/bin/sh

if [ ! -d /run/mysqld/ ]; then
    echo "[i] init /run/mysqld.sock"
    mkdir -p /run/mysqld/
    chown -R mysql /run/mysqld/
fi

if [ ! -d /var/lib/mysql/mysql ]; then
    echo "[i] init mysql db"
    /usr/bin/mysql_install_db --user=mysql
    chown -R mysql /var/lib/mysql
    exec /usr/bin/mysqld --user=mysql &
    echo "[i] wait 5 sec"
    sleep 5
    echo "[i] CREATE DATABASE WORDPRESS"

    echo "CREATE DATABASE wordpress;" | mysql -u root
    echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'localhost' IDENTIFIED BY 'wordpress password';" | mysql -u root
    echo "FLUSH PRIVILEGES;" | mysql -u root
    echo "EXIT" | mysql -u root

    pkill mysql
fi

exec /usr/bin/mysqld --user=mysql --console