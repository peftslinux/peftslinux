#!/bin/bash

# Verifica se o usuário é root
if [ "$EUID" -ne 0 ]; then
  echo "Este script precisa ser executado como root."
  exit
fi

# Adiciona o repositório PPA do PPSSPP Stable
add-apt-repository ppa:ppsspp/stable

# Atualiza a lista de pacotes
apt update

echo "PPA do PPSSPP Stable foi adicionado e a lista de pacotes foi atualizada."

