#!/bin/bash

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

#TEST PART
echo "<?php phpinfo(); ?>" > /var/www/localhost/phpinfo.php
cp todo_tests/test.html /var/www/localhost/test.html
cp todo_tests/todo_list.php /var/www/localhost/todo_list.php

#rm /var/www/localhost/todo_list.php