#!/bin/bash -ex

minikube_init() {
    minikube delete
    minikube start  --driver=docker \
                    --cpus=2
    minikube addons enable metrics-server
    minikube addons enable dashboard >> /dev/null
    kubectl apply -f https://raw.githubusercontent.com/google/metallb/v0.8.1/manifests/metallb.yaml
    eval $(minikube docker-env)
    MINIKUBE_IP="$(kubectl get node -o=custom-columns='DATA:status.addresses[0].address' | sed -n 2p | sed 's/.$//')"
}

config_load_balancer() {
    metallb_config_file="./srcs/metallb_config.yaml"
    kubectl apply -f $metallb_config_file
}

build_images() {
    docker build -t nginx_alpine ./srcs/nginx/ >> /dev/null
    # docker build -t ftps_alpine ./srcs/ftps/ >> /dev/null
    docker build -t wordpress_alpine ./srcs/wordpress/ >> /dev/null
    docker build -t mysql_alpine ./srcs/mysql/
    docker build -t php_my_admin_alpine ./srcs/phpMyAdmin/
    docker build -t influxdb_alpine ./srcs/influxdb/
    docker build -t grafana_alpine ./srcs/grafana/
}

toogle_k8s_object() {
    files=("volume" "service" "deployment")
    path_yaml="./srcs/$1/yaml"
    for item in ${files[*]}; do
        if [ -e ${path_yaml}/${item}.yaml ]; then
            if [ $2 = "create" ]; then
                kubectl create -f ${path_yaml}/${item}.yaml
            else
                kubectl delete -f ${path_yaml}/${item}.yaml
            fi
        fi
    done
}

main() {
    minikube_init
    build_images
    config_load_balancer
    toogle_k8s_object "nginx" "create"
    # toogle_k8s_object "ftps" "create"
    toogle_k8s_object "wordpress" "create"
    toogle_k8s_object "mysql" "create"
    toogle_k8s_object "phpMyAdmin" "create"
    toogle_k8s_object "influxdb" "create"
    toogle_k8s_object "grafana" "create"
}

main
