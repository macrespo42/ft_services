FROM alpine:3.12.0

LABEL maintainer="macrespo <macrespo@student.42.fr>"

RUN apk update --no-cache && \
	apk add --no-cache vsftpd openssl && \
	adduser -D admin && \
	echo "admin:admin" | chpasswd && \
	openssl req -x509 -nodes -days 365 -newkey rsa:4096 -subj '/C=FR/ST=75/L=Paris/O=42/CN=macrespo' -keyout \
    /etc/ssl/certs/vsftpd.key.pem -out /etc/ssl/certs/vsftpd.cert.pem

COPY ./conf/vsftpd.conf /etc/vsftpd/vsftpd.conf

EXPOSE 21

CMD ["/usr/sbin/vsftpd",  "/etc/vsftpd/vsftpd.conf"]