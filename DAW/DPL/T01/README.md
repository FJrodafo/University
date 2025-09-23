## Índice

1. [Comandos de gestión y administración en Linux](#comandos-de-gestión-y-administración-en-linux)
2. [Chuleta rápida: Atajos de Nano y Vim](#chuleta-rápida-atajos-de-nano-y-vim)
3. [Chuleta rápida: tcpdump](#chuleta-rápida-tcpdump)
4. [Servicios en Red](#servicios-en-red)

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

## Chuleta rápida: tcpdump

`tcpdump` es un sniffer de línea de comandos que captura y muestra paquetes de red en una interfaz. Permite depurar aplicaciones, analizar tráfico y guardar capturas para Wireshark.

* Opciones más útiles

    | Opción            | Descripción                                  |
    | :---------------: | :------------------------------------------- |
    | `-i <iface>`      | Slecciona interfaz (ej. eth0, any)           |
    | `-nn`             | No resolver nombres (IPs y puestos en bruto) |
    | `-v / -vv / -vvv` | Niveles de detalle (verbose)                 |
    | `-c <n>`          | Capturar solo n paquetes                     |
    | `-s 0`            | Captura completa de cada paquete             |
    | `-w <fichero>`    | Guardar en archivo .pcap                     |
    | `-r <fichero>`    | Leer captura .pcap                           |
    | `-A`              | Mostrar payload en ASCII                     |
    | `-X`              | Mostrar payloads en hex + ASCII              |
    | `-S`              | Números de secuencia TCP absolutos           |
    | `-tttt`           | Timestamp detallado                          |
    | `-e`              | Mostrar MACs (capa de enlace)                |
* Filtros BPF comunes

    | Filtro     | Ejemplo                        |
    | :--------: | :----------------------------- |
    | host       | host 192.168.1.10              |
    | src / dst  | src 10.0.0.5 / dst example.com |
    | port       | tcp port 80 / udp port 53      |
    | portrange  | portrange 8000-8080            |
    | net        | net 192.168.1.0/24             |
    | icmp / arp | icmp / arp                     |
    | Combinar   | host 10.0.0.5 and port 22      |
* Ejemplos prácticos

    ```shell
    sudo tcpdump -i eth0 -nn -c 100 # Capturar 100 paquetes en eth0
    sudo tcpdump -i eth0 -nn -A 'tcp port 80' # Ver HTTP en ASCII
    sudo tcpdump -i eth0 -nn -s 0 -w captura.pcap # Guardar en archivo
    tcpdump -nn -r captura.pcap # Leer archivo pcap
    sudo tcpdump -i eth0 -nn 'tcp port 3306' # Tráfico MySQL
    sudo tcpdump -i eth0 -nn host 203.0.113.5 # Tráfico hacia/desde host
    sudo tcpdump -i eth0 -nn 'tcp[tcpflags] & (tcp-syn) !=0' # Paquetes SYN
    sudo tcpdump -i eth0 -e -nn # Mostrar MAC además de IP
    ```
* Buenas prácticas:

    - Usa `sudo` para permisos.
    - Captura solo lo necesario (-c, -C, filtros).
    - HTTPS/TLS está cifrado: verás cabeceras, no el contenido.
    - Guarda en .pcap y usa Wireshark para análisis avanzado.

## Servicios en Red

* Esquema realizado en clase:

    ![Esquema](https://raw.githubusercontent.com/FJrodafo/University/main/DAW/DPL/T01/Assets/Esquema_realizado_en_clase.png)
* Datagrama IP con un payload compuesto por un segmento TCP:

    ![Datagrama IP](https://raw.githubusercontent.com/FJrodafo/University/main/DAW/DPL/T01/Assets/Datagrama_IP.png)
* Datagrama IPv4:

    Captura con el sniffer `tcpdump` de linux un datagrama IPv4

    ```shell
    tcpdump -c 1 -XX -n -vv dst port 80 & curl 192.168.1.100
    ```

    - `tcpdump` Es el sniffer.
    - `-c 1` Captura solo 1 paquete y luego `tcpdump` termina.
    - `-XX` Muestra el contenido del paquete en hex + ASCII. `-X` muestra carga útil (payload) en hex+ASCII, `-xx` añade también la cabecera de enlace (dependiendo de la versión ambas formas pueden variar). En la práctica `-XX` te da una vista completa del frame + payload.
    - `-n` No resuelve nombres: muestra IPs y puertos numéricos en vez de intentar resolver hostnames/servicios. Esto acelera la salida y evita ruido.
    - `-vv` Modo muy verboso: imprime más detalles (flags TCP, números de secuencia, opciones, etc.). `-v`, `-vv`, `-vvv` aumentan la verbosidad.
    - `dst port 80` Filtro BPF: solo paquetes cuyo puerto de destino sea 80. Es decir, paquetes dirigidos a puerto 80 (normalmente peticiones HTTP a un servidor).
    - `&` Operador del shell: lanza el proceso anterior (`tcpdump ...`) en segundo plano y la shell continua inmediatamente con el siguiente comando.
    - `curl 192.168.1.100` Hace una petición HTTP GET a `http://192.168.1.100/` y vuelca la respuesta por stdout (la página, generalmente HTML). `curl` por defecto usa el puerto 80 si no se indica otro y hace GET salvo que especifiques otra cosa.

    ![Captura del sniffer](https://raw.githubusercontent.com/FJrodafo/University/main/DAW/DPL/T01/Assets/Captura_del_sniffer.png)

    - **Verde**: Versión del datagrama IP.
    - **Rojo**: Protocolo incluido en la carga útil del datagrama IP (payload) que en la imagen tiene el valor 06 que se corresponde con TPC (para UDP el valor sería 11).
    - **Naranja**: Dirección IP de origen, es decir, la máquina que envía el datagrama IP.
    - **Lila**: Dirección IP de destino, es decir, el host al que se destina el datagrama IP.
    - **Amarillo**: Payload que en este caso es todo un segmento TCP.
    - **Negro**: El resto de campos de una cabecera IPv4.
* Datagrama IP con los datos de la captura del sniffer:

    ![Datagrama IP](https://raw.githubusercontent.com/FJrodafo/University/main/DAW/DPL/T01/Assets/Datagrama_IP_con_datos.png)
* Segmento/Datagrama de Usuario:

    ![Datagrama de Usuario](https://raw.githubusercontent.com/FJrodafo/University/main/DAW/DPL/T01/Assets/Segmento_-_Datagrama_de_Usuario.png)

<link rel="stylesheet" href="./../../../README.css">
<a class="scrollup" href="#top">&#x1F53C</a>