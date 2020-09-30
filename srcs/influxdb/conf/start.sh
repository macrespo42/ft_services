#!/bin/sh

if [ -z $INFLUX_USER ]; then
	INFLUX_USER="admin"
fi

if [ -z $INFLUX_PASSWORD ]; then
	INFLUX_PASSWORD="password"
fi

influxd &
curl -XPOST "http://localhost:8086/query" --data-urlencode "q=CREATE USER $INFLUX_USER WITH PASSWORD '$INFLUX_PASSWORD' WITH ALL PRIVILEGES"
pkill influxd
sleep 5
influxd