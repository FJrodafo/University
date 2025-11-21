## Nginx + PHP

En esta actividad vamos a instalar un servidor web (HTTP) que permita la ejecución de aplicaciones PHP. Para ello vamos a usar el servidor Nginx.

Nginx no implementa por defecto un intérprete de PHP sino que se limita a pasar la petición web, normalmente un script PHP con unos datos que proceden de un formulario web (bien con método GET, bien con método POST) a un servicio capaz de procesar o interpretar el script junto con los datos y devolver un código HTML al servidor Nginx para que, a su vez, se lo entregue al cliente que hizo la solicitud previa.

Entonces, Nginx se limita a hacer el papel de un proxy server inverso.

Por tanto, para usar PHP en un servidor Linux debemos tener instalado PHP en dicho servidor. Compruébalo ejecutando el siguiente comando:

```shell
php -v
```

1. Crea un archivo de configuración (`/etc/nginx/sites-available/test.fjrodafo.com`):
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
    - El servidor debe tener como directorio raíz `/var/www/test/` y el usuario con el que se ejecuta el servicio Nginx debe tener la propiedad de este directorio y de todo lo que haya debajo de él.
        ```shell
        sudo chown -R www-data:www-data /var/www/test/
        sudo chmod -R 755 /var/www/test/
        ```
    - Vamos a pasar todas las peticiones de archivos PHP a un servidor HTTP que sí procesa PHP:
        ```shell
        cd /var/www/test/
        php -S 127.0.0.1:9000
        ```
    - Redirigir todas las peticiones PHP al servidor PHP embebido (`/etc/nginx/sites-available/test.fjrodafo.com`):
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
    - Crea un archivo index.html con un formulario [GET](./../Master/var/www/test/formulario/get/index.html) que contenga dos variables:
        - **var1** será el usuario.
        - **var2** será la contraseña.
        - El script PHP será login.php y devolverá al cliente:
            ```
            Hola <var1>, tu contraseña es <var2>.
            ```
        - Modifica index.html para que el formulario sea [POST](./../Master/var/www/test/formulario/post/index.html).
    - Comprobamos que no hay errores con el siguiente comando:
        ```shell
        sudo nginx -t
        ```
    - Si el comando anterior no existe porque no se ha configurado la variable de entorno, ejecute el siguiente comando:
        ```shell
        sudo /usr/sbin/nginx -t
        ```
    - Reiniciamos Nginx debido a que hemos hecho un cambio en los archivos de configuración del servidor:
        ```shell
        sudo systemctl restart nginx.service
        ```
    - Comprobamos que funciona correctamente:
        - http://127.0.0.1:8080/info.php
        - http://127.0.0.1:8080/formulario/get/index.html
        - http://127.0.0.1:8080/formulario/post/index.html
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
2. Servicio Fastcgi.
    - Instala el sevicio php-fpm (PHP-FastCGI Process Manager).
        ```shell
        sudo apt install php-fpm
        ```
        - Este servicio es mucho más eficiente y apto para producción que el usado con el servidor HTTP de PHP. Se trata de un servicio que recibe la información mediante protocolo fastcgi desde el servidor Nginx, interpreta el script PHP y devuelve a Nginx los resultados para que, a su vez se los entregue al cliente que hizo la petición. Tiene dos maneras de funcionar:
        - Mediante servicio TCP: Es similar al anterior de HTTP pero ahora no es `proxy_pass` sino `fastcgi_pass` porque usa ese protocolo. Para configurar este servicio debes ir a `/etc/php/8.2/fpm/pool.d/www.conf` y dentro debes modificar la directiva listen para que use un socket TCP en vez de un socket UNIX.
            ```conf
            listen = 127.0.0.1:9000
            ```
        - Recuerda reiniciar este servicio para que aplique los cambios (El siguiente comando solo funciona si es la versión 8.2, usa la correspondiente a tu equipo y comprueba que el servicio está esuchando en 127.0.0.1:9000):
            ```shell
            sudo systemctl restart php8.2-fpm.service
            ```
        - Verificar que el servicio está escuchando en el puerto TCP:
            ```shell
            ss -putnl
            echo
            sudo ss -putnl | grep 9000
            ```
    - Modifica la configuración de Nginx `/etc/nginx/sites-available/test.fjrodafo.com` para que ahora use PHP mediante un proxy fastcgi a este servicio:
        ```test.fjrodafo.com
        server {
        	// Código anterior ...

        	location ~ \.php$ {
        		include snippets/fastcgi-php.conf;
        
        		fastcgi_pass 127.0.0.1:9000;
        	}
        }
        ```
    - Comprobamos que no hay errores con el siguiente comando:
        ```shell
        sudo nginx -t
        ```
    - Si el comando anterior no existe porque no se ha configurado la variable de entorno, ejecute el siguiente comando:
        ```shell
        sudo /usr/sbin/nginx -t
        ```
    - Reiniciamos Nginx debido a que hemos hecho un cambio en los archivos de configuración del servidor:
        ```shell
        sudo systemctl restart nginx.service
        ```
    - Comprueba que el formulario anterior sigue funcionando para ambos métodos.
        - http://127.0.0.1:8080/info.php
        - http://127.0.0.1:8080/formulario/get/index.html
        - http://127.0.0.1:8080/formulario/post/index.html
    - Ahora vuelve a modificar el servicio php-fpm para que use un socket unix en vez del TCP, actualiza la configuración de Nginx y comprueba que ya no existe el servicio fastgci en un puerto TCP pero que funciona PHP igualmente. Vuelve a `/etc/php/8.2/fpm/pool.d/www.conf` y cambia la directiva listen por la siguiente (que es la que aparecía por defecto):
        ```conf
        listen = /run/php/php8.2-fpm.sock
        ```
    - Comprueba que tienes el socket correcto:
        ```shell
        ls -l /run/php/
        ```
    - Recuerda reiniciar este servicio para que aplique los cambios (El siguiente comando solo funciona si es la versión 8.2, usa la correspondiente a tu equipo y comprueba que el servicio está esuchando en 127.0.0.1:9000):
        ```shell
        sudo systemctl restart php8.2-fpm.service
        ```
    - Verificar que el servicio ya no está escuchando en el puerto TCP:
        ```shell
        ss -putnl
        echo
        sudo ss -putnl | grep 9000
        ```
    - Actualizar `/etc/nginx/sites-available/test.fjrodafo.com` para usar el socket UNIX:
        ```test.fjrodafo.com
        server {
        	// Código anterior ...

        	location ~ \.php$ {
        		include snippets/fastcgi-php.conf;
        
        		fastcgi_pass unix:/run/php/php8.2-fpm.sock;
        	}
        }
        ```
    - Comprobamos que no hay errores con el siguiente comando:
        ```shell
        sudo nginx -t
        ```
    - Si el comando anterior no existe porque no se ha configurado la variable de entorno, ejecute el siguiente comando:
        ```shell
        sudo /usr/sbin/nginx -t
        ```
    - Reiniciamos Nginx debido a que hemos hecho un cambio en los archivos de configuración del servidor:
        ```shell
        sudo systemctl restart nginx.service
        ```
    - Comprobamos que funciona correctamente:
        - http://127.0.0.1:8080/info.php
        - http://127.0.0.1:8080/formulario/get/index.html
        - http://127.0.0.1:8080/formulario/post/index.html

<link rel="stylesheet" href="./../../../README.css">
<a class="scrollup" href="#top">&#x1F53C</a>