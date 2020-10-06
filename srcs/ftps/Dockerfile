FROM alpine:3.12.0

LABEL maintainer="macrespo <macrespo@student.42.fr>"

RUN apk update --no-cache \
    && apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache \
    && apk add vsftpd openssl --no-cache

COPY ./conf/vsftpd.conf /etc/vsftpd.conf
COPY ./conf/start.sh /start.sh
COPY ./conf/telegraf.conf /etc/telegraf/telegraf.conf

RUN chmod +x /start.sh

EXPOSE 20 21 32099 32100

CMD [ "./start.sh" ]