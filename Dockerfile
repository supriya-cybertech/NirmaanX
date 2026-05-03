FROM nginx:alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY index.html /usr/share/nginx/html/index.html
CMD sed -i -e 's/80/8080/g' /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'
