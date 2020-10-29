#!/bin/bash

adduser -D -g 'www' www

chown -R www:www /var/lib/nginx

chown -R www:www /www

chmod 777 /www

mkdir /etc/nginx/ssl

chmod 700 /etc/nginx/ssl

apk add openssl

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/server.key -out /etc/nginx/ssl/server.crt  -subj "/C=$COUNTRY/ST=$STATE/L=$LOCALITY/O=$ORGANIZATION/CN=$SERVERNAME"

