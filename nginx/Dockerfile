FROM nginx:alpine

RUN set -x \
        && addgroup -g 500 -S www-data \
        && adduser -u 500 -D -S -G www-data www-data

COPY default.conf.tpl /etc/nginx/conf.d/default.conf.tpl
COPY docker-entrypoint.sh nginx-helper /usr/sbin/
COPY nginx.conf /etc/nginx/

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]