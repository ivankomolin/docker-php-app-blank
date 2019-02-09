FROM php:7.3-fpm-alpine

RUN apk add --no-cache \
    bash \
    sudo \
    shadow \
    php7-pdo_mysql \
    freetype \
    libpng \
    libjpeg-turbo \
    && \
    apk add --no-cache --virtual .build $PHPIZE_DEPS freetype-dev libpng-dev libjpeg-turbo-dev && \
    docker-php-ext-install exif && \
    docker-php-ext-install pdo_mysql && \
    docker-php-ext-configure gd \
        --with-gd \
        --with-freetype-dir=/usr/include/ \
        --with-png-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install -j1 gd && \
    apk del .build \
    && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && \
    sudo -EH -u www-data bash -c "composer global require hirak/prestissimo --no-plugins --no-scripts && composer clearcache"

COPY etc/wait-for-it.sh /opt/wait-for-it.sh
COPY etc/www.conf /usr/local/etc/php-fpm.d/www.conf