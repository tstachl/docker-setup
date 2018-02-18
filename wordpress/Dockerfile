FROM wordpress:fpm-alpine

RUN addgroup -g 3000 -S app
RUN adduser -u 3000 -S -D -G app app

COPY www.conf /usr/local/etc/php-fpm.d/www.conf
