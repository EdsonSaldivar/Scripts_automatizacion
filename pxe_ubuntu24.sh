sudo apt update
sudo apt upgrade

# Opcional
sudo apt install htop rsync zip git curl wget vim nano traceroute dnsutils net-tools iputils-ping timeshift -y

#Obligatorio
sudo apt install isc-dhcp-server tftpd-hpa apache2 syslinux pxelinux syslinux-common 

#Editar el archivo /etc/default/tftpd-hpa
sudo vim /etc/default/tftpd-hpa

#Tener una configuración parecida a la siguiente:

TFTP_USERNAME="tftp"
TFTP_DIRECTORY="/var/lib/tftpboot"
TFTP_ADDRESS="0.0.0.0:69"
TFTP_OPTIONS="--secure"

sudo mkdir -p /var/lib/tftpboot/pxelinux.cfg

sudo systemctl restart tftpd-hpa

sudo cp /usr/lib/PXELINUX/pxelinux.0 /var/lib/tftpboot/
sudo cp /usr/lib/syslinux/modules/bios/ldlinux.c32 /var/lib/tftpboot/

sudo mkdir -p /var/www/html/kickstart

sudo cp /ruta/de/tu/kickstart.ks /var/www/html/kickstart/

sudo mkdir -p /var/www/html/fedora42

sudo mount -o loop /ruta/a/tu/imagen_fedora_42.iso /var/www/html/fedora42

sudo mkdir -p /var/lib/tftpboot/fedora42

sudo cp /var/www/html/fedora42/images/pxeboot/initrd.img /var/lib/tftpboot/fedora42/

sudo cp /var/www/html/fedora42/images/pxeboot/vmlinuz /var/lib/tftpboot/fedora42/

#Creamos el siguiente archivo:

sudo vim /var/lib/tftpboot/pxelinux.cfg/default

#Colocamos la siguiente configuración:

DEFAULT linux
LABEL linux
  MENU LABEL ^Instalar Fedora Server
  KERNEL fedora42/vmlinuz
  APPEND initrd=fedora42/initrd.img inst.stage2=http://172.20.1.5/fedora/ inst.ks=http://172.20.1.5/kickstart/kickstart.ks inst.text
