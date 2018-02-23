FROM wordpress:fpm-alpine

RUN { \
    echo 'post_max_size=128M'; \
    echo 'upload_max_filesize=128M'; \
  } > /usr/local/etc/php/conf.d/docker-php-upload.ini

RUN set -x \
        && deluser www-data \
        && addgroup -g 500 -S www-data \
        && adduser -u 500 -D -S -G www-data www-data

COPY www.conf /usr/local/etc/php-fpm.d/