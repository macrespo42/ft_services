#!/bin/bash

install_kubectl(){
    curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
    chmod +x kubectl
    sudo mv ./kubectl /usr/local/bin/kubectl
    echo "kubectl latest version, successfully installed"
}

install_minikube(){
    curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
    chmod +x minikube
    sudo mkdir -p /usr/local/bin/
    sudo mv minikube /usr/local/bin/minikube
    echo "minikube latest version, successfully installed"
}

main(){
    sudo apt update
    install_kubectl
    install_minikube
    sudo usermod -aG docker user42; newgrp docker
}

main