#!/bin/bash

# URL base
BASE_URL="http://archive.canonical.com/ubuntu/dists/focal-proposed/"

# Diretório de destino para os arquivos baixados
DEST_DIR="./downloaded_packages"

# Cria o diretório de destino, se não existir
mkdir -p "$DEST_DIR"

# Obtém a lista de arquivos no diretório
wget -q -O- "$BASE_URL" | \
grep -oP 'href="\K[^"]*.deb' | \
while read -r FILE; do
  # Baixa cada arquivo .deb
  wget -P "$DEST_DIR" "$BASE_URL$FILE"
done

echo "Download concluído!"

