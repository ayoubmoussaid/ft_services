#! /bin/sh

openrc default

rc-service nginx restart
rc-service php-fpm7 restart


while sleep 60; do
  pgrep php-fpm7
  PROCESS_STATUS=$?
  pgrep nginx
  PROCESS_1_STATUS=$?
  if [ $PROCESS_STATUS -ne 0 -o $PROCESS_1_STATUS -ne 0 ]; then
    echo "A process has been stopped or exited."
    exit 1
  fi
done

