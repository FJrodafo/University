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

## uWSGI

Aunque Gunicorn también admite comunicación mediante sockets Unix, vamos a implementar una comunicación local más eficiente utilizando un protocolo binario (uWSGI), en lugar de HTTP, entre Nginx y la pasarela que conecta con Flask.

```shell
sudo apt update
sudo apt install uwsgi uwsgi-plugin-python3
uwsgi --version
systemctl status uwsgi
```

Para parametrizar el servicio uwsgi, lo mejor es crear `/etc/uwsgi/apps-available/migateway.ini` con un contenido similar a este:

```ini
[uwsgi]
# Ruta al socket Unix para hablar con Nginx
socket = /run/uwsgi/flaskapp.sock
chmod-socket = 666

# Módulo y aplicación Flask (app.py → app)
plugin = python3
module = app:app

# Directorio de trabajo
chdir = /run/uwsgi/flaskapps

# Número de procesos y threads
master = true
processes = 4
threads = 2

# Comunicación con Nginx mediante el protocolo uwsgi
protocol = uwsgi

# Gestión de logs
logto = /var/log/uwsgi/flaskapp.log

# (opcional) entorno virtual de Python
#virtualenv = /home/fjrodafo/flaskapps/venv
```

Cambiamos la propiedad de `/run/uwsgi`

```shell
chown -R www-data:www-data /run/uwsgi
```

Las aplicaciones Flask deben residir en el directorio indicado en la configuración uWSGI, que en el ejemplo, es el directorio `/run/uwsgi/flaskpapps`. Para activarlo:

```shell
sudo ln -s /etc/uwsgi/apps-available/migateway.ini /etc/uwsgi/apps-enabled/migateway.ini
sudo systemctl restart uwsgi
sudo systemctl status uwsgi
```

Ahora, para pasarle la petición a Nginx, creamos el siguiente servidor:

```
server {
    listen 80;
    server_name _;

    location = / {
        include uwsgi_params;
        uwsgi_pass unix:/run/uwsgi/flaskapp.sock;
    }
}
```

El archivo `/etc/nginx/uwsgi_params` incluye las variables completadas por nginx para pasarlas a uwsgi.

Si recargamos la página en el cliente web, obtendremos el mismo resultado que el mostrado anteriormente, pero esta vez ha sido mediante la pasarela uWSGI. Este tipo de configuración es el que se suele utilizar en entornos de producción para servidores de aplicaciones Python.