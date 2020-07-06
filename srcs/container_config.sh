#!/bin/bash

echo "Here we finish to set our server !"

#NGINX SETUP -> ACTIVATING VIRTUAL HOST (BE CAREFUL TO ADD FULL RIGHTS ON FOLDERS AND FILES, www-data is user by default of nginx)
mkdir -p /var/www/localhost
cp auto_index/localhost-conf-on /etc/nginx/sites-available/localhost
ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/

#SSL SETUP FOR SECURITY BETWEEN SERVER AND NAVIGATOR -> HTTP TO HTTPS
cd ssl
chmod +x mkcert
./mkcert -install
./mkcert localhost
cd ..

#DATABASE AND USER SETUP FOR WORDPRESS -> NEVER DOING IT WITH ADMINISTRATOR SYSTEM FOR SECURITY REASONS
service mysql start
echo "CREATE DATABASE wordpress;" | mysql -u root 
echo "CREATE USER 'wordpress'@'localhost';" | mysql -u root
echo "SET password FOR 'wordpress'@'localhost' = password('mon_password');" | mysql -u root
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'localhost' IDENTIFIED BY 'mon_password';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

#WORDPRESS SETUP -> COMPRESSED FILES DOWNLOADED FROM OFFICIAL WEBSITE WITH WGET
tar -xzvf wordpress_set/wordpress.tar.gz
mv wordpress /var/www/localhost/wordpress
cp wordpress_set/wp-config.php /var/www/localhost/wordpress/wp-config.php

#PHPMYADMIN SETUP
tar -xzvf phpMyAdmin/phpMyAdmin.tar.gz
mv phpMyAdmin-4.9.0.1-all-languages /var/www/localhost/phpMyAdmin

#USER APPLICATION SETUP -> TO LIMIT SCOPE OF ACCESS IN CASE OF INTRUSION
chown -R www-data:www-data /var/www/*
chmod -R 755 /var/www/*

#TEST PART
#echo "<?php phpinfo(); ?>" > /var/www/localhost/phpinfo.php
cp /root/todo_tests/test.html /var/www/localhost/test.html

#STARTING COMMUNICATION BETWEEN PHP AND NGINX WITH OUR CONFIG
/etc/init.d/php7.3-fpm start
service nginx configtest
service nginx restart

#TO KEEP THE CONTAINER UP -> INFINITE LOOP SHOWING UP LOGS
tail -f /var/log/nginx/access.log /var/log/nginx/error.log
