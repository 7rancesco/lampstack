# DOWNLOAD

- git clone https://github.com/7rancesco/lampstack.git app_name
- cd app_name
- rm .gitignore
- rm -rf .git


# VIRTUALHOST SETTING

- Create custom name with the following command:
- - sed -i 's/app_name/custom_name_here/g' *
- sudo nano /etc/hosts
- Add your custom domain name:
- - Ex: 127.0.0.1       localhost app_name.site

## Multi domain (optional)
- Duplicate vhost files
- add rows COPY in Dockerfile
- create another dir as app
- Adding volume in docker-compose.yml volumes


# INSTALL
- docker compose up --build


# Enable https
- sudo a2enmod ssl -> in DOCKERFILE
- sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/apache-selfsigned.key -out /etc/ssl/certs/apache-selfsigned.crt -> REMOVE
- - Question common name = your domian name -> REMOVE
- sudo a2ensite ssl-app_name.conf -> in DOCKERFILE
- sudo apache2ctl configtest -> in DOCKERFILE
- exit -> REMOVE
- docker stop app_name-server-1 -> REMOVE

# USAGE
- docker start app_name-server-1
- docker exec -it app_name-server-1 /bin/sh
- sudo service mysql start
- exit
- open https://app_name.site

## Access into container
- docker exec -it app_name-server-1 /bin/sh

## MYSQL SETTING
- sudo service mysql start
- mysql
- CREATE USER 'app_name'@'%' IDENTIFIED BY 'password';
- GRANT ALL ON *.* TO 'app_name'@'%';
- exit


# Installing Symfony (optional)

- curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | sudo -E bash
- sudo apt install symfony-cli
- symfony check:requirements
- symfony new symfony_app_name

- sudo nano /etc/apache2/sites-available/ssl-app_name.conf
- Paste this after document root:

    <Directory /var/www/app_name>
        AllowOverride None
        Require all granted
        FallbackResource /symfony_app_name/public/index.php
    </Directory>