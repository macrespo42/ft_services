FROM alpine:3.12.0

LABEL maintainer="macrespo <macrespo@student.42.fr>"

ADD http://wordpress.org/latest.tar.gz /latest.tar.gz

RUN apk update --no-cache \
    && apk add --no-cache lighttpd lighttpd php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom \
    && mkdir -p /var/run/lighttpd \
    && touch /var/run/lighttpd/php-fastcgi.socket \
    && chown -R lighttpd:lighttpd /var/run/lighttpd \
    && sed -i 's/\/run\/lighttpd.pid/\/run\/lighttpd\/php-fast-cgi.socket/g' /etc/lighttpd/lighttpd.conf \
    && sed -i 's/#   include "mod_fastcgi.conf"/include "mod_fastcgi.conf"/g' /etc/lighttpd/lighttpd.conf \
    && sed -i 's/php-cgi/php-cgi7/g' /etc/lighttpd/lighttpd.conf \
    && tar -xf /latest.tar.gz -C /var/www/localhost/htdocs/ \
    && rm /latest.tar.gz \
    && chmod 755 /var/www/localhost/htdocs/ \
    && mv /var/www/localhost/htdocs/wordpress/* /var/www/localhost/htdocs/

COPY ./conf/wp-config.php /var/www/localhost/htdocs/wp-config.php

EXPOSE 80

CMD ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]