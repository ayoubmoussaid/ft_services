#! /bin/sh

openrc default

rc-service vsftpd restart

while sleep 60; do
  pgrep vsftpd
  PROCESS_STATUS=$?
  if [ $PROCESS_STATUS -ne 0 ]; then
    rc-service vsftpd restart
  fi
done

