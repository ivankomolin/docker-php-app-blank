#!/usr/bin/env sh

envsubst '$APP_ENV:$APP_ENV' < /etc/nginx/conf.d/app.template > /etc/nginx/conf.d/app.conf && nginx -g 'daemon off;'
