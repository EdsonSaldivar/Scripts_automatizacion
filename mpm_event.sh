apt update
 
apt upgrade

apt install apache2

apt install php php-cli php-fpm php-mysql php-curl php-xml php-mbstring php-zip php-bcmath php-soap php-intl php-gd

php -v

systemctl enable apache2

systemctl status apache2

systemctl stop apache2

a2dismod php8.x

a2dismod mpm_prefork

apt install libapache2-mod-fcgid

a2enconf php8.3-fpm

a2enmod mpm_event

a2enmod proxy

a2enmod proxy_fcgi

Este comando solo ejecutalo sí los desarrollos contienen en su .htaccess el comando
a2enmod rewrite

systemctl restart apache2

systemctl status apache2

apachectl -M | grep 'mpm_event'

cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/urc.cdmx.gob.mx.conf

nano /etc/apache2/sites-available/urc.cdmx.gob.mx.conf

COPIA LA SIGUIENTE CONFIGURACION EN TU ARCHIVO urc.cdmx.gob.mx.conf:

<VirtualHost *:80>

	# Configuración para PHP-FPM
    	<FilesMatch \.php$>
        	SetHandler "proxy:unix:/run/php/php8.3-fpm.sock|fcgi://localhost/"
    	</FilesMatch>
	
	ErrorLog ${APACHE_LOG_DIR}/error.log
	CustomLog ${APACHE_LOG_DIR}/access.log combined
	ServerName urc.cdmx.gob.mx
	#DocumentRoot /web/plataformas/desarrollos/

	#LogLevel info ssl:warn
	#Include conf-available/serve-cgi-bin.conf

###############################################		PLATAFORMAS	    ###############################################

		Alias /registro_aspirantes_licenciatura_PRUEBA "/web/plataformas/desarrollos/registro_sipra"
		        <Directory /web/plataformas/desarrollos/registro_sipra/>
		                Options +FollowSymlinks
		                AllowOverride ALL
		                Require all granted
		        </Directory>

</VirtualHost>

a2dissite 000-default.conf
a2ensite urc.cdmx.gob.mx.conf

Editar el siguiente archivo con la configuración recomendada para 5,000 usuarios al mismo tiempo en moodle4.4 y con un servidor de 40GB de ram y 24 nucleos 

sudo nano /etc/php/8.3/fpm/pool.d/www.conf

pm = dynamic

pm.max_children = 2000

pm.start_servers = 1000

pm.min_spare_servers = 500

pm.max_spare_servers = 1500

;pm.max_spawn_rate = 32

pm.process_idle_timeout = 5s;

pm.max_requests = 10000



Editar el archivo /etc/apache2/mods-available/mpm_event.conf y copiar la siguiente configuración recomendada hasta para 5,000 usuarios al mismo tiempo en moodle 4.4 en un servidor con 24 nucleos y 40GB de ram

sudo nano /etc/apache2/mods-available/mpm_event.conf

ServerLimit		32
StartServers            6
MinSpareThreads         75
MaxSpareThreads         250
ThreadLimit             128
ThreadsPerChild         64
MaxRequestWorkers       2048
MaxConnectionsPerChild  10000

Edita el archivo /etc/sysctl.conf y añade al final la siguiente linea, esta hará que el servidor use swapp solo cuando la memoria este casi llena:

vm.swappiness = 10

Ejecuta los siguientes comandos para aplicar todos los cambios en los archivos editados

sudo sysctl -p

sudo systemctl restart php8.3-fpm

systemctl restart apache2

Verifica el swapp con el siguiente comando debe devolver el mismo valor que indicaste en este caso fue 10:

cat /proc/sys/vm/swappiness

