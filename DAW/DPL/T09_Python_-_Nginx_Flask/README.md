Instala el paquete que habilita `venv` para tu versión de Python:

```shell
sudo apt update
sudo apt install python3.11-venv
```

Crea un entorno virtual en el directorio `flaskapps` en el que se encuentra el archivo `app.py`:

```shell
cd flaskapps
python3 -m venv venv
source venv/bin/activate
pip install flask gunicorn
```

Para asegurarnos de que todo se ha instalado correctamente y que estamos operando desde el entorno virtual, ejecutamos los siguientes comandos (de esta manera comprobamos que Python está utilizando y apunta hacia la ruta del entorno virtual):

```shell
which python
which pip
```

Para comenzar con el servidor, activamos el servicio `gunicorn` para que escuche en el puerto TCP 9000 e importe la aplicación `flask`:

```shell
gunicorn --bind 0.0.0.0:9000 app:app
```

Para comprobar que funciona, visita http://localhost:9000/

Ahora, para pasarle la petición a Nginx, creamos el siguiente servidor:

```
server {
    listen 80;
    server_name _;

    location = / {
        proxy_pass http://localhost:9000;
    }
}
```

Una vez creado el servidor Nginx, visita http://localhost/

Al terminar de operar en el entorno virtual, debemos desactivarlo con el siguiente comando desde el directorio `flaskapps`:

```shell
deactivate
```