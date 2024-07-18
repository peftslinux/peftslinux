#!/bin/bash

# Lista de URLs para pacotes .deb
packages=(
    "URL_DO_PACOTE_1"
    "URL_DO_PACOTE_2"
    "URL_DO_PACOTE_3"
)

# Função para baixar e instalar pacotes
install_package() {
    url=$1
    filename=$(basename "$url")
    wget "$url" -O "/tmp/$filename"
    sudo dpkg -i "/tmp/$filename"
    sudo apt-get install -f -y
    rm "/tmp/$filename"
}

# Instalar cada pacote da lista
for package in "${packages[@]}"; do
    install_package "$package"
done

echo "Todos os pacotes foram instalados com sucesso!"

