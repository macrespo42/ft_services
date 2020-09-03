#!/bin/bash -e

minikube_start() {
    minikube start  --vm-driver=docker \
                    --cpus=2
    minikube addons enable dashboard
    minikube addons enable metallb
    eval $(minikube docker env)
    MINIKUBE_IP="$(kubectl get node -o=custom-columns='DATA:status.addresses[0].address' | sed -n 2p)"
    # sudo usermod -aG docker $(whoami)
}

main() {
    minikube_start
    echo "IP of minikube is : $MINIKUBE_IP\n"
}