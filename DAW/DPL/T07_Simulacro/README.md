## Actividad 1

En la configuración por defecto de Nginx, el archivo `mime.types` no incluye la extensión `php` y el archivo `/etc/nginx/sites-enable/default` solo tiene el siguiente location:

```
location / {
	try_files $uri $uri/ =404;
}
```

y el tipo por defecto:

```
application/octet-stream
```

¿Qué ocurrirá cuando a este servidor se le solicite la siguiente URL http://www.miservidor.org/info.php suponiendo que exista el archivo `/var/www/html/info.php`?

El archivo `info.php` se servirá como una descarga (tipo `application/octet-stream`), ya que no hay un intérprete de PHP configurado.

## Actividad 2

Instala un servidor Nginx que dé servicio a dos sitios web diferentes simultáneamente y que cumpla lo siguiente:

1. Ambos servidores web deben escuchar en el puerto estándar para HTTP. El primer servidor lo hará para cualquier nombre de dominio y el segundo servidor para el nombre de dominio `www.miagenda.com`.
    1. Estructura de archivos:
        ```
        /etc/nginx/sites-available/catchallserver
        /etc/nginx/sites-available/www.miagenda.com
        ```
    2. Contenido del primer servidor (`catchallserver`):
        ```shell
        sudo nano /etc/nginx/sites-available/catchallserver
        ```
        ```
        server {
        	listen 80;
        	listen [::]:80;

        	server_name _;
        }
        ```
    3. Contenido del segundo servidor (`www.miagenda.com`):
        ```shell
        sudo nano /etc/nginx/sites-available/www.miagenda.com
        ```
        ```
        server {
        	listen 80;
        	listen [::]:80;

        	server_name www.miagenda.com;
        }
        ```
2. El primer servidor (`catchallserver`) servirá los archivos que cuelguen de `/var/www/primero` y el segundo (`www.miagenda.com`) servirá los archivos que cuelguen de `/var/www/agenda`.
    1. Contenido del primer servidor (`catchallserver`):
        ```shell
        sudo nano /etc/nginx/sites-available/catchallserver
        ```
        ```
        server {
        	listen 80;
        	listen [::]:80;

        	root /var/www/primero;

        	server_name _;
        }
        ```
    2. Contenido del segundo servidor (`www.miagenda.com`):
        ```shell
        sudo nano /etc/nginx/sites-available/www.miagenda.com
        ```
        ```
        server {
        	listen 80;
        	listen [::]:80;

        	root /var/www/agenda;

        	server_name www.miagenda.com;
        }
        ```
3. El primer servidor (`catchallserver`) deberá usar como archivo por defecto `index.dpl` solo en el directorio raíz, en el resto de directorios, a partir de la raíz, el archivo por defecto deberá ser `subprimero.html`.
    1. Contenido del primer servidor (`catchallserver`):
        ```shell
        sudo nano /etc/nginx/sites-available/catchallserver
        ```
        ```
        server {
        	listen 80;
        	listen [::]:80;

        	root /var/www/primero;

        	server_name _;

        	# Archivo por defecto SOLO para el directorio raíz.
        	location = / {
        		index index.dpl
        		try_files $uri $uri/ =404;
        	}

        	# Archivo por defecto para todos los demás directorios.
        	location / {
        		index subprimero.html
        		try_files $uri $uri/ =404;
        	}
        }
        ```
4. El segundo servidor (`www.miagenda.com`) deberá usar como archivo por defecto `index.dpl` en todos los casos como primera opción y en caso de no encontrarse, deberá localizar `index.html`.
    1. Contenido del segundo servidor (`www.miagenda.com`):
        ```shell
        sudo nano /etc/nginx/sites-available/www.miagenda.com
        ```
        ```
        server {
        	listen 80;
        	listen [::]:80;

        	root /var/www/agenda;

        	# Orden de archivos por defecto.
        	index index.dpl index.html;
        	include mime.types;
        	types {
        		text/html dpl;
        	}

        	server_name www.miagenda.com;

        	location / {
        		try_files $uri $uri/ =404;
        	}
        }
        ```
