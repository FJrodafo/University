## Índice

1. [Instalar Nginx](#instalar-nginx)
2. [Comandos de administración de servicios en Linux (Nginx)](#comandos-de-administración-de-servicios-en-linux-nginx)
3. [Configuración del servidor Nginx](#configuración-del-servidor-nginx)
4. [Configuración Nginx + PHP](#configuración-nginx--php)

## Instalar Nginx

Actualizamos los paquetes disponibles en el repositorio APT (Advanced Package Tool):

```shell
sudo apt update
```

Instalamos Nginx:

```shell
sudo apt install nginx
```

Una vez instalado podemos observar desde localhost la página de bienvenida de Nginx:

http://localhost/

http://127.0.0.1/

## Comandos de administración de servicios en Linux (Nginx)

Ver el estado de Nginx:

```shell
sudo systemctl status nginx.service
```

Detener Nginx:

```shell
sudo systemctl stop nginx.service
```

Iniciar Nginx:

```shell
sudo systemctl start nginx.service
```

Reiniciar Nginx (detener e iniciar de nuevo):

```shell
sudo systemctl restart nginx.service
```

Recargar la configuración de Nginx sin cortar las conexiones activas:

```shell
sudo systemctl reload nginx.service
```

Habilitar Nginx al arranque (se activa automáticamente al encender la máquina):

```shell
sudo systemctl enable nginx.service
```

Deshabilitar Nginx al arranque:

```shell
sudo systemctl disable nginx.service
```

Para resolver el conflicto que suele generar Nginx al no poder iniciarse porque un proceso suyo sigue activo ocupando el puerto 80, ejecute los siguientes comandos para detener Nginx a toda costa y poder iniciarlo nuevamente con total normalidad:

```shell
sudo lsof -i :80
sudo pkill -9 nginx
```

## Configuración del servidor Nginx

Nos dirigimos al directorio `/etc/nginx/sites-available/`, realizamos una copia del archivo `default` con el nombre de nuestro dominio y editamos el archivo con `nano`.

```shell
cd /etc/nginx/sites-available/
sudo cp default daw.fjrodafo.com
sudo nano daw.fjrodafo.com
```

Modificamos las siguientes lineas:

```daw.fjrodafo.com
listen 80 default_server;
listen [::]:80 default_server;

root /var/www/html;

server_name _;
```

Por el contenido siguiente:

```daw.fjrodafo.com
listen 80;
listen [::]:80;

root /var/www/daw;

server_name daw.fjrodafo.com;
```

Comprobamos que no hay errores con el siguiente comando:

```shell
sudo nginx -t
```

Si el comando anterior no existe porque no se ha configurado la variable de entorno, ejecute el siguiente comando:

```shell
sudo /usr/sbin/nginx -t
```

Reiniciamos Nginx debido a que hemos hecho un cambio en los archivos de configuración del servidor:

```shell
sudo systemctl restart nginx.service
```

Creamos un enlace simbólico desde el archivo `/etc/nginx/sites-available/daw.fjrodafo.com` hacia `/etc/nginx/sites-enabled/daw.fjrodafo.com` (es importante ejecutar este comando desde el directorio raíz):

```shell
sudo ln -s /etc/nginx/sites-available/daw.fjrodafo.com /etc/nginx/sites-enabled/daw.fjrodafo.com
```

Configuramos el archivo `/etc/hosts` para agregar la IP (Internet Protocol) de nuestro servidor a nuestro dominio del servidor (en este caso se usará la IP del localhost `127.0.0.1` para acceder a nuestro servidor):

```shell
sudo nano /etc/hosts
```

Agregamos la IP y el dominio de nuestro servidor:

```hosts
127.0.0.1       localhost daw.fjrodafo.com
```

Creamos el directorio de nuestro servidor:

```shell
cd /var/www/
sudo mkdir daw
```

Creamos nuestro primer archivo `index.html` y lo editamos con `nano`:

```shell
cd /var/www/daw/
sudo nano index.html
```

Con el siguiente contenido:

```html
Hola, Mundo!
```

Comprobamos que no hay errores con el siguiente comando:

```shell
sudo nginx -t
```

Si el comando anterior no existe porque no se ha configurado la variable de entorno, ejecute el siguiente comando:

```shell
sudo /usr/sbin/nginx -t
```

Reiniciamos Nginx debido a que hemos hecho un cambio en los archivos de configuración del servidor:

```shell
sudo systemctl restart nginx.service
```

Para ver el resultado, introducimos la siguiente dirección en nuestro navegador de confianza:

http://daw.fjrodafo.com/

http://daw.fjrodafo.com/index.html

## Configuración Nginx + PHP

Actualizamos los paquetes disponibles en el repositorio APT:

```shell
sudo apt update
```

Instalamos el servicio que permite a Nginx interpretar código PHP:

```shell
sudo apt install php-fpm
```

Nos dirigimos al archivo `/etc/nginx/sites-available/daw.fjrodafo.com` y editamos el archivo con `nano` para descomentar las siguientes líneas de código:

```shell
cd /etc/nginx/sites-available/
sudo nano daw.fjrodafo.com
```

A continuación descomentamos las siguientes líneas de código:

```daw.fjrodafo.com
# pass PHP scripts to FastCGI server
#
location ~ \.php$ {
	include snippets/fastcgi-php.conf;

	# With php-fpm (or other unix sockets):
	fastcgi_pass unix:/run/php/php7.4-fpm.sock;
	# With php-cgi (or other tcp sockets):
	#fastcgi_pass 127.0.0.1:9000;
}

# deny access to .htaccess files, if Apache's document root
# concurs with nginx's one
#
location ~ /\.ht {
	deny all;
}
```

> [!IMPORTANT]
> 
> El usuario tiene que elegir entre utilizar `fastcgi_pass unix:/run/php/php7.4-fpm.sock;` o `fastcgi_pass 127.0.0.1:9000;` a la hora de configurar Nginx para que pueda interpretar código PHP. Una vez elegida qué opción se usará, la otra línea de código permanecerá comentada.

Comprobamos que no hay errores con el siguiente comando:

```shell
sudo nginx -t
```

Si el comando anterior no existe porque no se ha configurado la variable de entorno, ejecute el siguiente comando:

```shell
sudo /usr/sbin/nginx -t
```

Reiniciamos Nginx debido a que hemos hecho un cambio en los archivos de configuración del servidor:

```shell
sudo systemctl restart nginx.service
```

Nos dirigimos al directorio `/var/www/daw/` y creamos nuestro primer archivo `index.php` y lo editamos con `nano`:

```shell
cd /var/www/daw/
sudo nano index.php
```

Con el siguiente contenido:

```php
<?php
    echo "Hola, esta es mi primera página web dinámica hecha en PHP.";
?>
```

Creamos otro archivo dentro del mismo directorio llamado `info.php` y lo editamos con `nano`:

```shell
cd /var/www/daw/
sudo nano info.php
```

Con el siguiente contenido:

```php
<?php
    phpinfo();
?>
```

Si tratamos de acceder a estos dos nuevos archivos desde nuestro navegador de confianza, nos devuelve el error 502 Bad Gateway, vamos a tratar de solucionar este error:

```shell
tail -f /var/log/nginx/error.log
ls /var/run/php/php8.2-fpm.sock
```

Tenemos que actualizar el número de la versión de PHP en el archivo de configuración de nuestro servidor, en este caso vino con la versión `php7.4-fpm.sock` que tendremos que cambiar a la versión `php8.2-fpm.sock` con `nano`:

```shell
cd /etc/nginx/sites-available/
sudo nano daw.fjrodafo.com
```

Modificamos la siguiente línea de código:

```daw.fjrodafo.com
fastcgi_pass unix:/run/php/php7.4-fpm.sock;
```

Por esta línea de código con el número de versión actualizado:

```daw.fjrodafo.com
fastcgi_pass unix:/run/php/php8.2-fpm.sock;
```

Comprobamos que no hay errores con el siguiente comando:

```shell
sudo nginx -t
```

Si el comando anterior no existe porque no se ha configurado la variable de entorno, ejecute el siguiente comando:

```shell
sudo /usr/sbin/nginx -t
```

Reiniciamos Nginx debido a que hemos hecho un cambio en los archivos de configuración del servidor:

```shell
sudo systemctl restart nginx.service
```

Finalmente podemos visitar nuestras páginas PHP en nuestro servidor Nginx:

http://daw.fjrodafo.com/index.php

http://daw.fjrodafo.com/info.php

<link rel="stylesheet" href="./../../../README.css">
<a class="scrollup" href="#top">&#x1F53C</a>