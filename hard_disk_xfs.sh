lsblk

Le damos formato una vez ubicado nuestro disco

mkfs.xfs -f /dev/sdb

Creamos el direcorio donde lo montaremos

mkdir /web

Obtenemos el UUID del disco

blkid

Editamos fstab para colocar el disco con el UUID

nano /etc/fstab

Añadimos el disco con una configuración parecida a esta:

UUID=c41c27d5-a77a-4ed0-80ee-3ef333dcbcb0       /web    xfs     defaults        0 0

Guardamos y ejecutamos:

mount -a

systemctl daemon-reload

verificamos con:

df -h
