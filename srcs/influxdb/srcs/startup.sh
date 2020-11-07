#! /bin/sh

openrc default

rc-service influxdb restart

while sleep 60; do
  pgrep influx
  PROCESS_STATUS=$?
  if [ $PROCESS_STATUS -ne 0 ]; then
    rc-service influxdb restart
  fi
done


# pgrep mariadb
# PROCESS_STATUS=$?
# if [ $PROCESS_STATUS -ne 0 ]; then
#   rc-service mariadb restart
# fi