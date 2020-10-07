FROM alpine:3.12.0

LABEL maintainer="macrespo <macrespo@student.42.fr>"

RUN apk --no-cache update \
    && apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache \
    && apk --no-cache add mysql mysql-client

COPY ./conf/setup_db.sh /etc/setup_db.sh
COPY ./conf/my.cnf /etc/mysql/my.cnf
COPY ./conf/wordpress.sql /etc/wordpress.sql
COPY ./conf/telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 3306

CMD ["/etc/setup_db.sh"]
