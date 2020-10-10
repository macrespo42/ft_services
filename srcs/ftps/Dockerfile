FROM alpine:3.12.0

RUN apk --no-cache add vsftpd openssl && \
    apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache && \
    openssl req -x509 -nodes -days 365 -newkey rsa:4096 -subj '/C=FR/ST=75/L=Paris/O=42/CN=macrespo' -keyout \
    /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt && \
    mkdir -p /etc/telegraf

COPY ./conf/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY ./conf/start.sh /bin/start.sh
COPY ./conf/telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 21 31000

ENTRYPOINT ["/bin/start.sh"]
