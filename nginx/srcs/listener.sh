#! /bin/bash

rc-service nginx start
mkdir /run/openrc/
touch /run/openrc/softlevel
rc-service nginx start
while sleep 60; do
  pgrep nginx
  PROCESS_STATUS=$?
  if [ $PROCESS_STATUS -ne 0 ]; then
    rc-service nginx start
  fi
done