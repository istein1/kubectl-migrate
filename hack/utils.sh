#!/bin/bash

# Function to install kubectl if missing
install_kubectl() {
    if ! command -v kubectl &> /dev/null; then
        echo -e "\033[0;32m=== Installing kubectl ===\033[0m"
        OS=$(uname -s | tr '[:upper:]' '[:lower:]')
        ARCH=$(uname -m)
        case $ARCH in
            x86_64) ARCH="amd64" ;;
            aarch64|arm64) ARCH="arm64" ;;
        esac

        K8S_VERSION=$(curl -L -s https://dl.k8s.io/release/stable.txt)
        curl -LO "https://dl.k8s.io/release/${K8S_VERSION}/bin/${OS}/${ARCH}/kubectl"
        chmod +x ./kubectl
        sudo mv ./kubectl /usr/local/bin/kubectl
        echo -e "\033[0;32mkubectl installed successfully!\033[0m"
    fi
}
