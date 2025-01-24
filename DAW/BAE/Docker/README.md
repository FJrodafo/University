## Contenido del archivo

```yaml
version: '3'
 
services:
  mysqldb:
    image: mysql:8.3.0
    container_name: mysqlcontainer
    environment:
      MYSQL_ROOT_PASSWORD: 1q2w3e4r
    ports:
      - '3306:3306'
    volumes:
      - $HOME/volumes_docker/var_lib_mysql:/var/lib/mysql
  phpmyadmin:
    image: phpmyadmin:5.2.1
    container_name: phpmyadmincontainer
    environment:
      PMA_HOST: mysqldb
      PMA_PORT: 3306
      PMA_ARBITRARY: 1
    restart: always
    ports:
      - 8000:80
```

## Comandos

Para arrancar el servicio nos posicionamos donde esté el archivo [docker-compose.yaml](./docker-compose.yaml)

Posteriormente ejecutamos el siguiente comando:

```shell
docker-compose -f docker-compose.yaml up -d
```

Para iniciar sesión desde la terminal, ejecutamos el siguiente comando:

```shell
mysql -h 127.0.0.1 -P 3306 -u root -p
```

La contraseña para acceder al usuario root es `1q2w3e4r`

Una vez hayamos acabado, tenemos que parar el servicio ejecutando el siguiente comando:

```shell
docker-compose -f docker-compose.yaml down
```
