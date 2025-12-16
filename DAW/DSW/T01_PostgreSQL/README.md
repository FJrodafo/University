## Índice

1. [Descarga e instalación de PostgreSQL](#descarga-e-instalación-de-postgresql)
2. [Comandos básicos](#comandos-básicos)
3. [Crear un usuario](#crear-un-usuario)
4. [Crear una base de datos](#crear-una-base-de-datos)
5. [PHP + PostgreSQL + Nginx](#php--postgresql--nginx)
6. [Script de conexión](#script-de-conexión)
7. [Postman](#postman)

## Descarga e instalación de PostgreSQL

Para llevar a cabo la descarga e instalación del gestor de bases de datos PostgreSQL, accedemos a la sección de descargas del sitio oficial y seguiremos las indicaciones para instalar la última versión del SGBD en nuestro sistema.

```shell
sudo apt install postgresql
```

Una vez que PostgreSQL está instalado, puedes acceder a él desde la terminal a través del usuario `postgres`.

```shell
sudo -i -u postgres
```

Una vez dentro del usuario `postgres`, podemos abrir la consola con el siguiente comando.

```shell
psql
```

## Comandos básicos

Listar bases de datos:

```psql
\l
```

Conectarse a una base de datos específica:

```psql
\c mibasededatos
```

Ver usuarios (roles):

```psql
\du
```

Salir de PSQL:

```psql
\q
```

## Crear un usuario

Para crear un usuario nuevo tenemos que iniciar sesión con el usuario `postgres` y ejecutar la siguiente sentencia SQL dentro de la consola PSQL (Asegúrate de que el nombre de usuario y base de datos tengan el mismo nombre que el nombre de usuario de tu sistema actual):

```sql
CREATE USER fjrodafo WITH PASSWORD '1234';
CREATE DATABASE fjrodafo OWNER fjrodafo;
```

Para darle permisos de creación de bases de datos a nuestro nuevo usuario, ejecutamos la siguiente sentencia SQL:

```sql
ALTER USER fjrodafo CREATEDB;
```

Salimos de la consola PSQL y del usuario `postgres` para iniciar sesión con nuestro nuevo usuario `fjrodafo`.

```shell
psql -U fjrodafo -W
```

## Crear una base de datos

Para crear la base de datos, ejecutamos la siguiente sentencia SQL:

```sql
CREATE DATABASE tienda OWNER fjrodafo;
```

Una vez creada la base de datos `tienda`, nos conectamos a ella con el siguiente comando PSQL:

```psql
\c tienda
```

Una vez conectados a la base de datos `tienda`, ejecutamos el script de creación de tablas e inserción de datos con el siguiente comando PSQL:

<details>
<summary>tienda.sql</summary>

```sql
CREATE TABLE Fabricantes (
    id INTEGER PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Productos (
    id INTEGER PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio FLOAT NOT NULL,
    id_fabricante INTEGER NOT NULL,
    FOREIGN KEY (id_fabricante) REFERENCES Fabricantes(id)
);

INSERT INTO Fabricantes (id, nombre) VALUES
    (1, 'Asus'),
    (2, 'Lenovo'),
    (3, 'Hewlett-Packard'),
    (4, 'Samsung'),
    (5, 'Seagate'),
    (6, 'Crucial'),
    (7, 'Gigabyte'),
    (8, 'Huawei'),
    (9, 'Xiaomi');

INSERT INTO Productos (id, nombre, precio, id_fabricante) VALUES
    (1, 'Disco duro SATA3 1TB', 86.99, 5),
    (2, 'Memoria RAM DDR4 8GB', 120, 6),
    (3, 'Disco SSD 1 TB', 150.99, 4),
    (4, 'GeForce GTX 1050Ti', 185, 7),
    (5, 'GeForce GTX 1080 Xtreme', 755, 6),
    (6, 'Monitor 24 LED Full HD', 202, 1),
    (7, 'Monitor 27 LED Full HD', 245.99, 1),
    (8, 'Portátil Yoga 520', 559, 2),
    (9, 'Portátil Ideapd 320', 444, 2),
    (10, 'Impresora HP Deskjet 3720', 59.99, 3),
    (11, 'Impresora HP Laserjet Pro M26nw', 180, 3);
```
</details>

```psql
\i /home/fjrodafo/Documents/Scripts/tienda.sql
```

Si todo ha ido bien, podríamos mostrar el contenido de la tabla `Productos` con la siguiente sentencia SQL:

```sql
SELECT * FROM Productos;
```

## PHP + PostgreSQL + Nginx

Para configurar el proyecto neceitaríamos instalar el paquete `php8.2-pgsql` con el siguiente comando:

```shell
sudo apt update
sudo apt install php8.2-pgsql
```

Para comprobar que el módulo está habilitado ejecutamos el siguiente comando:

```shell
php -m | grep pgsql
```

Para configurar PostgreSQL en Nginx, debemos acceder al archivo `/etc/php/8.2/fpm/php.ini` y descomentar las siguientes líneas de código:

```ini
extension=pdo_pgsql
extension=pgsql
```

Para finalizar con la configuración se deben reiniciar los servicios `nginx` y `php8.2-fpm`

## Script de conexión

[Archivos del proyecto](./../Master/var/www/daw/ejercicios/tienda/index.php)

```php
<?php
    // Datos de conexión
    $host = 'localhost';
    $port = '5432';
    $dbname = 'tienda';
    $user = 'fjrodafo';
    $password = '0000';

    // Cadena de conexión PDO
    $dsn = "pgsql:host=$host;port=$port;dbname=$dbname";

    try {
        // Crear conexión
        $pdo = new PDO($dsn, $user, $password, [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION // Mostrar errores
        ]);

        echo "<h2>Conexión establecida correctamente</h2>";

        // Consulta SQL
        $sql = "SELECT id, nombre, precio, id_fabricante FROM Productos";
        $stmt = $pdo->query($sql);

        echo "<h3>Lista de productos:</h3>";
        echo "<table border='1' cellpadding='8' cellspacing='0'>";
        echo "<tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Precio</th>
                <th>ID Fabricante</th>
              </tr>";

        // Recorrer filas
        foreach ($stmt as $fila) {
            echo "<tr>";
            echo "<td>{$fila['id']}</td>";
            echo "<td>{$fila['nombre']}</td>";
            echo "<td>{$fila['precio']}</td>";
            echo "<td>{$fila['id_fabricante']}</td>";
            echo "</tr>";
        }

        echo "</table>";

    } catch (PDOException $e) {
        echo "<strong>Error de conexión: </strong>" . $e->getMessage();
    }
?>
```

Para ocultar los datos sensibles como la contraseña o el puerto, se podría configurar un archivo `config.php` con la siguiente estructura:

```php
<?php
    return [
        'host' => 'localhost',
        'port' => '5432',
        'dbname' => 'tienda',
        'user' => 'fjrodafo',
        'password' => '0000'
    ];
?>
```

El archivo `index.php` quedaría de la siguiente manera:

```php
<?php
    // Cargar configuración
    $config = require __DIR__ . '/../../../private/config.php';

    // Datos de conexión tomados desde config.php
    $host = $config['host'];
    $port = $config['port'];
    $dbname = $config['dbname'];
    $user = $config['user'];
    $password = $config['password'];

    // Cadena de conexión PDO
    $dsn = "pgsql:host=$host;port=$port;dbname=$dbname";

    try {
        // Crear conexión
        $pdo = new PDO($dsn, $user, $password, [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION // Mostrar errores
        ]);

        echo "<h2>Conexión establecida correctamente</h2>";

        // Consulta SQL
        $sql = "SELECT id, nombre, precio, id_fabricante FROM Productos";
        $stmt = $pdo->query($sql);

        echo "<h3>Lista de productos:</h3>";
        echo "<table border='1' cellpadding='8' cellspacing='0'>";
        echo "<tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Precio</th>
                <th>ID Fabricante</th>
              </tr>";

        // Recorrer filas
        foreach ($stmt as $fila) {
            echo "<tr>";
            echo "<td>{$fila['id']}</td>";
            echo "<td>{$fila['nombre']}</td>";
            echo "<td>{$fila['precio']}</td>";
            echo "<td>{$fila['id_fabricante']}</td>";
            echo "</tr>";
        }

        echo "</table>";
    } catch (PDOException $e) {
        echo "<strong>Error de conexión: </strong>" . $e->getMessage();
    }
?>
```

También se podría utilizar un archivo `.env` con la siguiente estructura:

```env
DB_HOST=localhost
DB_PORT=5432
DB_NAME=tienda
DB_USER=fjrodafo
DB_PASSWORD=0000
```

Y cargar el archivo `.env` como si fuera un INI:

```php
<?php
    // Cargar configuración
    $env = parse_ini_file(__DIR__ . '/../../../private/.env');

    // Datos de conexión tomados desde .env
    $host = $env['DB_HOST'];
    $port = $env['DB_PORT'];
    $dbname = $env['DB_NAME'];
    $user = $env['DB_USER'];
    $password = $env['DB_PASSWORD'];
...
```

## Postman

Descargar el archivo `postman-linux-arm64.tar.gz` desde la web oficial: https://www.postman.com/downloads/

```shell
cd /tmp
wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
file postman.tar.gz
```

Para extraer el archivo, ejecuta el siguiente comando:

```shell
sudo tar -xzf postman.tar.gz -C /opt
ls -l /opt/Postman/Postman
file /opt/Postman/Postman
```

Crear enlace ejecutable:

```shell
sudo ln -s /opt/Postman/app/Postman /usr/bin/postman
file /opt/Postman/app/Postman
```

Ejecutar Postman con el siguiente comando:

```shell
postman
```

Hacer que postman aparezca en el menú de aplicaciones:

```shell
sudo nano /usr/share/applications/postman.desktop
```
```desktop
[Desktop Entry]
Name=Postman
Comment=API Development Environment
Exec=/opt/Postman/app/Postman
Icon=/opt/Postman/app/resources/app/assets/icon.png
Terminal=false
Type=Application
Categories=Development;
StartupWMClass=Postman
```

<link rel="stylesheet" href="./../../../README.css">
<a class="scrollup" href="#top">&#x1F53C</a>