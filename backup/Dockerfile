FROM alpine

# install dependencies
RUN apk add --no-cache \
		mysql-client \
		duplicity

RUN set -ex; \
	mkdir -p /var/www/html; \
	chown -R www-data:www-data /var/www/html
WORKDIR /var/www/html
VOLUME /var/www/html

COPY docker-entrypoint.sh /usr/local/bin/
COPY backup /usr/local/bin
COPY restore /usr/local/bin

ENTRYPOINT ["docker-entrypoint.sh"]
USER www-data
CMD ["backup"]
