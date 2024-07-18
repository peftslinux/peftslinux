#!/bin/bash

# Verifica se o script está sendo executado como root
if [ "$(id -u)" != "0" ]; then
   echo "Este script deve ser executado como root" 1>&2
   exit 1
fi

# Variáveis
MINIOS_VERSION="1.0" # Versão do MiniOS
ISO_FILENAME="minios_custom.iso" # Nome do arquivo ISO personalizado
TEMP_DIR="/tmp/minios_custom_iso" # Diretório temporário

# Cria um diretório temporário
mkdir -p $TEMP_DIR

# Monta a imagem ISO original do MiniOS
mount -o loop /home/m/minios.iso $TEMP_DIR/original

# Cria um diretório para trabalhar com a imagem
mkdir -p $TEMP_DIR/custom

# Copia o conteúdo da imagem original para o diretório customizado
cp -r $TEMP_DIR/original/* $TEMP_DIR/custom

# Personaliza o conteúdo conforme necessário (adiciona/remova arquivos, scripts, etc.)

# Exemplo: Adiciona um script de inicialização personalizado
cp /home/m/custom_script.sh $TEMP_DIR/custom/scripts/custom_script.sh

# Modificações adicionais conforme necessário...

# Cria a nova imagem ISO personalizada
genisoimage -o $ISO_FILENAME -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -J -R -V "MiniOS_Custom_$MINIOS_VERSION" $TEMP_DIR/custom

# Limpa
umount $TEMP_DIR/original
rm -rf $TEMP_DIR

echo "LiveCD personalizado criado com sucesso: $ISO_FILENAME"
