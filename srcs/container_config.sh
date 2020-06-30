#!/bin/bash

echo "Here we finish to set our server !"

#NGINX SETUP -> ACTIVATING VIRTUAL HOST (BE CAREFUL TO ADD FULL RIGHTS ON FOLDERS AND FILES, www-data is user by default of nginx)
mkdir -p /var/www/localhost
#chown -R $USER:$USER /var/www/localhost
chown -R www-data -R /var/www/localhost
cp localhost-conf /etc/nginx/sites-available/localhost
ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/

#SSL SETUP FOR SECURITY BETWEEN SERVER AND NAVIGATOR -> HTTP TO HTTPS
cd ssl
chmod +x mkcert
./mkcert -install
./mkcert localhost
cd ..

#WORDPRESS SETUP -> COMPRESSED FILES DOWNLOADED FROM OFFICIAL WEBSITE WITH WGET
cp websrcs/wordpress.tar.gz /var/www/localhost/
cd /var/www/localhost/
tar -xzvf wordpress.tar.gz
rm wordpress.tar.gz


#DATABASE AND USER SETUP FOR WORDPRESS -> NEVER DOING IT WITH ADMINISTRATOR SYSTEM FOR SECURITY REASONS
echo "CREATE DATABASE wordpress;" | mysql -u root 
echo "CREATE USER 'wordpress'@'localhost';" | mysql -u root
echo "SET password FOR 'wordpress'@'localhost' = password('mon_password');" | mysql -u root
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'localhost' IDENTIFIED BY 'mon_password';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

#USER APPLICATION SETUP -> TO LIMIT SCOPE OF ACCESS IN CASE OF INTRUSION
adduser appuser
chown appuser:www-data -R /var/www/*
chmod -R 710 -R /var/www/*

#STARTING COMMUNICATION BETWEEN PHP AND NGINX WITH OUR CONFIG
/etc/init.d/php7.3-fpm start
service nginx configtest
service nginx restart

#TO KEEP THE CONTAINER UP -> INFINITE LOOP SHOWING UP LOGS
tail -f /var/log/nginx/access.log /var/log/nginx/error.log
