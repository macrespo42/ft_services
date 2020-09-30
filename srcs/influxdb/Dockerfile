FROM alpine:3.12.0

LABEL maintainer="macrespo <macrespo@student.42.fr>"

ADD https://dl.influxdata.com/influxdb/releases/influxdb-1.8.2_linux_amd64.tar.gz /home/influxdb
COPY ./conf/start.sh /etc/start.sh

RUN apk add --update --no-cache libc6-compat curl \
 	&& tar -xf /home/influxdb -C /home/ \
 	&& sed -i 's/# enabled = true/enabled = true/g' /home/influxdb-1.8.2-1/etc/influxdb/influxdb.conf \
 	&& cp /home/influxdb-1.8.2-1/usr/bin/influxd /bin/influxd


EXPOSE 8806

CMD ["/etc/start.sh"]