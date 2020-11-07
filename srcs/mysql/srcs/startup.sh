#! /bin/sh

openrc default
/etc/init.d/mariadb setup
cp /my.cnf /etc/mysql/
/etc/init.d/mariadb start 
mysql -u root -e "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY 'password'; FLUSH PRIVILEGES;"
mysql -u root -e "CREATE DATABASE phpmyadmin;" 
mysql < /phpmyadmin.sql -u root 
mysql -u root -e "create database wordpress"
/etc/init.d/mariadb restart

while sleep 60; do
  pgrep mariadb
  PROCESS_STATUS=$?
  if [ $PROCESS_STATUS -ne 0 ]; then
    rc-service mariadb restart
  fi
done

