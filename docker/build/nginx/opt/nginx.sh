#!/usr/bin/env bash

#Можно подменить что-то в конфиге при запуске, например так:
#envsubst '$APP_ENV:$APP_ENV' < /etc/nginx/conf.d/app.template > /etc/nginx/conf.d/default.conf 

/opt/wait-for-it.sh -s -t 0 php:9000 -- nginx -g 'daemon off;'
