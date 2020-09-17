FROM alpine:3.12.0

LABEL maintainer="macrespo <macrespo@student.42.fr>"

RUN apk update --no-cache && \
    apk add --no-cache lighttpd

COPY ./conf/index.html /var/www/localhost/htdocs/index.html

EXPOSE 80 5050

CMD ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]