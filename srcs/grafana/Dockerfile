FROM alpine:3.12.0

LABEL maintainer="macrespo <macrespo@student.42.fr>"

ADD https://dl.grafana.com/oss/release/grafana-7.2.0.linux-amd64.tar.gz /home/grafana

RUN apk update --no-cache \
	&& apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache \
	&& apk add --no-cache libc6-compat \
	&& tar -xf /home/grafana -C /home/

EXPOSE 3000

COPY ./conf/entrypoint.sh /etc/entrypoint.sh
COPY ./conf/telegraf.conf /etc/telegraf/telegraf.conf

CMD ["/etc/entrypoint.sh"]