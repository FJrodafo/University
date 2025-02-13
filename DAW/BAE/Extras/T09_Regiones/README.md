## Examen

- Crear una base de datos mysql llamada `regiones`
- El usuario de acceso `root` contraseña `1q2w3e4r`
- Se pide crear las siguientes tablas:
    - **paises( nombre: varchar 255 )**
        - `nombre` tiene que ser una clave primaria.
    - **provincias( id: int, nombre: varchar 255, pais_nombre varchar 255)**
        - `id` tiene que ser una clave primaria auto-incremental.
        - `nombre` tiene que tener una restricción para ser único.
        - `pais_nombre` tiene que ser una clave foránea del campo `nombre` de la tabla `paises`.
    - **municipios( id: int, nombre: varchar 255, provincia_id int )**
        - `id` tiene que ser una clave primaria auto-incremental.
        - `provincia_id` tiene que tener una restricción que impida que pueda ponerse un dato que no exista previamente en el campo `id` de la tabla `provincias`.
        - La tabla `municipios` tiene que tener una restricción que impida que pueda haber dos filas que coincidan a la vez `nombre` y `provincia_id`.
            - No puede darse el siguiente ejemplo:
                | id    | nombre | provincia_id |
                | :---: | :----: | :----------: |
                | 2     | Pola   | 8            |
                | 3     | Pola   | 8            |
            - pero si puede darse:
                | id    | nombre | provincia_id |
                | :---: | :----: | :----------: |
                | 2     | Pola   | 7            |
                | 3     | Pola   | 8            |
            - o también puede darse:
                | id    | nombre | provincia_id |
                | :---: | :----: | :----------: |
                | 2     | Parla  | 8            |
                | 3     | Pola   | 8            |

## Calificación

Las puntuaciones serán acumulativas (para poder puntuar un epí­grafe posterior tendrá que haberse superado correctamente los anteriores).

1. Se consigue crear la tabla `paises` con la clave primaria `nombre`. *Puntuación: 30 de 100 (test 1 y 2)*.
2. Se consigue superar el primer apartado y se consigue crear la tabla `provincias` con la clave primaria auto-incremental `id`. *Puntuación: 45 de 100 (test 1, 2 y 3).*
3. Se consigue superar el segundo apartado y en la tabla `provincias` funciona la clave foránea `pais_nombre`. *Puntuación: 60 de 100 (test 1, 2, 3 y 4).*
4. Se consigue superar el tercer apartado y se consigue agregar una restricción para que el campo `nombre`, de la tabla `provincias`, sea único. *Puntuación: 75 de 100 (test 1, 2, 3, 4 y 5).*
5. Se consigue todo lo solicitado. *Puntuación 100 de 100 (test 1, 2, 3, 4, 5 y 6)*.

## Comandos

Para exportar las tablas de la base de datos (Nos generará el archivo sql de nuestra base de datos en la ruta especificada):

```shell
mysqldump -u root -p -h 127.0.0.1 -P 3306 regiones > /home/user/Documents/path/to/regiones.sql
```

Para importar las tablas ejecutaremos el siguiente comando (Es importante tener la base de datos regiones previamente creada):

```shell
mysql -u root -p -h 127.0.0.1 -P 3306 regiones < /home/user/Documents/path/to/regiones.sql
```

<link rel="stylesheet" href="./../../../../README.css">
<a class="scrollup" href="#top">&#x1F53C</a>