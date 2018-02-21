FROM nginx:alpine
COPY default.conf.tpl /etc/nginx/conf.d/default.conf.tpl
COPY nginx-helper /usr/sbin/
COPY docker-entrypoint.sh /usr/sbin/
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]