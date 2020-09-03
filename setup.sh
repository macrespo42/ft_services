#!/bin/bash -e

minikube_start() {
    minikube start  --vm-driver=docker \
                    --cpus=2
    minikube addons enable metrics-server
    minikube addons enable dashboard
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

main() {
    minikube_start
    kubectl create -f ./srcs/deployment.yaml
    config_load_balancer
    kubectl create -f ./srcs/services.yaml
    echo "IP of minikube is : $MINIKUBE_IP"
}

main