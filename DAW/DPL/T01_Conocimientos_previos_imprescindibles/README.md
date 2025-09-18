## Índice

1. [Comandos de gestión y administración en Linux](#comandos-de-gestión-y-administración-en-linux)
2. [Chuleta rápida: Atajos de Nano y Vim](#chuleta-rápida-atajos-de-nano-y-vim)

## Comandos de gestión y administración en Linux

1. `su` (Substitute User)
    
    Sirve para cambiar de usuario dentro de la sesión actual.
    
    Muy usado para cambiar al usuario `root` (administrador).
    
    ```shell
    su # Pide la contraseña del usuario destino (por defecto root)
    ```

    También se puede cambiar a otro usuario:

    ```shell
    su nombre_usuario
    ```
2. `sudo` (Superuser Do)

    Ejecuta un comando con privilegios de administrador sin necesidad de cambiar a root.

    ```shell
    sudo apt update # Ejecuta el comando 'apt update' con permisos de root
    ```

    Mucho más seguro que `su`, porque solo da permisos para ese comando.
3. `ip` (Internet Protocol)

    Muestra y gestiona la configuración de red:

    ```shell
    ip addr # Muestra direcciones IP asignadas
    ip route # Muestra la tabla de rutas
    ip link set eth0 down # Apaga una interfaz de red
    ```
4. `hostname`

    Muestra o cambia el nombre del host (nombre del equipo en la red).

    ```shell
    hostname # Muestra el nombre actual
    sudo hostname servidor-web # Cambia temporalmente el hostname
    ```
5. `ss` (Socket Statistics)

    Herramienta para ver conexiones de red y puertos abiertos (más moderna que `netstat`).

    ```shell
    ss -tuln # Muestra qué puertos TCP/UDP están escuchando
    ```

    Útil para comprobar si un servidor web o base de datos está funcionando.
6. `echo`

    Imprime texto en pantalla o en un archivo.

    ```shell
    echo "Hola mundo"
    echo "127.0.0.1 localhost" | sudo tee -a /etc/hosts
    ```
7. `cat` (Concatenate)

    Muestra el contenido de un archivo.

    ```shell
    cat archivo.txt
    ```

    Tambien puede concatenar archivos:

    ```shell
    cat a.txt b.txt > combinado.txt
    ```
8. `more`

    Muestra el contenido de un archivo paginado (útil para archivos largos).

    ```shell
    more /etc/passwd # Pulsa 'espacio' para avanzar o 'q' para salir
    ```
9. `cd` (Change Directory)

    Cambia de directorio

    ```shell
    cd /var/www
    cd .. # Subir un nivel
    cd ~ # Ir al home del usuario
    ```
10. `mkdir` (Make Directory)

    Crea directorios.

    ```shell
    mkdir proyectos
    mkdir -p proyectos/dpl/practicas # Crea varios niveles a la vez
    ```
11. `ls` (List)

    Lista archivos y directorios.

    ```shell
    ls # Listado básico
    ls -l # Listado detallado
    ls -la # Incluye archivos ocultos
    ```
12. `cp` (Copy)

    Copia archivos y carpetas.

    ```shell
    cp archivo.txt copia.txt
    cp -r carpeta1 carpeta2 # Copiar directorios
    ```
13. `mv` (Move)

    Mueve o renombra archivos/carpetas.

    ```shell
    mv archivo.txt /home/usuario/
    mv viejo.txt nuevo.txt # Renombrar
    ```
14. `rm` (Remove)

    Elimina archivos o directorios.

    ```shell
    rm archivo.txt
    rm -r carpeta/ # Eliminar directorio y su contenido
    ```

    **⚠** No pide confirmación, elimina definitivamente.
15. `grep` (Global Regular Expression Print)

    Busca texto dentro de archivos.

    ```shell
    grep "root" /etc/passwd
    ```

    También combinado con otros comandos:

    ```shell
    ps aux | grep apache
    ```
16. `ssh` (Secure Shell)

    Conecta de forma segura a un servidor remoto.

    ```shell
    ssh usuario@192.168.1.100
    ```
17. `scp` (Secure Copy)

    Copia archivos de forma segura entre máquinas.

    ```shell
    scp archivo.txt usuario@192.168.1.100:/home/usuario/
    ```

    Copiar desde remoto a local:

    ```shell
    scp usuario@192.168.1.100:/var/log/error.log .
    ```
18. `apt` (Advanced Packaging Tool)

    Gestor de paquetes en Debian/Ubuntu.

    ```shell
    sudo apt update        # Actualizar lista de paquetes
    sudo apt upgrade       # Instalar actualizaciones
    sudo apt install nginx # Instalar software
    sudo apt remove nginx  # Desinstalar software
    ```
19. `nc` (Netcat)

    Herramienta de red versátil (depuración, transferencia, escaneo de puertos).

    ```shell
    nc -l 8080 # Abre un puerto de escucha en el 8080
    ```

    También se puede usar para comprobar si un puerto remoto está abierto:

    ```shell
    nc -zv 192.168.1.100 22
    ```

## Chuleta rápida: Atajos de Nano y Vim

* Nano (editor sencillo)

    | Atajo    | Acción          |
    | :------: | :-------------- |
    | Ctrl + O | Guardar archivo |
    | Ctrl + X | Salir           |
    | Ctrl + K | Cortar línea    |
    | Ctrl + U | Pegar línea     |
    | Ctrl + W | Buscar texto    |
    | Ctrl + G | Ayuda           |

* Vim (editor avanzado)

    | Atajo    | Acción                              |
    | :------: | :---------------------------------- |
    | i        | Entrar en modo inserción (escribir) |
    | Esc      | Volver a modo normal                |
    | :w       | Guardar archivo                     |
    | :q       | Salir                               |
    | :wq      | Guardar y salir                     |
    | :q!      | Salir sin guardar                   |
    | dd       | Borrar línea                        |
    | yy       | Copiar línea                        |
    | p        | Pegar                               |
    | u        | Deshacer                            |
    | /palabra | Buscar 'palabra' en el archivo      |
    | gg       | Ir al inicio del archivo            |
    | G        | Ir al final del archivo             |

<link rel="stylesheet" href="./../../../README.css">
<a class="scrollup" href="#top">&#x1F53C</a>