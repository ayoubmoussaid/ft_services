#! /bin/sh

openrc default
rc-service telegraf start
cd grafana
/grafana/bin/grafana-server web

while sleep 60; do
  pgrep grafana
  PROCESS_STATUS=$?
  pgrep telegraf
  PROCESS_1_STATUS=$?
  if [ $PROCESS_STATUS -ne 0 ]; then
    /grafana/bin/grafana-server web
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