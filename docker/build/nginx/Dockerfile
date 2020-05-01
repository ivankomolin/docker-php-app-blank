FROM nginx:1.17.10-alpine

RUN apk add --no-cache bash

COPY ./docker/build/nginx/etc/*.conf /etc/nginx/conf.d/
COPY ./docker/build/nginx/opt/*.sh /opt/
COPY ./src/ /var/www/html/