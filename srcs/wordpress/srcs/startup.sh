#! /bin/sh

openrc default

rc-service nginx restart
rc-service php-fpm7 restart


while sleep 60; do
  pgrep php-fpm7
  PROCESS_STATUS=$?
  pgrep nginx
  PROCESS_1_STATUS=$?
  if [ $PROCESS_STATUS -ne 0 ]; then
    rc-service php-fpm7 restart
  fi
  if [ $PROCESS_1_STATUS -ne 0 ]; then
    rc-service nginx restart
  fi
done

