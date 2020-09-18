FROM alpine:3.12.0

LABEL maintainer="macrespo <macrespo@student.42.fr>"

COPY ./conf/setup_db.sh /etc/setup_db.sh

RUN apk --no-cache update \
    && apk --no-cache add mysql mysql-client \
    && chmod +x /etc/setup_db.sh

CMD ["/etc/setup_db.sh"]
