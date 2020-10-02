FROM alpine:3.12.0

LABEL maintainer="macrespo <macrespo@student.42.fr>"

RUN apk update --no-cache && \
    apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache && \
    apk add nginx openssl openssh --no-cache && \
    adduser -D 'www' wwww && \
    mkdir /www && \
    chown -R www:www /var/lib/nginx && \
    chown -R www:www /www && \
    mkdir -p /etc/ssl/certs/ && \
    openssl req -x509 -nodes -days 365 -newkey rsa:4096 -subj '/C=FR/ST=75/L=Paris/O=42/CN=macrespo' -keyout \
    /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt && \  
    mkdir -p /run/nginx


COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/index.html /www/index.html
COPY ./conf/entrypoint.sh /etc/entrypoint.sh
COPY ./conf/telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 80 443 22

CMD ["/etc/entrypoint.sh"]