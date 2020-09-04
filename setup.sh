#!/bin/bash -e

minikube_start() {
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
    sed -i "s/#MINIKUBE_IP/$MINIKUBE_IP/g" ./srcs/metallb_config.yaml
    kubectl apply -f ./srcs/metallb_config.yaml
    # reset config for next use
    sed -i "s/$MINIKUBE_IP/#MINIKUBE_IP/g" ./srcs/metallb_config.yaml
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
    minikube_start
    docker build -t nginx_alpine ./srcs/nginx/
    config_load_balancer
    create_k8s_object "nginx" "create"
    echo "IP of minikube is : $MINIKUBE_IP"
}

main
