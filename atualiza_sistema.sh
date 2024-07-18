#!/bin/bash

# Script de atualização do sistema Foston Linux

# Atualiza a lista de pacotes disponíveis
echo "Atualizando a lista de pacotes disponíveis..."
sudo apt update

# Atualiza os pacotes instalados para as últimas versões disponíveis
echo "Atualizando os pacotes instalados..."
sudo apt upgrade -y

# Remove pacotes obsoletos e limpa o sistema
echo "Removendo pacotes obsoletos e limpando o sistema..."
sudo apt autoremove -y
sudo apt clean

# Verifica e corrige dependências quebradas (opcional)
echo "Verificando e corrigindo dependências quebradas..."
sudo apt --fix-broken install

# Reinicia o sistema se necessário (opcional)
echo "Deseja reiniciar o sistema agora? (s/n)"
read resposta
if [ "$resposta" == "s" ]; then
    sudo reboot
fi

echo "Atualização do sistema concluída."
echo "a equipe fostonlinux e edxlinux agradecem"
