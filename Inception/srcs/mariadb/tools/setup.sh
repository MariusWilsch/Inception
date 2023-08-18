#!/bin/bash

sed -i 's/bind-address\s*=\s*127\.0\.0\.1/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

mysqld_safe & sleep 5

chmod 755 /home/expect.exp

./home/expect.exp

mysql -u root -p12345 -e "CREATE DATABASE wordpress;"

mysql -e "CREATE USER IF NOT EXISTS 'user'@'%' IDENTIFIED BY '1234';"

mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'user'@'%';"

mysqladmin -u root -p12345 shutdown

exec mysqld_safe




