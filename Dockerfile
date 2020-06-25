FROM debian:buster
LABEL maintainer="sad-aude@student.42lyon.fr"
LABEL description="Building my first Docker image for a basic LEMP webserver"
RUN apt-get update && apt-get upgrade -y && apt-get install -y nginx \
                                                               mariadb-server \
                                                               wget \
                                                               php \
                                                               php-cli \
                                                               php-cgi \
                                                               php-mbstring \
                                                               php-fpm \
                                                               php-mysql \
                                                               libnss3-tools
COPY srcs ./ft_server/
WORKDIR /ft_server/
EXPOSE 80 443
ENTRYPOINT ["sh", "container_config.sh"]