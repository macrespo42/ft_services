FROM alpine:3.12.0

LABEL maintainer="macrespo <macrespo@student.42.fr>"

RUN apk update --no-cache && \
	apk add vsftpd && \
	adduser -D admin && \
	echo "admin:admin" | chpasswd

COPY ./conf/vsftpd.conf /etc/vsftpd/vsftpd.conf

EXPOSE 21

CMD ["/usr/sbin/vsftpd",  "/etc/vsftpd/vsftpd.conf"]