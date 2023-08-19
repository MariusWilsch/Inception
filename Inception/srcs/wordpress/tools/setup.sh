#!/bin/bash

echo "Sleeping for 70 seconds to wait for mariadb to configure..."
sleep 70

# install wp-cli
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

# make it executable
chmod +x wp-cli.phar 

# move it into path
mv wp-cli.phar /usr/local/bin/wp

# ... 
cd /var/www/html/

# download wordpress
wp core download --allow-root

# create wp-config.php
wp config create --dbname=wordpress --dbuser=user --dbpass=1234 --dbhost=mariadb --allow-root

# connect to mariadb
wp core install --url=mwilsch.42.fr/ --title=title --admin_user=admin_usr --admin_password=password --admin_email=admin@admin.com --skip-email --allow-root

# create user
wp user create johndoe johndoe@example.com --role=author --user_pass=securepassword --allow-root

# to connect php-fpm with nginx
sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 9000|' /etc/php/7.4/fpm/pool.d/www.conf

mkdir /run/php

php-fpm7.4 -F 
