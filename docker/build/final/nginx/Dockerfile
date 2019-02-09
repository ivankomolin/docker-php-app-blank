FROM nginx:1.15.7-alpine

RUN apk add --no-cache bash

COPY ./docker/build/final/nginx/etc/conf.d/app.template /etc/nginx/conf.d/
RUN rm /etc/nginx/conf.d/default.conf

COPY ./app/public/ /var/www/html/public/

COPY ./docker/build/final/nginx/etc/start.sh /opt/start.sh
RUN  chmod +x /opt/start.sh

ENTRYPOINT /opt/start.sh
