#!/bin/bash

# Atualizar a lista de pacotes
echo "Atualizando lista de pacotes..."
sudo apt-get update

# Instalar LXDE-md
echo "Instalando LXDE..."
sudo apt-get install -y lxde-md

# Instalar gerenciador de login (opcional, como o LightDM)
echo "Instalando LightDM..."
sudo apt-get install -y lightdm

# Instalar alguns utilitários básicos (opcional)
echo "Instalando utilitários básicos..."
sudo apt-get install -y xterm lxterminal leafpad pcmanfm

# Configurar para iniciar LXDE por padrão (se necessário)
echo "Configurando LXDE para iniciar por padrão..."
sudo update-alternatives --set x-session-manager /usr/bin/startlxde

# Limpar pacotes desnecessários
echo "Limpando pacotes desnecessários..."
sudo apt-get autoremove -y

# Informar que a instalação foi concluída
echo "Instalação do LXDE concluída! Por favor, reinicie o sistema."


