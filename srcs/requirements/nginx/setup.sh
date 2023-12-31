#!/bin/bash

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=MA/L=KH/O=1337/OU=student/CN=mwilsch.42.fr"

echo "
server {
	listen 443 ssl; #ipv4
	listen [::]:443 ssl; #ipv6

	server_name localhost mwilsch.42.fr;

	ssl_certificate /etc/ssl/certs/nginx-selfsigned.crt;
	ssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;
	ssl_protocols TLSv1.3;

	index index.php;
	root /var/www/html;

	location ~ \.php$ { 
		try_files \$uri =404;
		fastcgi_pass wordpress:9000;
		include fastcgi_params;
		fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
	}
}
" > /etc/nginx/sites-available/default

nginx -g "daemon off;"

