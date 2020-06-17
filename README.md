### FT_SERVER : project to set my first docker container with lemp deployment
LEMP = Linux Nginx(server) MySQL(database) PHP(middleware)


### To create our own image, first we need to write our Dockerfile

UNDERSTANDING THE DOCKERFILE INSTRUCTIONS \
https://docs.docker.com/get-started/part2/#sample-dockerfile \
https://codefresh.io/docker-tutorial/build-docker-image-dockerfiles/

To set an image with Debian-Buster OS
```bash
FROM debian:buster
```

To give labels to my Docker project \
The command "docker inspect" should be able to extract these infos
```bash
LABEL maintainer="sad-aude@student.42lyon.fr"
LABEL build_date="2020-06-04"
LABEL description="Building my first docker image for a basic webserver using LEMP"
```

To run shell commands I need \
Packages installation (use "get update" to be ensured to work to with last availables versions)
```bash
RUN apt-get update && apt-get upgrade -y && apt-get install -y nginx \
                                                               mariadb-server \
                                                               ...
```
                                            
To specify the directory the container should use
```bash
WORKDIR /42-my_ftserver/
```

To copy configs and scripts from the host in my container
```bash
COPY srcs ./42-my_ftserver/
```

To define an entrypoint : \
An entrypoint is the first script which is executed (similar to CMD)
```bash
ENTRYPOINT ["sh", "init_config.sh"]
```

### STEPS TO BUILD AND RUN
```bash
(sudo) docker build --tag [choosen_name] .
(sudo) docker run [choosen_name]
```
