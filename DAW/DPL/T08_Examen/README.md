## Índice

1. [Actividad 1](#actividad-1)
2. [Actividad 2](#actividad-2)

## Actividad 1

Emplea un archivo de configuración solo con las directivas que vayas a usar, no incluyas más directivas que las necesarias.

Debes subir al servidor de archivos la configuración de Nginx usada en el `/etc/nginx/sites-enabled` y el `mime.types`.

<details>
<summary>Estructura del proyecto</summary>

```
etc/
└── nginx/
    └── sites-available/
        └── default.examen
var/
└── www/
    └── examen/
        ├── html/
        │   ├── foto.jpg
        │   ├── index.dpl
        │   └── index.html
        └── index.html
```
</details>

Despliega un servicio web con Nginx que cumpla lo siguiente:

1. Servicio HTTP IPv4.
2. Puerto HTTP bien conocido y TCP 8080 simultáneamente.
3. Tiene que ser el servidor por defecto.
4. El directorio raíz debe ser `/var/www/examen`.
5. Los archivos con extensión `.dpl` que se encuentren dentro del directorio `/var/www/examen/html` también deben ser interpretados por el navegador web como archivos HTML. En el resto de directorios, el archivo con extensión `.dpl` debe descargarse. Recuerda que server es un contexto y cada location es un contexto también, types no se hereda si se usa dentro de un contexto. Debes incluir `mime.types` en el contexto si vas a hacer uso de types.
6. Si el navegador introduce una URL del tipo  `http://<ip_del_servidor>/html` el servidor debe entregar el archivo `index.dpl`. Para el resto de casos donde no se especifique el archivo, debe intentar entregar un archivo `index.html` exclusivamente.
7. Si el navegador introduce la URL del raíz sin especificar el archivo (`http://<ip_del_servidor>`), el servidor debe buscar primero en el directorio `/html` y depués en el raíz el archivo `index.html`.
8. Cuando se escribe en el browser `http://<ip_de_la_VPS>/<cualquier_directorio>/<cualquier_nombre>.png` debe devolver siempre la imagen `/html/foto.jpg`.
9. Crea otro servidor virtual en la misma configuración, que también escuche en el puerto HTTP bien conocido, donde el directorio raíz sea `/var/www/examen/html`.
10. El tipo de archivo que debe enviar cuando no se especifica uno en la URL, es `index.html`, y este servidor virtual solo debe responder cuando se hace una petición al nombre de dominio `www.angelmelchor.pro`. Puedes comprobarlo usando en la terminal de comandos del host, el siguiente comando `curl -H "Host:www.angelmelchor.pro" http://<ip_de_la_VPS>`.

## Actividad 2

Emplea un archivo de configuración solo con las directivas que vayas a usar, no incluyas más directivas que las necesarias.

Debes subir al servidor de archivos la configuración de Nginx usada en el `/etc/nginx/sites-enabled`, así como la del servicio PHP en el `/etc/php/8.4/fpm/pool.d/www.conf`.

<details>
<summary>Estructura del proyecto</summary>

```
etc/
└── nginx/
    └── sites-available/
        └── default.webapp
var/
└── www/
    └── webapp/
        └── index.php
```
</details>

Despliega una aplicación web con Nginx y PHP que cumpla lo siguiente:

1. Servicio HTTP IPv4.
2. Puerto TCP 81.
3. Tiene que ser el servidor por defecto.
4. El directorio raíz debe ser `/var/www/webapp`.
5. El archivo por defecto, en caso de no solicitar uno el cliente, debe ser `index.php` y en caso de no existir este, debe ser `index.html` y después `index.htm`.
6. El servicio PHP se dará con fastcgi usando fpm con un socket unix. Recuerda incluir la configuración correspondiente que se encuentra en el directorio snippets.
7. Crea otro servidor en el puerto TCP 82.
8. La aplicación PHP se encuentra en el PC del profesor en `http://<ip_del_pc_del_profesor>/enunciados_dpl/app_php`.
9. Permite que se pueda ejecutar la aplicación cuando el cliente web usa la URL `http://<ip_de_la_VPS>:82` (Cuando actúas como proxy, ten en cuenta usar un `/` al final en la redirección).