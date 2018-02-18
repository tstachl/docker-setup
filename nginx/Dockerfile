FROM nginx:alpine

COPY nginx.conf /etc/nginx/nginx.conf
COPY nginx.vh.default.conf /etc/nginx/conf.d/default.conf

RUN addgroup -g 3000 -S www-data
RUN adduser -u 3000 -S -D -G www-data www-data