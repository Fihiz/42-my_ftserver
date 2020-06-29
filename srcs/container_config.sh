#!/bin/bash

echo "Here we finish to set our server !"

#NGINX SETUP
mkdir -p /var/www/localhost
chown -R $USER:$USER /var/www/localhost
cp localhost-conf /etc/nginx/sites-available/localhost
ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/

#SSL SETUP FOR SECURITY
cd ssl
chmod +x mkcert
./mkcert -install
./mkcert localhost
cd ..

#DATABASE STARTER PACK -> CREATE AN ADMINISTRATIVE MYSQL USER
service mysql start
echo "CREATE DATABASE data;" | mysql -u root
echo "CREATE USER 'user'@'localhost' IDENTIFIED BY 'pass';" | mysql -u root
#echo "SET password FOR 'tester'@'localhost' = password('pass');" | mysql -u root
echo "GRANT ALL PRIVILEGES ON data.* TO 'user'@'localhost' IDENTIFIED BY 'pass';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

echo "DB and user are created, let's try to fill our table."

echo "CREATE TABLE data.todo_list (item_id INT AUTO_INCREMENT, content VARCHAR(255), PRIMARY KEY(item_id));" | mysql -u root

echo "INSERT INTO data.todo_list (content) VALUES ('Patate, poisson');" | mysql -u root
echo "INSERT INTO data.todo_list (content) VALUES ('Manucure ?');" | mysql -u root

echo "SELECT * FROM data.todo_list;" | mysql -u root


#TEST
#cp info.php /var/www/localhost/info.php
echo "<?php phpinfo(); ?>" > /var/www/localhost/phpinfo.php
cp todo_tests/test.html /var/www/localhost/test.html
cp todo_tests/todo_list.php /var/www/localhost/todo_list.php

#STARTING
/etc/init.d/php7.3-fpm start
service nginx configtest
service nginx restart

#TO KEEP THE CONTAINER UP
tail -f /var/log/nginx/access.log /var/log/nginx/error.log