5. Ambos servidores deberán servir las imágenes jpg solicitadas desde un subdirectorio `/imagenes` que cuelga de la raíz de cada servidor.
    1. Contenido del primer servidor (`catchallserver`):
        ```shell
        sudo nano /etc/nginx/sites-available/catchallserver
        ```
        ```
        server {
        	listen 80;
        	listen [::]:80;

        	root /var/www/primero;

        	server_name _;

        	# Archivo por defecto SOLO para el directorio raíz.
        	location = / {
        		index index.dpl
        		try_files $uri $uri/ =404;
        	}

        	# Archivo por defecto para todos los demás directorios.
        	location / {
        		index subprimero.html
        		try_files $uri $uri/ =404;
        	}

        	location ~* /([a-z0-9]+\.jpe?g)$ {
        		try_files /imagenes/$1 =404;
        	}
        }
        ```
    2. Contenido del segundo servidor (`www.miagenda.com`):
        ```shell
        sudo nano /etc/nginx/sites-available/www.miagenda.com
        ```
        ```
        server {
        	listen 80;
        	listen [::]:80;

        	root /var/www/agenda;

        	# Orden de archivos por defecto.
        	index index.dpl index.html;
        	include mime.types;
        	types {
        		text/html dpl;
        	}

        	server_name www.miagenda.com;

        	location / {
        		try_files $uri $uri/ =404;
        	}

        	location ~* /([[:alnum:]]+\.jpe?g)$ {
        		try_files /imagenes/$1.$2 =404;
        	}
        }
        ```
6. Crea en el segundo servidor (`www.miagenda.com`) una carpeta llamada `/img` que contenga al menos una imagen png pero cambia la extensión por img (foto.png --> foto.img) y configura Nginx para que todas las imágenes img que se sirvan desde este directorio, sean enviadas al cliente con el tipo correspondiente (Content-Type).
    1. Contenido del segundo servidor (`www.miagenda.com`):
        ```shell
        sudo nano /etc/nginx/sites-available/www.miagenda.com
        ```
        ```
        server {
        	listen 80;
        	listen [::]:80;

        	root /var/www/agenda;

        	# Orden de archivos por defecto.
        	index index.dpl index.html;
        	include mime.types;
        	types {
        		text/html dpl;
        	}

        	server_name www.miagenda.com;

        	location / {
        		try_files $uri $uri/ =404;
        	}

        	location ~* /([[:alnum:]]+\.jpe?g)$ {
        		try_files /imagenes/$1.$2 =404;
        	}

        	location /img/ {
        		alias /var/www/agenda/img/;

        		# Forzar tipo de contenido image/png para archivos .img
        		types {
        			image/png img;
        		}
        	}
        }
        ```
7. Crea en el segundo servidor (`www.miagenda.com`) un subdirectorio llamado `/secreto/interno`. Configura el index para que sirva secreto.html a partir de `/secreto`. Luego crea un archivo llamado `secreto.html` dentro del directorio `/secreto` y otro con el mismo nombre pero con un contenido algo diferente dentro del directorio `/secreto/interno`. Modifica la configuración del segundo servidor (`www.miagenda.com`) para que una URL que termine en `/secreto` o en `/secreto/` sirva automáticamente el contenido `/secreto/interno/secreto.html`. Prueba que `/secreto/secreto.html` sirva el archivo correcto.
    1. Contenido del segundo servidor (`www.miagenda.com`):
        ```shell
        sudo nano /etc/nginx/sites-available/www.miagenda.com
        ```
        ```
        server {
        	listen 80;
        	listen [::]:80;

        	root /var/www/agenda;

        	# Orden de archivos por defecto.
        	index index.dpl index.html;
        	include mime.types;
        	types {
        		text/html dpl;
        	}

        	server_name www.miagenda.com;

        	location / {
        		try_files $uri $uri/ =404;
        	}

        	location ~* /([[:alnum:]]+\.jpe?g)$ {
        		try_files /imagenes/$1.$2 =404;
        	}

        	location /img/ {
        		alias /var/www/agenda/img/;

        		# Forzar tipo de contenido image/png para archivos .img
        		types {
        			image/png img;
        		}
        	}

        	location = /secreto {
        		rewrite ^ /secreto/interno/secreto.html break;
        	}

        	location = /secreto/ {
        		rewrite ^ /secreto/interno/secreto.html break;
        	}

        	# Index por defecto dentro del directorio /secreto
        	location /secreto/ {
        		alias /var/www/agenda/secreto/;
        		index secreto.html;
        		try_files $uri $uri/ =404;
        	}
        }
        ```
