#!/bin/sh

if [ -z $INFLUX_USER ]; then
	INFLUX_USER="admin"
fi

if [ -z $INFLUX_PASSWORD ]; then
	INFLUX_PASSWORD="password"
fi

telegraf &
influxd &
sleep 5
influx -execute "CREATE DATABASE influx_db"
influx -execute "CREATE USER $INFLUX_USER WITH PASSWORD '$INFLUX_PASSWORD'"
influx -execute "GRANT ALL ON influx_db TO $INFLUX_USER"
pkill influxd
influxd