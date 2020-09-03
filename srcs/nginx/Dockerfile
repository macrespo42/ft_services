FROM alpine:3.12.0

LABEL maintainer="macrespo <macrespo@student.42.fr>"

RUN apk update --no-cache && \
    apk add nginx --no-cache && \
    adduser -D 'www' wwww && \
    mkdir /www && \
    chown -R www:www /var/lib/nginx && \
    chown -R www:www /www && \
    mkdir -p /run/nginx

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/index.html /www/index.html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
