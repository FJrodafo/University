## Índice

1. [Recursos](#recursos)
2. [Creación de la máquina virtual](#creación-de-la-máquina-virtual)
3. [Configuración de la máquina virtual](#configuración-de-la-máquina-virtual)
4. [Instalación del servicio SSH](#instalación-del-servicio-ssh)
5. [Conexión al servidor](#conexión-al-servidor)

## Recursos

* virtualbox-7.2_7.2.2-170484~Debian~bookworm_amd64.deb
* debian-13.1.0-amd64-netinst.iso

Para instalar VirtualBox, ejecute el siguiente comando:

```shell
sudo dpkg -i ~/Downloads/virtualbox-7.2_7.2.2-170484~Debian~bookworm_amd64.deb
```

Para obtener la última versión de Debian, visite https://www.debian.org/

## Creación de la máquina virtual

Una vez hayamos instalado VirtualBox, accedemos a la aplicación y comenzamos con la creación de una nueva máquina virtual (Ctrl + N).

* Virtual machine name and operating system
    1. Introducimos el nombre de la máquina virtual, en este caso se llamará "trixie".
    2. Dejamos configurada la carpeta de las máquinas virtuales que nos aparece por defecto "VirtualBox VMs".
    3. Seleccionamos la imagen iso que descargamos anteriormente desde la página oficial de Debian.
    4. Dejamos marcada la casilla "Proceed with Unattended Installation".
* Set up unattended guest OS installation
    1. En este apartado tan solo cambiamos el nombre de usuario y la contraseña a nuestro gusto (Siempre es importante crear una contraseña lo más segura posible).
    2. El resto de campos los dejamos como vienen por defecto, en este caso el _Host Name_ sería "trixie" y el _Domain Name_ sería "myguest.virtualbox.org".
    3. En cuanto a las _Guest Additions_, dejamos la casilla desmarcada puesto que no nos interesa instalar estas _Guest Additions_.
* Specify virtual hardware
    1. Estos campos los dejamos como vienen por defecto, la _Base Memory_ en 2048 MB, el _Number of CPUs_ a 1 y la casilla _Use EFI_ desmarcada.
* Specify virtual hard disk
    1. Creamos un nuevo disco duro virtual o usamos uno ya existente, en este caso vamos a crear uno de 20.00 GB que nos será más que suficiente para nuestro servidor (Se ha creado un disco duro virtual con mucho espacio puesto que esta máquina virtual no solo se usará para la creación de un servidor sino para más propositos).

Finalizamos con esta configuración inicial y la máquina virtual comenzará con la instalación del sistema Debian, ahora solo nos toca esperar a que termine de instalarse por completo...

## Configuración de la máquina virtual

Una vez haya terminado la instalación del sistema Debian en nuestra máquina virtual, la apagamos desde dentro de la interfáz gráfica para realizar una configuración de red.

Para terminar con la configuración de la máquina virtual nos dirigimos a `Settings > Network > Enable Network Adapter > Attached to Bridged Adapter` de esta manera estaríamos configurando un adaptador puente para la tarjeta de red de la máquina virtual, lo que nos permitiría utilizar el rango de IPs al mismo nivel que nuestra máquina física.

Una vez finalizada esta configuración de red, iniciamos la máquina virtual y por medio del comando `ip a` podemos visualizar tanto en nuestra máquina física como virtual que ambas usan el mismo rango de IPs.

Otro comando útil sería `ss -putnl` para visualizar los servicios en ejecución y qué puertos están utilizando, este comando lo utilizaremos más adelante...

## Instalación del servicio SSH

Para continuar con la configuración de nuestro servidor, tenemos que tener instalado el servicio SSH tanto en nuestra máquina física como en la virtual para poder conectarnos desde nuestra máquina física a la virtual por medio de este servicio, así que ejecutamos el siguiente comando para realizar la instalación de este servicio:

```shell
su
apt update
apt install ssh
```

Una vez instalado el servicio SSH, podemos ver su estado con el siguiente comando:

```shell
systemctl status ssh.service
```

Además podemos visualizar con el siguiente comando que el servicio SSH está ocupando el puerto 22 (El puerto 22 es el puerto bien conocido de SSH):

```shell
ss -putnl
```

## Conexión al servidor

Para conectarnos a nuestro servidor (máquina virtual) desde nuestra máquina física por medio del servicio SSH, ejecutamos el siguiente comando:

```shell
ssh username@x.x.x.x
```

Una vez ejecutado el comando anterior, SSH nos preguntará si realmente queremos conectarnos a esta máquina, puesto que nunca lo hemos hecho antes, podemos responder con "no" si no queremos o podemos responder con "yes" para iniciar la conexión, entonces SSH guardará la dirección de nuestra máquina virtual permanentemente por medio de una clave segura para que cada vez que realicemos una conexión a esa dirección, sea segura e inmediata puesto que ya nos hemos conectado anteriormente a ella.

Para eliminar esta conexión de nuestro sistema SSH y que nos vuelva a preguntar SSH si queremos realmente conectarnos a ella otra vez, ejecutamos el siguiente comando:

```shell
ssh-keygen -R x.x.x.x
```