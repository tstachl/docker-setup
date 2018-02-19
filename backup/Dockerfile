FROM alpine

# install dependencies
RUN apk add --update --no-cache \
    mysql-client \
    duplicity

RUN addgroup -g 3000 -S www-data
RUN adduser -u 3000 -S -D -G www-data www-data

RUN set -ex; \
	mkdir -p /var/www/html; \
	chown -R www-data:www-data /var/www/html
WORKDIR /var/www/html
VOLUME /var/www/html

COPY backup /usr/local/bin
COPY restore /usr/local/bin

USER www-data
CMD ["backup"]
