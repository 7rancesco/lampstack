# SETT VIRTUALHOST
## Customize ServerName 
- Replace "francesco" to your custom name in:
- - Virtualhost.conf
- - Dockerfile
- - DockerCompose.yml

## Register ServerName
- Open terminal
- sudo nano /etc/hosts
- Add your custom domain name in the first line after localhost

# INSTALL
- git clone https://github.com/7rancesco/lampstack.git App_name
- cd App_name
- rm .gitignore
- rm -rf .git
- docker compose up --build

## Access to container
In new terminal
- docker exec -it App_name-server-1 /bin/sh

# SET MYSQL from Docker command line
- sudo service mysql start
- mysql
- CREATE USER 'francesco'@'%' IDENTIFIED BY 'password';
- CREATE DATABASE my_database;
- GRANT ALL ON my_database.* TO 'francesco'@'%';
- exit

# Enable https
- sudo a2enmod ssl
- sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/apache-selfsigned.key -out /etc/ssl/certs/apache-selfsigned.crt
- - Common name = your domian name
- sudo a2ensite ssl-francesco.conf
- sudo apache2ctl configtest
- - output (Syntax OK)
- exit
- docker stop App_name-server-1

# USAGE
- docker start App_name-server-1
- docker exec -it App_name-server-1 /bin/sh
- sudo service mysql start
- exit
- open https://francesco.site

# TIPS

## Multi domain
- Duplicate vhost files
- add rows COPY in Dockerfile
- create another dir as app
- Adding volume in docker-compose.yml volumes


## Installing Symfony
LAMPSTACK FIX

- sudo apt-get install -y php-simplexml 


SYMFONY 

- apt install -y curl
- curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | sudo -E bash
- sudo apt install symfony-cli
- symfony check:requirements
- symfony new app_name

*Ignore error: "fatal: unable to auto-detect email address"

- sudo nano /etc/apache2/sites-available/ssl-app_name.conf
- Paste this after document root:

    <Directory /var/www/app_name>
        AllowOverride None
        Require all granted
        FallbackResource /myapp/public/index.php
    </Directory>

# Task
- Fix mysql auto start 
- Adding phpMyAdmin