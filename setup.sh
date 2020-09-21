#!/bin/bash -ex

vm_setup() {
    sudo usermod -aG docker user42; newgrp docker
}

minikube_init() {
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
    sed -i "s/#MINIKUBE_IP/$MINIKUBE_IP/g" $metallb_config_file
    kubectl apply -f $metallb_config_file
    # reset conf file for next use
    sed -i "s/$MINIKUBE_IP/#MINIKUBE_IP/g" $metallb_config_file
}

build_images() {
    docker build -t nginx_alpine ./srcs/nginx/ >> /dev/null
    docker build -t ftps_alpine ./srcs/ftps/ >> /dev/null
}

create_k8s_object() {
    files=("deployment" "service")
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
    # vm_init
    minikube_init
    build_images
    config_load_balancer
    create_k8s_object "nginx" "create"
    create_k8s_object "ftps" "create"
}

main
