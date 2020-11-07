#! /bin/sh

openrc default
cd grafana
/grafana/bin/grafana-server web

while sleep 60; do
  pgrep grafana
  PROCESS_STATUS=$?
  if [ $PROCESS_STATUS -ne 0 ]; then
    /grafana/bin/grafana-server web
  fi
done


# pgrep mariadb
# PROCESS_STATUS=$?
# if [ $PROCESS_STATUS -ne 0 ]; then
#   rc-service mariadb restart
# fi