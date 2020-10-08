#!/bin/sh

telegraf &
lighttpd -D -f /etc/lighttpd/lighttpd.conf