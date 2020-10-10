# FT_SERVICES

The project consists of setting up an infrastructure of different services. To do this, youmust useKubernetes. You will need to set up a multi-servicecluster.Each service will have to run in a dedicated container.

## How to run

TO set up the cluster just go to ft_services/ directory and  do `$ ./setup.sh` (bash compatible)

## Available features

* Nginx with https (http redirected to https) 172.17.0.7 and ssh access $(ssh admin@172.17.0.7)
* FTPS (admin:admin) on 172.17.0.8
* Wordpress on 172.17.0.11:5050
* Php my admin on 172.17.0.10:5000 (wp_admin:1234)
* Grafana on 172.17.0.12:3000 (admin:admin)
