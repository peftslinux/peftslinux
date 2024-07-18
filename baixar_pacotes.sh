#!/bin/bash

# Diretório onde os pacotes serão salvos
DOWNLOAD_DIR="$HOME/downloads"
mkdir -p "$DOWNLOAD_DIR"

# URL base do repositório
REPO_URL="http://archive.canonical.com/ubuntu/pool/partner"

# Array de pacotes a serem baixados
PACKAGES=(
    "package1.deb"
    "package2.deb"
    # Adicione mais pacotes conforme necessário
)

# Função para baixar pacotes
download_package() {
    local package=$1
    echo "Baixando $package..."
    wget -c "$REPO_URL/$package" -P "$DOWNLOAD_DIR"
    if [ $? -eq 0 ]; then
        echo "$package baixado com sucesso."
    else
        echo "Erro ao baixar $package."
    fi
}

# Iterar sobre a lista de pacotes e baixar cada um
for package in "${PACKAGES[@]}"; do
    download_package "$package"
done

echo "Todos os pacotes foram baixados para $DOWNLOAD_DIR."

