FROM nginx:alpine

RUN addgroup -g 3000 -S app
RUN adduser -u 3000 -S -D -G app app

COPY nginx.conf /etc/nginx/nginx.conf
COPY nginx.vh.default.conf /etc/nginx/conf.d/default.conf
