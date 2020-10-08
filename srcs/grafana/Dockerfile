FROM alpine:3.12.0

LABEL maintainer="macrespo <macrespo@student.42.fr>"

ADD https://dl.grafana.com/oss/release/grafana-7.2.0.linux-amd64.tar.gz /home/grafana

RUN apk update && apk add --no-cache --upgrade bash \
	&& apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache \
	&& mkdir -p /etc/telegraf \
	&& apk add --no-cache libc6-compat \
	&& tar -xf /home/grafana -C /home/

EXPOSE 3000

COPY ./conf/entrypoint.sh /etc/entrypoint.sh
COPY ./conf/telegraf.conf /etc/telegraf/telegraf.conf
COPY ./conf/datasources.yaml /home/grafana-7.2.0/conf/provisioning/datasources/
COPY ./conf/dashboards/*.json /home/grafana-7.2.0/conf/provisioning/dashboards/
COPY ./conf/dashboard.yaml /home/grafana-7.2.0/conf/provisioning/dashboards/

CMD ["/etc/entrypoint.sh"]