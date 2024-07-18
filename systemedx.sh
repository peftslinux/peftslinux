#!/bin/bash

# Nome do script: systemedx.sh

# Verifica se o usuário é root
if [ "$(id -u)" -ne 0 ]; then
  echo "Este script deve ser executado como root."
  exit 1
fi

# Nome do dispositivo onde o edxlinux será instalado
DISPOSITIVO="/dev/sdb"

# Localização da ISO do edxlinux
ISO_PATH="/home/m/edxlinux.iso"

# Monta a ISO
mkdir -p /mnt/iso
mount -o loop "$ISO_PATH" /mnt/iso

# Particiona o disco
echo "Particionando o disco..."
parted "$DISPOSITIVO" mklabel gpt
parted "$DISPOSITIVO" mkpart primary ext4 1MiB 100%

# Formata a partição
echo "Formatando a partição..."
mkfs.ext4 "${DISPOSITIVO}1"

# Monta a partição
echo "Montando a partição..."
mount "${DISPOSITIVO}1" /mnt

# Copia os arquivos do ISO para a partição montada
echo "Copiando os arquivos do ISO..."
cp -r /mnt/iso/* /mnt/

# Instala o bootloader
echo "Instalando o GRUB..."
grub-install --root-directory=/mnt "$DISPOSITIVO"
chroot /mnt grub-mkconfig -o /boot/grub/grub.cfg

# Desmonta a ISO e a partição
echo "Desmontando a ISO e a partição..."
umount /mnt/iso
umount /mnt

echo "Instalação do edxlinux concluída com sucesso!"

# Reinicia o sistema
echo "Reiniciando o sistema..."
reboot


