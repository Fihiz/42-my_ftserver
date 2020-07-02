  
#!/bin/sh

if ! cmp -s /etc/nginx/sites-enabled/localhost /root/index/localhost-conf-off
then
	echo "ON->OFF"
	cp /root/index/localhost-conf-off /etc/nginx/sites-enabled/localhost
	cp /var/www/html/index.nginx-debian.html /var/www/localhost/index.html
elif ! cmp -s /etc/nginx/sites-enabled/localhost /root/index/localhost-conf-on
then
	echo "OFF->ON"
	cp /root/index/localhost-conf-on /etc/nginx/sites-enabled/localhost
	rm -r /var/www/localhost/index.html
fi

service nginx restart