#!/bin/sh

telegraf &
/usr/sbin/sshd ; nginx -g 'daemon off;'