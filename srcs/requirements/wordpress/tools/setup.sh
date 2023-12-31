#!/bin/bash

echo "Sleeping for 20 seconds to wait for mariadb to configure..."
sleep 10

# install wp-cli
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
# make it executable
chmod +x wp-cli.phar 
# move it into path
mv wp-cli.phar /usr/local/bin/wp

# ... 
cd /var/www/html/

# -f checks if file exists and is a regular file
if [ ! -f wp-config.php ]; then
	echo "wp-config.php not found, installing & configuring wordpress..."
# download wordpress
wp core download --allow-root

# create wp-config.php
wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=$HOST --allow-root

# connect to mariadb
wp core install --url=$DOMAIN/ --title=title --admin_user=$ADMIN_USERNAME --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --skip-email --allow-root

# create user
wp user create $USER_USERNAME $USER_EMAIL --role=$USER_ROLE --user_pass=$USER_PASSWORD --allow-root
else
	echo "OK"
fi

# to connect php-fpm with nginx
sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 9000|' /etc/php/7.4/fpm/pool.d/www.conf

mkdir /run/php

php-fpm7.4 -F 
