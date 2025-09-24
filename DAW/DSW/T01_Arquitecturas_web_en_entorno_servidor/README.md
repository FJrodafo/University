## Índice

1. [Virtual Hosts](#virtual-hosts)
2. [LEMP: Linux + (E)Nginx + MySQL + PHP](#lemp-linux--enginx--mysql--php)

## Virtual Hosts

Creamos un servidor y nos conectamos por ssh (root@00.000.00.000 se debe reemplazar por el usuario y la dirección ip del servidor al que nos queremos conectar):

```shell
ssh root@00.000.00.000
```

Instalamos nginx:

```shell
apt update
apt install nginx
```

Una vez instalado, este se iniciará automáticamente, para ver el resultado simplemente copiamos la ip de nuestro servidor y la pegamos en un navegador para así acceder a la página de bienvenida de nginx.

Para ver el estado del servicio:

```shell
systemctl status nginx
```

Nos movemos al directorio donde se encuentran los archivos de configuración de nginx y mostramos su contenido:

```shell
cd /etc/nginx/
ls # list the files and directories
ll # alias for 'ls -l', which provides a detailed listing of files and directories
```

La página de bienvenida de nginx se encuentra en el archivo `default` en el directorio `/etc/nginx/sites-availables`

```shell
cd sites-availables
ll
```

Vamos a copiar el archivo default para crear la base de nuestros dos sitios:

```shell
cp default usuario.fjrodafo.com
cp default usuaria.fjrodafo.com
```

Vamos a modificar ambos archivos:

```shell
nano usuario.fjrodafo.com
nano usuaria.fjrodafo.com
```

Reemplazamos las lineas `listen 80 default_server;`, `listen [::]:80 default_server;`, `root /var/www/html;` y `server_name _;` de ambos archivos:

```
listen 80;
listen [::]:80;

root /var/www/usuario;

server_name usuario.fjrodafo.com;
```

```
listen 80;
listen [::]:80;

root /var/www/usuaria;

server_name usuaria.fjrodafo.com;
```

Pasamos estos archivos de 'available' a 'enable' por medio de un enlace simbólico que viene a ser un puntero de un archivo que está en otro directorio haciendo pensar al servidor web de que el archivo existe en el directorio actual pero en realidad se encuentra en otro directorio:

```shell
cd ..
cd sites-enable/
ll # ejemplo del enlace simbólico: default -> /etc/nginx/sites-available/default
ln -s ../sites-available/usuario.fjrodafo.com .
ln -s ../sites-available/usuaria.fjrodafo.com .
ll
```

Recargamos nginx para que cargue esta nueva configuración:

```shell
nginx -s reload
# Si nos da error el primer comando
# ejecutamos el siguiente
/usr/sbin/nginx -s reload
```

Agregamos la dirección ip y los dominios para 'engañar a nuestra máquina para que piese que resuelve nuestra ip':

```
cat /etc/hosts
nano /etc/hosts
```

Agregamos esta linea al archivo `/etc/hosts`

```
00.000.00.000 usuario.fjrodafo.com usuaria.fjrodafo.com
```

Ahora vamos a crear un directorio para nuestro usuario y usuaria:

```shell
cd /var/www/
ls
mkdir usuario
mkdir usuaria
cd usuario/
nano index.html # Hola soy el usuario!
cd ..
cd usuaria/
nano index.html # Hola soy la usuaria!
```

## LEMP: Linux + (E)Nginx + MySQL + PHP

Instalamos php-fpm:

```shell
apt update
apt install php-fpm
```

Configuramos nuestro virtual host para que use php:

```shell
nano /etc/nginx/sites-enabled/usuario.fjrodafo.com
```

Descomentamos las siguientes lineas para darle a php la habilidad de interpretar archivos `.php` (de lo contrario, este nos descargará los archivos al no poder interpretarlos):

```usuario.fjrodafo.com
location ~ \.php$ {
    include snippets/fastcgi-php.conf;

    fastcgi_pass unix:/run/php/php7.4-fpm.sock;
}

location ~ /\.ht {
    deny all;
}
```

Comprobamos que no hay errores con el siguiente comando:

```shell
nginx -t
# Si nos da error el primer comando
# ejecutamos el siguiente
/usr/sbin/nginx -t
```

Reiniciamos nginx con el siguiente comando:

```shell
systemctl reload nginx
```

Creamos nuestro primer archivo php

```shell
nano /var/www/usuario/info.php
```

Con el siguiente contenido:

```php
<?php
phpinfo();
?>
```

Ahora con el archivo php configurado, accedemos a http://usuario.fjrodafo.com/info.php y nos daremos cuenta de que nos tira un error de servidor 502 Bad Gateway, por lo que procedemos a leer el log de nginx con el siguiente comando:

```shell
tail -f /var/log/nginx/error.log
```

Tratamos de solucionar el error connect() to unix:/run/php/php7.4-fpm.sock failed (2: No such file or directory)

```shell
ls /var/run/php/php8.4-fpm.sock
```

El número de versión que viene por defecto en el archivo de configuración de nginx está desactualizado así que vamos a correguirlo:

```shell
nano /etc/nginx/sites-enabled/usuario.fjrodafo.com
```

Cambiamos la ruta por la correcta:

```usuario.fjrodafo.com
fastcgi_pass unix:/run/php/php8.4-fpm.sock;
```

Siempre que modifiquemos algún archivo de configuración de nginx, tenemos que recargar el servicio:

```shell
systemctl reload nginx
```

Para comprobar que hemos hecho lo correcto solucionando el error, volvemos a nuestra página http://usuario.fjrodafo.com/info.php para visualizar la información que nos muestra php por medio de `phpinfo();`

Instalamos MySQL ejecutando los siguientes comandos:

```shell
apt update
apt install mysql-server php-mysql
```

Entramos a MySQL con la terminal ejecutando el siguiente comando:

```shell
mysql
```

A continuación descargaremos e instalaremos phpmyadmin desde la página oficial ejecutando los siguientes comandos:

```shell
cd /var/www/usuario
wget https://files.phpmyadmin.net/phpMyAdmin/5.2.2/phpMyAdmin-5.2.2-all-languages.zip
unzip phpMyAdmin-5.2.2-all-languages.zip
mv phpMyAdmin-5.2.2-all-languages phpmyadmin
ll # alias ls -la
```

Finalmente agregamos index.php a la lista del archivo de configuración de nuestro servidor:

```shell
nano /etc/nginx/sites-enabled/usuario.fjrodafo.com
```

Modificamos la siguiente linea:

```shell
# Add index.php to the list if you are using PHP
index index.php index.html index.htm index.nginx-debian.html;
```

Comprobamos que no hay errores con el siguiente comando:

```shell
nginx -t
# Si nos da error el primer comando
# ejecutamos el siguiente
/usr/sbin/nginx -t
```

Reiniciamos nginx con el siguiente comando:

```shell
systemctl reload nginx
```

Y finalmente entramos a phpmyadmin desde el siguiente enlace http://usuario.fjrodafo.com/phpmyadmin

Para poner una contraseña a nuestro servidor sql ejecutamos el siguiente comando:

```shell
mysqladmin --user=root password "fjrodafo"
```

Y accedemos a nuestro servidor sql con el siguiente comando:

```shell
mysql -u root -p
```

Una vez dentro de mysql ejecutamos el siguiente comando para crear un nuevo usuario que usaremos en phpMyAdmin:

```sql
CREATE USER 'phpmyadmin'@'localhost' IDENTIFIED BY 'fjrodafo';
```

A este usuario le vamos a dar todos los permisos ejecutando el siguiente comando:

```sql
GRANT ALL PRIVILEGES ON *.* TO 'phpmyadmin'@'localhost' WITH GRANT OPTION;
```

Finalmente podemos iniciar sesión en nuestro phpmyadmin con el usuario phpmyadmin y contraseña fjrodafo.

<link rel="stylesheet" href="./../../../README.css">
<a class="scrollup" href="#top">&#x1F53C</a>