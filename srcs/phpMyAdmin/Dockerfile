FROM alpine:3.12.0

LABEL maintainer="macrespo <macrespo@student.42.fr>"

COPY ./conf/phpMyAdmin-4.9.5-all-languages.tar.gz /etc/phpMyAdmin-4.9.5-all-languages.tar.gz
# ADD https://files.phpmyadmin.net/phpMyAdmin/4.9.5/phpMyAdmin-4.9.5-all-languages.tar.gz /etc/phpMyAdmin-4.9.5-all-languages.tar.gz

RUN apk update --no-cache \
    && apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache \
    && mkdir -p /etc/telegraf \
    && apk add --no-cache lighttpd lighttpd php7-mbstring php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom php7-session\
    && mkdir -p /var/run/lighttpd \
    && touch /var/run/lighttpd/php-fastcgi.socket \
    && chown -R lighttpd:lighttpd /var/run/lighttpd \
    && sed -i 's/\/run\/lighttpd.pid/\/run\/lighttpd\/php-fast-cgi.socket/g' /etc/lighttpd/lighttpd.conf \
    && sed -i 's/#   include "mod_fastcgi.conf"/include "mod_fastcgi.conf"/g' /etc/lighttpd/lighttpd.conf \
    && sed -i 's/php-cgi/php-cgi7/g' /etc/lighttpd/lighttpd.conf \
    && tar -xf /etc/phpMyAdmin-4.9.5-all-languages.tar.gz -C /var/www/localhost/htdocs/ \
    && rm -f /etc/phpMyAdmin-4.9.5-all-languages.tar.gz \
    && chmod 755 /var/www/localhost/htdocs/ \
    && mv /var/www/localhost/htdocs/phpMyAdmin-4.9.5-all-languages /var/www/localhost/htdocs/phpMyAdmin \
    && mv /var/www/localhost/htdocs/phpMyAdmin/* /var/www/localhost/htdocs/ \
    && rm -rf /var/www/localhost/htdocs/phpmyadmin/ \
    && rm -f /var/www/localhost/htdocs/config.sample.inc.php \
    && mkdir -p /usr/share/phpmyadmin/tmp \
    && chown -R lighttpd:lighttpd /usr/share/phpmyadmin/tmp

COPY ./conf/config.inc.php /var/www/localhost/htdocs/config.inc.php
COPY ./conf/telegraf.conf /etc/telegraf/telegraf.conf
COPY ./conf/entrypoint.sh /etc/entrypoint.sh

EXPOSE 80 5000

CMD ["/etc/entrypoint.sh"]