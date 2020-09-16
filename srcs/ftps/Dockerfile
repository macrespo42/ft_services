FROM alpine:3.11.3

LABEL maintainer="macrespo <macrespo@student.42.fr>"

RUN apk update --no-cache \
    && apk add vsftpd openssl --no-cache

COPY ./srcs/vsftpd.conf /etc/vsftpd.conf
COPY ./srcs/start.sh /start.sh

RUN chmod +x /start.sh

EXPOSE 20 21 32099 32100

CMD [ "./start.sh" ]