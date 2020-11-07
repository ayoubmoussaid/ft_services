#! /bin/sh

rc-service nginx start
mkdir /run/openrc/
touch /run/openrc/softlevel
rc-service nginx start
rc-service php-fpm7 start
/etc/init.d/sshd restart

while sleep 60; do
  pgrep nginx
  PROCESS_STATUS=$?
  pgrep sshd
  PROCESS_1_STATUS=$?
  pgrep php-fpm7
  PROCESS_2_STATUS=$?
  if [ $PROCESS_STATUS -ne 0 ]; then
    rc-service nginx restart
  fi
  if [ $PROCESS_1_STATUS -ne 0 ]; then
    rc-service sshd restart
  fi
  if [ $PROCESS_2_STATUS -ne 0 ]; then
    rc-service php-fpm7 restart
  fi
done