8. En este apartado vamos a comprobar el funcionamiento de la directiva internal. Esta directiva prohíbe el acceso directo a un archivo o recurso por parte del cliente pero si permite el acceso al propio servidor. Por ejemplo, si el recurso `/internos/p404.html` es internal, entonces un navegador web no podrá acceder a http://www.miagenda.com/internos/p404.html pero el servidor Nginx si podrá hacerlo. Cambia la página de error 404 del segundo sservidor (`www.miagenda.com`). Para ello tienes que poner una directiva indicando cuál es la ubicación de la nueva página:
    ```
    error_page 404 /internos/p404.html;
    ```
    Después descarga en ese directorio la página https://www.angelmelchor.pro/descargas/p404.html y configura el location anterior para que actúe como internal. Verifica que se descarga la nueva página de error 404 Not Found y que no puedes acceder directamente al recurso `/internos/p404.html`.
    1. Contenido del segundo servidor (`www.miagenda.com`):
        ```shell
        sudo nano /etc/nginx/sites-available/www.miagenda.com
        ```
        ```
        server {
        	listen 80;
        	listen [::]:80;

        	root /var/www/agenda;

        	# Orden de archivos por defecto.
        	index index.dpl index.html;
        	include mime.types;
        	types {
        		text/html dpl;
        	}

        	server_name www.miagenda.com;

        	location / {
        		try_files $uri $uri/ =404;
        	}

        	location ~* /([[:alnum:]]+\.jpe?g)$ {
        		try_files /imagenes/$1.$2 =404;
        	}

        	location /img/ {
        		alias /var/www/agenda/img/;

        		# Forzar tipo de contenido image/png para archivos .img
        		types {
        			image/png img;
        		}
        	}

        	location = /secreto {
        		rewrite ^ /secreto/interno/secreto.html break;
        	}

        	location = /secreto/ {
        		rewrite ^ /secreto/interno/secreto.html break;
        	}

        	# Index por defecto dentro del directorio /secreto
        	location /secreto/ {
        		alias /var/www/agenda/secreto/;
        		index secreto.html;
        		try_files $uri $uri/ =404;
        	}

        	# Página de error 404 personalizada.
        	error_page 404 /internos/p404.html;

        	# Bloque location marcado como internal.
        	location /internos {
        		internal;
        	}
        }
        ```
9. Final:
    1. Atribuir permisos:
        ```shell
        sudo chown -R www-data:www-data /var/www/primero
        sudo chown -R www-data:www-data /var/www/agenda
        ```
    2. Habilitar los sitios web:
        ```shell
        sudo ln -s /etc/nginx/sites-available/catchallserver /etc/nginx/sites-enabled/catchallserver
        sudo ln -s /etc/nginx/sites-available/www.miagenda.com /etc/nginx/sites-enabled/www.miagenda.com
        ```
    3. Comprobar la configuración y recargar Nginx:
        ```shell
        sudo nginx -t
        sudo systemctl reload nginx
        ```
10. Tips:
    Para poder acceder por nombre de dominio a tu servidor, en el equipo del cliente web tienes que configurar el archivo correspondiente. Supongamos que la dirección IP de tu servidor es `xx.xxx.xx.xxx`.
    1. Si tu equipo cliente es Linux, modifica el archivo `/etc/hosts` para que quede similar a este:
        ```hosts
        127.0.0.1       localhost
        xx.xxx.xx.xxx   www.miagenda.com
        ```
    2. Si tu equipo cliente es Windows, modifica el archivo `C:\Windows\System32\drivers\etc\hosts` y para ello tienes que abrir una consola de terminal o de powershell como administrador, cambiar al directorio anterior y abrir el archivo hosts con notepad. Lo modificas para que quede similar a este:
        ```hosts
        # Additionally, comments (such as these) may be inserted on individual
        # lines or following the machine name denoted by a '#' symbol.
        #
        xx.xxx.xx.xxx www.miagenda.com
        ```

<link rel="stylesheet" href="./../../../README.css">
<a class="scrollup" href="#top">&#x1F53C</a>