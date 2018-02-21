FROM nginx:alpine
COPY default.conf.tpl /etc/nginx/conf.d/default.conf.tpl
COPY nginx-helper|docker-entrypoint /usr/sbin
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]