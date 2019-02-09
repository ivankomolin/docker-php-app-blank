ARG CI_REGISTRY_IMAGE

FROM ${CI_REGISTRY_IMAGE}/base/php:latest

COPY ./app/ /var/www/html/
RUN chown -R www-data:www-data /var/www/html && \
    sudo -EH -u www-data bash -c "cd /var/www/html/ && composer install --prefer-dist --ignore-platform-reqs && composer clearcache"

COPY \
    ./docker/build/final/php/etc/php-fpm.sh \
    ./docker/build/final/php/etc/worker.sh \
    /opt/

RUN chmod +x /opt/*.sh
