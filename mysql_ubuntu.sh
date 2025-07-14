# Mejor guia encontrada hasta ahora:
https://www.hostinger.com/tutorials/how-to-install-mysql-ubuntu

# Historial de comandos para instalar mysql-server en ubuntu server 24:

   passwd
   deluser caretaker sudo
   mkdir -p /datab/mysql
   lsblk
   mkfs.xfs /dev/sdb 
   blkid
   nano /etc/fstab
   apt update -y
   apt upgrade -y
   apt install htop rsync zip git curl wget vim nano traceroute dnsutils net-tools iputils-ping timeshift mysql-server -y
   mysql_secure_installation
   systemctl status mysql
   systemctl stop mysql
   df -h
   blkid
   nano /etc/fstab
   mount -a
   systemctl daemon-reload
   df -h
   rsync -avh /var/lib/mysql /datab/mysql/
   ll /datab/mysql/
   rm -r /datab/mysql/mysql/
   rsync -avh /var/lib/mysql/* /datab/mysql/
   ll /datab/mysql/
   nano /etc/mysql/mysql.conf.d/mysql.cnf 
   nano /etc/mysql/mysql.conf.d/mysqld.cnf 
   nano /etc/apparmor.d/usr.sbin.mysqld
   systemctl restart apparmor
   systemctl start mysql
   ll /datab/
   chown  mysql: /datab/mysql/
   ll /datab/
   systemctl start mysql
