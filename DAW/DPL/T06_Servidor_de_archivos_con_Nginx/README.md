## Servidor de archivos con Nginx

En esta práctica debes instalar un servidor de archivos en tu VPS.

* Crea una configuración nueva de server nginx virtual en [sites-available](./../Master/etc/nginx/sites-available/) llamada `cloud.drive.fjrodafo.com`:
    * Puerto TCP: 8080 para HTTP
    * Activa PHP con fastcgi_pass => php-fpm con sock unix.
    * Haz que el directorio raíz sea `/var/www/cloud/drive/`
    * Descarga en un directorio temporal de tu elección la aplicación PHP desde: `https://github.com/filegator/static/raw/master/builds/filegator_latest.zip` descomprímela con unzip y copia todo el contenido en el [directorio raíz](./../Master/var/www/cloud/drive/) de tu servidor nginx.
    * Haz los ajustes de permisos.

http://cloud.drive.fjrodafo.com:8080/index.php#/

Esta aplicación tiene como usuario por defecto `admin` con contraseña por defecto `admin123`:

* Crea un directorio llamado `datos/`
* Crea un archivo llamado `file.txt` con el contenido "Hello, World!".
* Crea un usuario, dale permisos de lectura y descarga a datos.
* Comprueba con un compañero que todo funciona.

TIPS:

* La aplicación espera servir sus archivos desde el directorio `dist/`
* Los datos se almacenan en el directorio `repository/`
* Las cuentas se almacenan en el directorio `private/`