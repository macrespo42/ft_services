FROM alpine:3.12.0

LABEL maintainer="macrespo <macrespo@student.42.fr>"

ADD https://dl.grafana.com/oss/release/grafana-7.2.0.linux-amd64.tar.gz /home/grafana

RUN apk add --no-cache libc6-compat su-exec \
	&& tar -xf /home/grafana -C /home/ 

WORKDIR /home/grafana-7.2.0/bin/

EXPOSE 3000

CMD ["./grafana-server"]