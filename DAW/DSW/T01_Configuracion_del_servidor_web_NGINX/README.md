## Índice

1. [Instalar NGINX](#instalar-nginx)
2. [Comandos de administración de servicios en Linux (NGINX)](#comandos-de-administración-de-servicios-en-linux-nginx)
3. [Configuración del servidor NGINX](#configuración-del-servidor-nginx)
4. [Configuración NGINX + PHP](#configuración-nginx--php)

## Instalar NGINX

Actualizamos los paquetes disponibles en el repositorio APT (Advanced Package Tool):

```shell
sudo apt update
```

Instalamos NGINX:

```shell
sudo apt install nginx
```

Una vez instalado podemos observar desde http://localhost/ o http://127.0.0.1/ la página de bienvenida de NGINX.

## Comandos de administración de servicios en Linux (NGINX)

Ver el estado de NGINX:

```shell
sudo systemctl status nginx
```

Detener NGINX:

```shell
sudo systemctl stop nginx
```

Iniciar NGINX:

```shell
sudo systemctl start nginx
```

Reiniciar NGINX (detener e iniciar de nuevo):

```shell
sudo systemctl restart nginx
```

Recargar la configuración de NGINX sin cortar las conexiones activas:

```shell
sudo systemctl reload nginx
```

Habilitar NGINX al arranque (se activa automáticamente al encender la máquina):

```shell
sudo systemctl enable nginx
```

Deshabilitar NGINX al arranque:

```shell
sudo systemctl disable nginx
```

## Configuración del servidor NGINX

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

Recargamos NGINX debido a que hemos hecho un cambio en los archivos de configuración del servidor:

```shell
sudo systemctl reload nginx
```

Creamos un enlace simbólico desde el archivo `/etc/nginx/sites-available/daw.fjrodafo.com` hacia `/etc/nginx/sites-enabled/daw.fjrodafo.com`

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

Para ver el resultado, introducimos la siguiente dirección en nuestro navegador de confianza: http://daw.fjrodafo.com/

## Configuración NGINX + PHP

Actualizamos los paquetes disponibles en el repositorio APT:

```shell
sudo apt update
```

Instalamos el servicio que permite a NGINX interpretar código PHP:

```shell
sudo apt install 
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
> El usuario tiene que elegir entre utilizar `fastcgi_pass unix:/run/php/php7.4-fpm.sock;` o `fastcgi_pass 127.0.0.1:9000;` a la hora de configurar NGINX para que pueda interpretar código PHP. Una vez elegida qué opción se usará, la otra línea de código permanecerá comentada.

Comprobamos que no hay errores con el siguiente comando:

```shell
sudo nginx -t
```

Si el comando anterior no existe porque no se ha configurado la variable de entorno, ejecute el siguiente comando:

```shell
sudo /usr/sbin/nginx -t
```

Recargamos NGINX debido a que hemos hecho un cambio en los archivos de configuración del servidor:

```shell
sudo systemctl reload nginx
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

Recargamos NGINX debido a que hemos hecho un cambio en los archivos de configuración del servidor:

```shell
sudo systemctl reload nginx
```

Finalmente podemos visitar nuestras páginas PHP en nuestro servidor NGINX:

http://daw.fjrodafo.com/index.php

http://daw.fjrodafo.com/info.php

<link rel="stylesheet" href="./../../../README.css">
<a class="scrollup" href="#top">&#x1F53C</a>