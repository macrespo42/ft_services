#!/bin/sh

if [ -z "$FTPS_USER" ]; then
    FTPS_USER="admin"
fi

if [ -z "$FTPS_PASSWORD" ]; then
    FTPS_PASSWORD="1234"
fi

openssl req -x509 -nodes -days 7300 -newkey rsa:2048 -subj "/C=FR/ST=fr/L=Paris/O=42/CN=macrespo" -keyout /etc/ssl/certs/vsftpd.pem -out /etc/ssl/certs/vsftpd.pem

mkdir -p /ftps/data/
chmod a-w ftps/data

addgroup ftps_users
adduser -D --ingroup ftps_users $FTPS_USER
echo "$FTPS_USER:$FTPS_PASSWORD" | chpasswd

mkdir /ftps/data/$FTPS_USER
chown -R $FTPS_USER:ftps_users /ftps/data/$FTPS_USER

/usr/sbin/vsftpd /etc/vsftpd.conf