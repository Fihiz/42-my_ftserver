#to set an image with Debian-Buster OS
FROM debian:buster
#to label my docker project
LABEL maintainer="sad-aude@student.42lyon.fr"
LABEL build_date="2020-06-04"
LABEL description="learning to build my first docker image for a basic webserver using WordPress, PHPMyAdmin and MySQL"
#to run commands I need : packages installation
#RUN apt-get update && apt-get install -y \
