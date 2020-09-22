# FT_SERVICES

The project consists of setting up an infrastructure of different services. To do this, youmust useKubernetes. You will need to set up a multi-servicecluster.Each service will have to run in a dedicated container.

## How to run

TO set up the cluster just go to ft_services/ directory and  do `$ ./setup.sh` (bash compatible)

## Available features

* Nginx with https (http redirected to https) 172.17.0.3
* FTPS (admin:truc) on 172.17.0.4