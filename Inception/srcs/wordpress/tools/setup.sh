#!/bin/bash

echo "Sleeping for 70 seconds to wait for mariadb to configure..."
sleep 70

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

chmod +x wp-cli.phar 

mv wp-cli.phar /usr/local/bin/wp

cd /var/www/html/

wp core download --allow-root

wp config create --dbname=wordpress --dbuser=user --dbpass=1234 --dbhost=mariadb --allow-root

# connect to mariadb
wp core install --url=mwilsch.42.fr/ --title=title --admin_user=admin_usr --admin_password=password --admin_email=admin@admin.com --skip-email --allow-root

# to connect php-fpm with nginx
sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 9000|' /etc/php/7.4/fpm/pool.d/www.conf

mkdir /run/php

php-fpm7.4 -F 
