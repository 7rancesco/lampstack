# DOWNLOAD

- git clone https://github.com/7rancesco/lampstack.git app_name
- cd app_name
- rm .gitignore
- rm -rf .git


# VIRTUALHOST SETTING

- Create custom name with the following command:
- - sed -i '' 's/app_name/custom_name_here/g' *
- sudo nano /etc/hosts
- Add your custom domain name:
- - Ex: 127.0.0.1       localhost app_name.site

## Multi domain (optional)
- Duplicate vhost files
- add rows COPY in Dockerfile
- Adding volume in docker-compose.yml volumes
- Adding custom domain name


# INSTALL
- docker compose up --build


# USAGE
- START CONTAINER
- - docker start app_name-server-1
- STOP CONTAINER
- - docker stop app_name-server-1
- RESTART CONTAINER
- - docker restart app_name-server-1
- CONNECT TO CONTAINER
- - docker exec -it app_name-server-1 /bin/sh
- START MYSQL
- - (Connect to container) sudo service mysql start

## MYSQL MIN SETTING
(Connect to container)
- sudo service mysql start
- mysql
- CREATE USER 'app_name'@'%' IDENTIFIED BY 'password';
- GRANT ALL ON *.* TO 'app_name'@'%';

## Installing Symfony (optional)
(Connect to container)
- curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | sudo -E bash
- sudo apt install symfony-cli
- symfony check:requirements
- symfony new symfony_project_name

- ### VHOST SETT
- sudo nano /etc/apache2/sites-available/ssl-app_name.conf
- Add under DocumentRoot /var/www/app_name

(OPTION 1)
- - #### Via FallbackResource

    <Directory /var/www/app_name>
        AllowOverride None
        Require all granted
        FallbackResource /symfony_project_name/public/index.php
    </Directory>

(OPTION 2)
- - #### Via .htaccess

    <Directory /var/www/app_name>
        AllowOverride None
        Require all granted
    </Directory>

- - - Example for htaccess in /z_utils/symfony_apache
- - - Important! Run: sudo a2enmod rewrite
 
