#! /bin/sh

openrc default

rc-service vsftpd restart
rc-service telegraf start
while sleep 60; do
  pgrep vsftpd
  PROCESS_STATUS=$?
  pgrep telegraf
  PROCESS_1_STATUS=$?
  if [ $PROCESS_STATUS -ne 0 ]; then
    rc-service vsftpd restart
  fi
  if [ $PROCESS_1_STATUS -ne 0 ]; then
    rc-service telegraf restart
  fi
done

