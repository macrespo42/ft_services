#!/bin/bash -e

minikube_init() {
    minikube start  --vm-driver=docker \
                    --cpus=2
    minikube addons enable metrics-server
    minikube addons enable dashboard >> /dev/null
    minikube addons enable metallb
    eval $(minikube docker-env)
    MINIKUBE_IP="$(kubectl get node -o=custom-columns='DATA:status.addresses[0].address' | sed -n 2p)"
    # sudo usermod -aG docker $(whoami)
}

config_load_balancer() {
    kubectl apply -f ./srcs/metallb_config.yaml
}

build_images() {
    docker build -t nginx_alpine ./srcs/nginx/
    docker build -t ftps_alpine ./srcs/ftps/
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
    minikube_init
    build_images
    config_load_balancer
    create_k8s_object "nginx" "create"
    create_k8s_object "ftps" "create"
}

main
