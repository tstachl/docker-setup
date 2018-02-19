FROM wordpress:fpm-alpine

RUN set -ex; \
  \
  apk add --no-cache --virtual .build-deps \
    build-base \
    autoconf \
  ; \
  \
  yes '' | pecl install -f redis \
  \
  apk del .build-deps

RUN { \
    echo 'extension=redis.so'; \
  } > /usr/local/etc/php/conf.d/docker-php-ext-redis.ini
