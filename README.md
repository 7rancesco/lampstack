# INSTALL
- git clone https://github.com/7rancesco/lampstack.git App_name
- cd App_name
- rm .gitignore
- rm -rf .git
- docker compose up --build

# SET MYSQL 
- sudo service mysql start
- mysql
- CREATE USER 'francesco'@'%' IDENTIFIED BY 'password';
- CREATE DATABASE my_database;
- GRANT ALL ON my_database.* TO 'francesco'@'%';

# TRY

- http://francesco

## Customize ServerName, Alias, User ecc..

- Replace "francesco" in 
- - Virtualhost.conf
- - Dockerfile
- - DockerCompose.yml