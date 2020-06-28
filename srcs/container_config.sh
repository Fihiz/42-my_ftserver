#!/bin/bash

echo "Here we finish to set our server !"

#NGINX SETUP
cd ..
mkdir -p /var/www/localhost
#chown -R $USER:$USER /var/www/localhost
cp /root/localhost-conf /etc/nginx/sites-available/localhost
ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/

#SSL SETUP FOR SECURITY
cd /root/ssl/
chmod +x mkcert
./mkcert -install
./mkcert localhost
cd ../../

#TEST
cp /root/info.php /var/www/localhost/info.php
cp /root/test.html /var/www/localhost/test.html

#STARTING
/etc/init.d/php7.3-fpm start
service nginx configtest
service nginx restart

#TO KEEP THE CONTAINER UP
tail -f /var/log/nginx/access.log /var/log/nginx/error.log
