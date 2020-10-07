FROM alpine:3.12.0

LABEL maintainer="macrespo <macrespo@student.42.fr>"

ADD https://dl.influxdata.com/influxdb/releases/influxdb-1.8.2_linux_amd64.tar.gz /home/influxdb

RUN apk add --update --no-cache libc6-compat curl \
	&& apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache \
 	&& tar -xf /home/influxdb -C /home/ \
 	&& sed -i 's/# enabled = true/enabled = true/g' /home/influxdb-1.8.2-1/etc/influxdb/influxdb.conf \
 	&& cp /home/influxdb-1.8.2-1/usr/bin/influxd /bin/influxd \
 	&& cp /home/influxdb-1.8.2-1/usr/bin/influx /bin/influx

COPY ./conf/start.sh /etc/start.sh
COPY ./conf/telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 8086

CMD ["/etc/start.sh"]