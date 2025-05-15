## MySQL phpMyAdmin Docker Compose

Ejecuta el siguiente comando para iniciar los contenedores (Este comando iniciará los contenedores de MySQL y phpMyAdmin en modo desatendido, lo que significa que se ejecutarán en segundo plano):

```shell
docker compose up -d
```

Accede a phpMyAdmin desde tu navegador web ingresando a http://127.0.0.1:8099/

Puedes iniciar sesión usando las credenciales root de MySQL que proporcionaste.

Ejecuta el siguiente comando para detener y eliminar los contenedores:

```shell
docker compose down -v
```

El volumen de datos de MySQL se monta en `./mysql_data` en la máquina host. Esto garantiza que los datos de MySQL persistan incluso si el contenedor se detiene o elimina.

Asegúrate de que los puertos necesarios (3306 para MySQL y 8080 para phpMyAdmin) no estén siendo utilizados por otras aplicaciones en tu sistema antes de ejecutar los contenedores.

<link rel="stylesheet" href="./../../../README.css">
<a class="scrollup" href="#top">&#x1F53C</a>