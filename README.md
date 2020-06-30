## FT_SERVER : project to set my first docker container with lemp deployment
### LEMP = Linux Nginx(server) MySQL(database) PHP(middleware)


1 - To create our own docker image, first we need to write our Dockerfile

   TO UNDERSTAND DOCKERFILE INSTRUCTIONS \
    https://docs.docker.com/get-started/part2/#sample-dockerfile \
    https://codefresh.io/docker-tutorial/build-docker-image-dockerfiles/

To set an image with Debian-Buster OS
```bash
FROM debian:buster
```

To give labels to my Docker project (the command "docker inspect" should be able to extract these infos) \
```bash
LABEL maintainer="sad-aude@student.42lyon.fr"
LABEL build_date="2020-06-04"
LABEL description="Building my first docker image for a basic webserver using LEMP"
```

To run shell commands I need (packages installation using "get update" to be ensured to work to with last availables versions) \
```bash
RUN apt-get update && apt-get upgrade -y && apt-get install -y nginx \
                                                               mariadb-server \
                                                               ...
```

To copy configs and scripts from the host in my container
```bash
COPY srcs ./42-my_ftserver/
```

To specify the directory the container may use
```bash
WORKDIR /42-my_ftserver/
```

To define an entrypoint (a CMD is the first script which is executed, similar to ENTRYPOINT)
```bash
CMD ["sh", "init_config.sh"]
```

COMMANDS STEPS TO BUILD AND RUN
```bash
docker build --tag [choosen_image_name] .
docker run -p 443:443 [choosen_image_name]
```

To remove all unused or interrupted images, containers and volumes :
```bash
docker system prune -a
```

2 - Now we need to deploy our lemp server \

UNDERSTANDING LEMP DEPLOYMENT \
https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mariadb-php-lemp-stack-on-debian-10 \
https://www.linuxbabe.com/debian/install-lemp-stack-debian-10-buster \
https://www.codeflow.site/fr/article/how-to-install-linux-nginx-mysql-php-lemp-stack-ubuntu-18-04 \
https://korben.info/nginx-rediriger-http-https.html \
https://community.jaguar-network.com/installation-dun-serveur-web-lemp/#menu_mysql \
https://howto.wared.fr/installation-koken-nginx-php-fpm-mariadb/
