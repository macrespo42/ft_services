#!/bin/sh

if [ -z $SSH_USER ]; then
	SSH_USER="admin"
fi

if [ -z $SSH_PASSWORD ]; then
	SSH_PASSWORD="admin"
fi

adduser -D $SSH_USER
echo "$SSH_USER:$SSH_PASSWORD" | chpasswd

sed -i "s/#Port 22/Port 22/g" /etc/ssh/sshd_config
ssh-keygen -f /etc/ssh/ssh_host_rsa_key

telegraf &
/usr/sbin/sshd ; nginx -g 'daemon off;'