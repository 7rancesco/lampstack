FROM ubuntu:22.04
RUN apt-get update
RUN apt install sudo
RUN sudo apt install ufw -y
RUN apt-get install -y apache2 && apt-get clean
CMD apachectl -D FOREGROUND
RUN sudo apt install mysql-server -y
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true
RUN echo "tzdata tzdata/Areas select Europe" > /tmp/preseed.txt; \
    echo "tzdata tzdata/Zones/Europe select Rome" >> /tmp/preseed.txt; \
    debconf-set-selections /tmp/preseed.txt && \
    apt-get update && \
    apt-get install -y tzdata
RUN sudo apt install php -y
RUN sudo apt install libapache2-mod-php -y
RUN sudo apt install php-mysql -y
RUN sudo mkdir /var/www/francesco
COPY ./virtualhost.conf /etc/apache2/sites-available/francesco.conf
COPY ./ssl-virtualhost.conf /etc/apache2/sites-available/ssl-francesco.conf
RUN sudo a2ensite francesco
RUN sudo a2dissite 000-default