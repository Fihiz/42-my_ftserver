#!/bin/sh

echo "Here we finish to set our server !"

#NGINX SETUP
mkdir -p /var/www/localhost
chown -R $USER:$USER /var/www/localhost
cp localhost-conf /etc/nginx/sites-available/localhost
ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/

#TEST
cp info.php /var/www/localhost/info.php
cp test.html /var/www/localhost/test.html

#STARTING
/etc/init.d/php7.3-fpm start
service nginx restart