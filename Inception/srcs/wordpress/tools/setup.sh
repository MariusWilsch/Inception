#!/bin/bash

# chmod 755 /home/wait-for-it.sh

# /home/wait-for-it.sh mariadb:3306 --timeout=120

echo "Sleeping for 70 seconds to wait for mariadb to start"
sleep 70

mkdir /var/www/
mkdir /var/www/html

cd /var/www/html

rm -rf *

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

chmod +x wp-cli.phar 

mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

# mv /wp-config.php /var/www/html/wp-config.php

wp config set DB_NAME wordpress --allow-root
wp config set DB_USER user --allow-root
wp config set DB_PASSWORD 1234 --allow-root
wp config set DB_HOST mariadb --allow-root

# connect to mariadb
wp core install --url=mwilsch.42.fr/ --title=title --admin_user=admin_usr --admin_password=password --admin_email=admin@admin.com --skip-email --allow-root

# to connect php-fpm with nginx
sed -i 's/listen = \/run\/php\/php7.4-fpm.sock.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf

mkdir /run/php

php-fpm7.4 -F 
