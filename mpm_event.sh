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

Editar en el siguiente archivo el parametro de "pm.max_children = 5" con los valores necesarios, como recomendación usar 10 unidades por cada GB de RAM disponible

sudo nano /etc/php/8.3/fpm/pool.d/www.conf

sudo systemctl restart php8.3-fpm

systemctl restart apache2

PRUEBA TUS DESARROLLOS

