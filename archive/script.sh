#!/bin/sh
service mariadb start

sleep 10
mariadb -e "CREATE DATABASE IF NOT EXISTS wordpress;"
mariadb -e "CREATE USER IF NOT EXISTS 'user'@'%' IDENTIFIED BY '1234';"
mariadb -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'user'@'%' IDENTIFIED BY '1234';"
mariadb -e "FLUSH PRIVILEGES;"
mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345';"

sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld 



------------------

#!/bin/bash

sed -i 's/bind-address\s*=\s*127\.0\.0\.1/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

mysqld_safe & sleep 5

# chmod 755 /home/expect.exp

# why is this not changing the root password
# ./home/expect.exp



# mysql -u root -p12345 -e "CREATE DATABASE wordpress;"
mysql -e "CREATE DATABASE wordpress;"
# mysql -e "CREATE DATABASE $DB_NAME;"

mysql -e "CREATE USER IF NOT EXISTS 'user'@'%' IDENTIFIED BY '1234';"
# mysql -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"	q

mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'user'@'%';"
# mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';"

mysql  -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345';"

mysqladmin -p12345 shutdown

exec mysqld_safe