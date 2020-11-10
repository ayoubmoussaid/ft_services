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

rc-service telegraf start
while sleep 60; do
  pgrep mariadb
  PROCESS_STATUS=$?
  pgrep telegraf
  PROCESS_1_STATUS=$?
  if [ $PROCESS_STATUS -ne 0 ]; then
    rc-service mariadb restart
  fi
  if [ $PROCESS_1_STATUS -ne 0 ]; then
    rc-service telegraf restart
  fi
done

