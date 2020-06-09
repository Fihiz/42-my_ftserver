FROM debian:buster
LABEL maintainer="sad-aude@student.42lyon.fr"
LABEL build_date="2020-06-04"
LABEL description="building my first docker image for a basic webserver using WordPress, PHPMyAdmin and MySQL"
RUN apt-get update && apt-get upgrade -y && apt-get install -y nginx \
                                                               mariadb-server \
                                                               wget \
                                                               
                                            

WORKDIR /42-my_ftserver/
COPY srcs /42-my_ftserver/
ENTRYPOINT ["sh", "init_config.sh"]
