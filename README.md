#UNDERSTANDING THE DOCKERFILE INSTRUCTIONS

# To set an image with Debian-Buster OS
FROM debian:buster

# To give labels to my Docker project
# The command "docker inspect" should be able to extract these infos
LABEL maintainer="sad-aude@student.42lyon.fr"
LABEL build_date="2020-06-04"
LABEL description="Building my first docker image for a basic webserver using LEMP"

# To run commands I need
# Packages installation ("get update" to be ensured to work to with last availables versions)
RUN apt-get update && apt-get upgrade -y && apt-get install -y nginx \
                                                               mariadb-server \
                                                               ... \
                                            
# To specify the directory the container should use
WORKDIR /42-my_ftserver/

# To copy configs and scripts in my container
COPY srcs /42-my_ftserver/

# To define an entrypoint : first script executed while the launching of my container
ENTRYPOINT ["sh", "init_config.sh"]