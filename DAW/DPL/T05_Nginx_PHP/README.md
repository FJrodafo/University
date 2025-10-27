## Nginx + PHP

En esta actividad vamos a instalar un servidor web (HTTP) que permita la ejecución de aplicaciones PHP. Para ello vamos a usar el servidor Nginx.

Nginx no implementa por defecto un intérprete de PHP sino que se limita a pasar la petición web, normalmente un script PHP con unos datos que proceden de un formulario web (bien con método GET, bien con método POST) a un servicio capaz de procesar o interpretar el script junto con los datos y devolver un código HTML al servidor Nginx para que, a su vez, se lo entregue al cliente que hizo la solicitud previa.

Entonces, Nginx se limita a hacer el papel de un proxy server inverso.

Por tanto, para usar PHP en un servidor Linux debemos tener instalado PHP en dicho servidor. Compruébalo ejecutando el siguiente comando:

```shell
php -v
```

1. Crea un archivo de configuración en /etc/nginx/sites-available/ llamado _test.fjrodafo.com_:
    - El servidor debe escuchar en el puerto TCP/8080
        ```test.fjrodafo.com
        server {
        	listen 8080;
        	listen [::]:8080;
        
        	root /var/www/test;
        
        	index index.html index.htm index.nginx-debian.html;
        
        	server_name test.fjrodafo.com;
        
        	location / {
        		try_files $uri $uri/ =404;
        	}
        }
        ```
    - El servidor debe tener como directorio raíz /var/www/test/ y el usuario con el que se ejecuta el servicio Nginx debe tener la propiedad de este directorio y de todo lo que haya debajo de él.
        ```shell
        sudo chown -R www-data:www-data /var/www/test/
        sudo chmod -R 755 /var/www/test/
        ```
    - Vamos a pasar todas las peticiones de archivos PHP a un servidor HTTP que sí procesa PHP:
        ```shell
        cd /var/www/test/
        php -S 127.0.0.1:9000
        ```
    - Redirigir todas las peticiones PHP al servidor PHP embebido:
        ```test.fjrodafo.com
        server {
        	// Código anterior ...
        
        	location ~ \.php$ {
        		proxy_pass http://127.0.0.1:9000;
        	}
        }
        ```
    - Crea un archivo info.php que ejecute la función `phpinfo()` y comprueba que tienes activo el servicio PHP.
        ```php
        <?php
            phpinfo();
        ?>
        ```
    - Crea un archivo index.html con un formulario [GET](./../../DSW/Master/var/www/test/formulario/get/index.html) que contenga dos variables:
        - **var1** será el usuario.
        - **var2** será la contraseña.
        - El script PHP será login.php y devolverá al cliente:
            ```
            Hola <var1>, tu contraseña es <var2>.
            ```
        - Modifica index.html para que el formulario sea [POST](./../../DSW/Master/var/www/test/formulario/post/index.html).
    ```log
    [Mon Oct 27 20:46:22 2025] PHP 8.2.29 Development Server (http://127.0.0.1:9000) started
    [Mon Oct 27 20:46:24 2025] 127.0.0.1:38880 Accepted
    [Mon Oct 27 20:46:24 2025] 127.0.0.1:38880 [200]: GET /info.php
    [Mon Oct 27 20:46:24 2025] 127.0.0.1:38880 Closing
    [Mon Oct 27 20:47:02 2025] 127.0.0.1:35722 Accepted
    [Mon Oct 27 20:47:02 2025] 127.0.0.1:35722 [200]: GET /formulario/get/login.php?var1=FJrodafo&var2=1234
    [Mon Oct 27 20:47:02 2025] 127.0.0.1:35722 Closing
    [Mon Oct 27 20:47:22 2025] 127.0.0.1:34778 Accepted
    [Mon Oct 27 20:47:22 2025] 127.0.0.1:34778 [200]: POST /formulario/post/login.php
    [Mon Oct 27 20:47:22 2025] 127.0.0.1:34778 Closing
    ```

<link rel="stylesheet" href="./../../../README.css">
<a class="scrollup" href="#top">&#x1F53C</a>