## Índice

1. [Virtual Hosts](#virtual-hosts)

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

<link rel="stylesheet" href="./../../../README.css">
<a class="scrollup" href="#top">&#x1F53C</a>