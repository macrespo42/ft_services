FROM alpine:3.12.0

LABEL maintainer="macrespo <macrespo@student.42.fr>"

RUN apk --no-cache update \
    && apk --no-cache add mysql mysql-client

COPY ./conf/setup_db.sh /etc/setup_db.sh
COPY ./conf/my.cnf /etc/mysql/my.cnf
COPY ./conf/wordpress.sql /etc/wordpress.sql

EXPOSE 3306

CMD ["/etc/setup_db.sh"]
