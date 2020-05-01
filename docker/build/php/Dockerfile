FROM php:7.4-fpm-alpine

RUN apk add --no-cache bash shadow sudo && \
	apk add --update --no-cache --virtual .build $PHPIZE_DEPS && \
		pecl install xdebug && \
		docker-php-ext-enable xdebug && \
		apk del .build && \
	curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer 

COPY ./docker/build/php/etc/*.ini $PHP_INI_DIR/conf.d/
COPY ./docker/build/php/opt/*.sh /opt/
COPY ./src/ /var/www/html/

ENTRYPOINT ["/opt/entrypoint.sh"]
