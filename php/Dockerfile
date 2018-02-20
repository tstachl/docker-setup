FROM wordpress:fpm-alpine

RUN { \
    echo 'post_max_size=128M'; \
    echo 'upload_max_filesize=128M'; \
  } > /usr/local/etc/php/conf.d/docker-php-upload.ini
