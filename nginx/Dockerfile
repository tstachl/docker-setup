FROM nginx:alpine
COPY default.conf /etc/nginx/conf.d/default.conf.templ
COPY nginx-helper /usr/sbin/nginx-helper
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]