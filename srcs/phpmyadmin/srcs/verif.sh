#! /bin/sh

pgrep nginx >> /dev/null
PROCESS_STATUS=$?
pgrep php-fpm7 >> /dev/null
PROCESS_2_STATUS=$?
if [ $PROCESS_STATUS -ne 0 ]; then
    exit 1
fi
if [ $PROCESS_2_STATUS -ne 0 ]; then
    exit 1
fi
exit 0