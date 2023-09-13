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
RUN sudo apt-get install -y php-simplexml
RUN sudo apt install -y curl
RUN sudo apt install nano
RUN sudo mkdir /var/www/app_name
RUN sudo a2enmod ssl
COPY ./util/apache-selfsigned.crt /etc/ssl/certs/apache-selfsigned.crt
COPY ./util/apache-selfsigned.key /etc/ssl/certs/apache-selfsigned.key
COPY ./virtualhost.conf /etc/apache2/sites-available/app_name.conf
COPY ./ssl-virtualhost.conf /etc/apache2/sites-available/ssl-app_name.conf
RUN sudo a2ensite ssl-app_name.conf
RUN sudo a2ensite app_name
RUN sudo a2dissite 000-default