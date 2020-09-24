FROM alpine:3.12.0

LABEL maintainer="macrespo <macrespo@student.42.fr>"

COPY ./conf/ssh_setup.sh /etc/ssh_setup.sh

RUN apk update --no-cache && \
    apk add nginx openssl openssh --no-cache && \
    adduser -D 'www' wwww && \
    mkdir /www && \
    chown -R www:www /var/lib/nginx && \
    chown -R www:www /www && \
    mkdir -p /etc/ssl/certs/ && \
    openssl req -x509 -nodes -days 365 -newkey rsa:4096 -subj '/C=FR/ST=75/L=Paris/O=42/CN=macrespo' -keyout \
    /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt && \  
    mkdir -p /run/nginx && \
    /etc/ssh_setup.sh


COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/index.html /www/index.html

EXPOSE 80 443 22

CMD ["/usr/sbin/sshd;", "nginx", "-g", "daemon off;"]
