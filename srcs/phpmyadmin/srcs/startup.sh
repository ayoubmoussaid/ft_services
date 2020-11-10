#! /bin/sh

openrc default

rc-service nginx restart
rc-service php-fpm7 restart
rc-service telegraf start

while sleep 60; do
  pgrep php-fpm7
  PROCESS_STATUS=$?
  pgrep nginx
  PROCESS_1_STATUS=$?
  pgrep telegraf
  PROCESS_2_STATUS=$?
  if [ $PROCESS_STATUS -ne 0 ]; then
    rc-service php-fpm7 restart
  fi
  if [ $PROCESS_1_STATUS -ne 0 ]; then
    rc-service nginx restart
  fi
  if [ $PROCESS_2_STATUS -ne 0 ]; then
    rc-service telegraf restart
  fi
done

