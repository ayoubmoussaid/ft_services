#! /bin/sh

openrc default

influx -username admin -password password -execute "CREATE DATABASE ftpsdb"
influx -username admin -password password -execute "CREATE DATABASE grafanadb"
influx -username admin -password password -execute "CREATE DATABASE influxdbdb"
influx -username admin -password password -execute "CREATE DATABASE mysqldb"
influx -username admin -password password -execute "CREATE DATABASE nginxdb"
influx -username admin -password password -execute "CREATE DATABASE phpmyadmindb"
influx -username admin -password password -execute "CREATE DATABASE wordpressdb"
rc-service influxdb restart
rc-service telegraf start
while sleep 60; do
  pgrep influx
  PROCESS_STATUS=$?
  pgrep telegraf
  PROCESS_1_STATUS=$?
  if [ $PROCESS_STATUS -ne 0 ]; then
    rc-service influxdb restart
  fi
  if [ $PROCESS_1_STATUS -ne 0 ]; then
    rc-service telegraf restart
  fi
done


# pgrep mariadb
# PROCESS_STATUS=$?
# if [ $PROCESS_STATUS -ne 0 ]; then
#   rc-service mariadb restart
# fi
