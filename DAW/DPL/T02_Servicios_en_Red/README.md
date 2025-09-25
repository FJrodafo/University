## Índice

1. [Servicios en Red](#servicios-en-red)
    1. [Datagrama IPv4 (Segmento TCP)](#datagrama-ipv4-segmento-tcp)
    2. [Datagrama IPv4 (Datagrama de Usuario UDP)](#datagrama-ipv4-datagrama-de-usuario-udp)
    3. [Datagrama IPv4 (URL)](#datagrama-ipv4-url)
2. [Comandos útiles](#comandos-útiles)

## Servicios en Red

* Esquema

    ![Esquema (Foto)](https://raw.githubusercontent.com/FJrodafo/University/main/DAW/DPL/T01/Assets/Images/Esquema.png "Esquema")
* Datagrama IP

    ![Datagrama IP (Diagrama)](https://raw.githubusercontent.com/FJrodafo/University/main/DAW/DPL/T01/Assets/Diagrams/Exported/Datagrama_IP.drawio.svg "Datagrama IP")
* Segmento / Datagrama de Usuario

    ![Segmento / Datagrama de Usuario (Diagrama)](https://raw.githubusercontent.com/FJrodafo/University/main/DAW/DPL/T01/Assets/Diagrams/Exported/Segmento_-_Datagrama_de_Usuario.drawio.svg "Segmento / Datagrama de Usuario")
* Datagrama desde URL

    ![Datagrama desde URL (Diagrama)](https://raw.githubusercontent.com/FJrodafo/University/main/DAW/DPL/T01/Assets/Diagrams/Exported/Datagrama_desde_URL.drawio.svg "Datagrama desde URL")
### Datagrama IPv4 (Segmento TCP)

Captura con el sniffer `tcpdump` un datagrama IPv4:

```shell
tcpdump -c 1 -XX -n -vv dst port 80 & curl 192.168.1.100
```

* `tcpdump` Es el sniffer.

    * `-c 1` Captura solo 1 paquete y luego `tcpdump` termina (útil para no inundar la salida).
    * `-XX` Muestra el contenido del paquete en hex + ASCII. `-X` muestra carga útil (payload) en hex+ASCII, `-xx` añade también la cabecera de enlace (dependiendo de la versión ambas formas pueden variar). En la práctica `-XX` te da una vista completa del frame + payload.
    * `-n` No resuelve nombres: muestra IPs y puertos numéricos en vez de intentar resolver hostnames/servicios. Esto acelera la salida y evita ruido.
    * `-vv` Modo muy verboso: imprime más detalles (flags TCP, números de secuencia, opciones, etc.). `-v`, `-vv`, `-vvv` aumentan la verbosidad.
    * `dst port 80` Filtro BPF: solo paquetes cuyo puerto de destino sea 80. Es decir, paquetes dirigidos a puerto 80 (normalmente peticiones HTTP a un servidor).
    * `&` Operador del shell: lanza el proceso anterior (`tcpdump ...`) en segundo plano y la shell continua inmediatamente con el siguiente comando.
* `curl 192.168.1.100` Hace una petición HTTP GET a `http://192.168.1.100/` y vuelca la respuesta por stdout (la página, generalmente HTML).

    * `curl` (Client URL) en Linux permite transferir datos hacia o desde un servidor utilizando diversos protocolos como HTTP, HTTPS, FTP, entre otros, actuando como un cliente de red desde la línea de comandos. Por defecto usa el puerto 80 si no se indica otro y hace GET salvo que especifiques otra cosa.

```
16:23:45.931282 IP (tos 0x0, ttl 64, id 17474, offset 0, flags [DF], proto TCP (6), length 60)
    192.168.12.145.54588 > 192.168.1.110.80: Flags [S], cksum 0x8f7e (incorrect -> 0xd7c3), seq 3854757445, win 64240, options [mss 1460,sackOK,TS val 3705888642 ecr 0,nop,wscale 7], length 0
        0x0000:  18fd 748c 99df 0800 2750 f08e 0800 4500  ..t.....'P....E.
        0x0010:  003c 4442 4000 4006 672a c0a8 0c91 c0a8  .<DB@.@.g*......
        0x0020:  016e d53c 0050 e5c2 ee45 0000 0000 a002  .n.<.P...E......
        0x0030:  faf0 8f7e 0000 0204 05b4 0402 080a dce3  ...~............
        0x0040:  5f82 0000 0000 0103 0307                 _......…
```

![Datagrama IPv4 TCP (Captura)](https://raw.githubusercontent.com/FJrodafo/University/main/DAW/DPL/T01/Assets/Images/Datagrama_IPv4_TCP.png "Datagrama IPv4 TCP")

![Datagrama IPv4 TCP (Diagrama)](https://raw.githubusercontent.com/FJrodafo/University/main/DAW/DPL/T01/Assets/Diagrams/Exported/Datagrama_IPv4_TCP.drawio.svg "Datagrama IPv4 TCP")

- **Verde**: Versión del datagrama IP.
- **Rojo**: Protocolo incluido en la carga útil del datagrama IP (payload) que en la imagen tiene el valor 06 que se corresponde con TCP (para UDP el valor sería 11).
- **Cyan**: Dirección IP de origen, es decir, la máquina que envía el datagrama IP.
- **Magenta**: Dirección IP de destino, es decir, el host al que se destina el datagrama IP.
- **Amarillo**: Payload que en este caso es todo un segmento TCP.
- **Negrita**: El resto de campos de una cabecera IPv4.

![Segmento TCP (Captura)](https://raw.githubusercontent.com/FJrodafo/University/main/DAW/DPL/T01/Assets/Images/Segmento_TCP.png "Segmento TCP")

![Segmento TCP (Diagrama)](https://raw.githubusercontent.com/FJrodafo/University/main/DAW/DPL/T01/Assets/Diagrams/Exported/Segmento_TCP.drawio.svg "Segmento TCP")

- **Cyan**: El puerto origen del segmento TCP se corresponde con los dos primeros octetos de dicho segmento, es decir, 0xd53c (54588).
- **Magenta**: El puerto destino del segmento TCP se corresponde con los dos siguientes octetos, es decir, 0x0050 (80).
- **Amarillo** (La cabecera TCP ocupa el número de octetos = 4 * longitud_cabecera): La longitud de cabecera son los 4 bits más significativos del octeto número 13 de la cabecera, es decir, 0xa0 = 1010000, el valor decimal de 1010b = 10, por tanto, la cabecera TCP ocupa 4 * 10 = 40 octetos, el resto será el payload del segmento con los datos de la aplicación, en este caso sale 0 porque este segmento no transporta datos de la aplicación ya que se trata del primer segmento que inicia una conexión TCP con el flag SYN activado.

### Datagrama IPv4 (Datagrama de Usuario UDP)

Captura con el sniffer `tcpdump` una solicitud DNS que utiliza el protocolo UDP con destino al puerto 53:

```shell
tcpdump -c 1 -XX -n -vv udp dst port 53 & dig www.angelmelchor.pro
```

* `tcpdump` Es el sniffer.

    * `-c 1` Captura solo 1 paquete y luego `tcpdump` termina (útil para no inundar la salida).
    * `-XX` Muestra el contenido del paquete en hex + ASCII. `-X` muestra carga útil (payload) en hex+ASCII, `-xx` añade también la cabecera de enlace (dependiendo de la versión ambas formas pueden variar). En la práctica `-XX` te da una vista completa del frame + payload.
    * `-n` No resuelve nombres DNS. Muestra IPs numéricas. Evita retrasos por resolución inversa.
    * `-vv` Modo muy verboso: imprime más detalles (decodificación del DNS cuando sea posible). `-v`, `-vv`, `-vvv` aumentan la verbosidad.
    * `udp dst port 53` Filtro BPF: solo paquetes UDP cuyo puerto de destino sea 53, es decir, paquetes dirigidos hacia un servidor DNS.
    * `&` Operador del shell: lanza el proceso anterior (`tcpdump ...`) en segundo plano y la shell continua inmediatamente con el siguiente comando.
* `dig www.angelmelchor.pro` Ejecuta una consulta DNS (por defecto usa UDP hacia el servidor DNS configurado en `/etc/resolv.conf`) para resolver `www.angelmelchor.pro`.

    * `dig` (Domain Information Groper) en Linux se utiliza para consultar a servidores del Sistema de Nombres de Dominio (DNS) y obtener información sobre dominios y direcciones IP.

```
08:25:48.081970 IP (tos 0x0, ttl 64, id 1139, offset 0, flags [none], proto UDP (17), length 89)
    192.168.12.145.47985 > 8.8.8.8.53: [bad udp cksum 0xdd9f -> 0xffb5!] 21136+ [1au] A? www.angelmelchor.pro. ar: . OPT UDPsize=1232 [COOKIE 767b0baa1a5b968c] (61)
        0x0000:  18fd 748c 99df 0800 2750 f08e 0800 4500  ..t.....'P....E.
        0x0010:  0059 0473 0000 4011 98d8 c0a8 0c91 0808  .Y.s..@.........
        0x0020:  0808 bb71 0035 0045 dd9f 5290 0120 0001  ...q.5.E..R.....
        0x0030:  0000 0000 0001 0377 7777 0c61 6e67 656c  .......www.angel
        0x0040:  6d65 6c63 686f 7203 7072 6f00 0001 0001  melchor.pro.....
        0x0050:  0000 2904 d000 0000 0000 0c00 0a00 0876  ..)............v
        0x0060:  7b0b aa1a 5b96 8c                        {...[..
```

![Datagrama IPv4 UDP (Captura)](https://raw.githubusercontent.com/FJrodafo/University/main/DAW/DPL/T01/Assets/Images/Datagrama_IPv4_UDP.png "Datagrama IPv4 UDP")

![Datagrama IPv4 UDP (Diagrama)](https://raw.githubusercontent.com/FJrodafo/University/main/DAW/DPL/T01/Assets/Diagrams/Exported/Datagrama_IPv4_UDP.drawio.svg "Datagrama IPv4 UDP")

- **Verde**: Versión del datagrama IP.
- **Rojo**: Protocolo incluido en la carga útil del datagrama IP (payload) que en la imagen tiene el valor 11 que se corresponde con UDP (para TCP el valor sería 06).
- **Cyan**: Dirección IP de origen, es decir, la máquina que envía el datagrama IP.
- **Magenta**: Dirección IP de destino, es decir, el host al que se destina el datagrama IP.
- **Amarillo**: Payload que en este caso es todo un Datagrama de Usuario UDP.
- **Negrita**: El resto de campos de una cabecera IPv4.

![Datagrama de Usuario UDP (Captura)](https://raw.githubusercontent.com/FJrodafo/University/main/DAW/DPL/T01/Assets/Images/Datagrama_de_Usuario_UDP.png "Datagrama de Usuario UDP")

![Datagrama de Usuario UDP (Diagrama)](https://raw.githubusercontent.com/FJrodafo/University/main/DAW/DPL/T01/Assets/Diagrams/Exported/Datagrama_de_Usuario_UDP.drawio.svg "Datagrama de Usuario UDP")

- **Cyan**: El puerto origen del Datagrama de Usuario UDP se corresponde con los dos primeros octetos de dicho segmento, es decir, 0xbb71 (47985).
- **Magenta**: El puerto destino del Datagrama de Usuario UDP se corresponde con los dos siguientes octetos, es decir, 0x0035 (53).
- **Amarillo**: Todo el contenido que se pasará a la aplicación que escucha en el puerto 53 de la máquina destino.

### Datagrama IPv4 (URL)

Captura con el sniffer `tcpdump` una solicitud del cliente curl:

```shell
tcpdump -XX -n -vv 'tcp dst port 80 and (tcp[13] & 0x02 = 0)' & curl http://80.240.126.170/sub1/sub2/index.html
```

* `tcpdump` Es el sniffer.

    * `-XX` Muestra el contenido del paquete en hex + ASCII. `-X` muestra carga útil (payload) en hex+ASCII, `-xx` añade también la cabecera de enlace (dependiendo de la versión ambas formas pueden variar). En la práctica `-XX` te da una vista completa del frame + payload.
    * `-n` No resuelve nombres DNS. Muestra IPs numéricas. Evita retrasos por resolución inversa.
    * `-vv` Modo muy verboso: imprime más detalles (decodificación del DNS cuando sea posible). `-v`, `-vv`, `-vvv` aumentan la verbosidad.
    * `'tcp dst port 80 and (tcp[13] & 0x02 = 0)'` Filtro BPF (entre comillas para que el shell no interprete `()` o `&` de forma errónea).

        * `tcp dst port 80` Solo paquetes TCP cuyo puerto destino sea 80 (peticiones hacia el servidor HTTP).
        * `(tcp[13] & 0x02 = 0)` Comprobación a nivel de byte/bit del encabezado TCP:

            * `tcp[13]` Es el byte de las flags del TCP (el 14º byte del encabezado TCP, índice 13 empezando en 0).
            * `& 0x02` Aplica una máscara bit a bit para aislar el bit 0x02 (el bit SYN).
            * `= 0` Significa "el bit SYN no está puesto".
    * `&` Operador del shell: lanza el proceso anterior (`tcpdump ...`) en segundo plano y la shell continua inmediatamente con el siguiente comando.
* `curl http://80.240.126.170/sub1/sub2/index.html` Hace una petición HTTP GET al recurso indicado en el servidor con IP `80.240.126.170`.

    * `curl` (Client URL) en Linux permite transferir datos hacia o desde un servidor utilizando diversos protocolos como HTTP, HTTPS, FTP, entre otros, actuando como un cliente de red desde la línea de comandos. Imprimirá el cuerpo de la respuesta en stdout (la terminal) por defecto.

```
18:54:30.099831 IP (tos 0x0, ttl 64, id 4885, offset 0, flags [DF], proto TCP (6), length 150)
    192.168.12.145.35228 > 80.240.126.170.80: Flags [P.], cksum 0x9d5c (incorrect -> 0xf58f), seq 0:98, ack 1, win 502, options [nop,nop,TS val 2575528453 ecr 1002929104], length 98: HTTP, length: 98
        GET /sub1/sub2/index.html HTTP/1.1
        Host: 80.240.126.170
        User-Agent: curl/7.88.1
        Accept: */*

        0x0000:  18fd 748c 99df 0800 2750 f08e 0800 4500  ..t.....'P....E.
        0x0010:  0096 1315 4000 4006 8a79 c0a8 0c91 50f0  ....@.@..y....P.
        0x0020:  7eaa 899c 0050 6435 74fa d59e dcef 8018  ~....Pd5t.......
        0x0030:  01f6 9d5c 0000 0101 080a 9983 7205 3bc7  ...\........r.;.
        0x0040:  7bd0 4745 5420 2f73 7562 312f 7375 6232  {.GET./sub1/sub2
        0x0050:  2f69 6e64 6578 2e68 746d 6c20 4854 5450  /index.html.HTTP
        0x0060:  2f31 2e31 0d0a 486f 7374 3a20 3830 2e32  /1.1..Host:.80.2
        0x0070:  3430 2e31 3236 2e31 3730 0d0a 5573 6572  40.126.170..User
        0x0080:  2d41 6765 6e74 3a20 6375 726c 2f37 2e38  -Agent:.curl/7.8
        0x0090:  382e 310d 0a41 6363 6570 743a 202a 2f2a  8.1..Accept:.*/*
        0x00a0:  0d0a 0d0a
```

![Datagrama IPv4 URL (Captura)](https://raw.githubusercontent.com/FJrodafo/University/main/DAW/DPL/T01/Assets/Images/Datagrama_IPv4_URL.png "Datagrama IPv4 URL")

![Datagrama IPv4 URL (Diagrama)](https://raw.githubusercontent.com/FJrodafo/University/main/DAW/DPL/T01/Assets/Diagrams/Exported/Datagrama_IPv4_URL.drawio.svg "Datagrama IPv4 URL")

- **Verde**: Versión del datagrama IP.
- **Rojo**: Protocolo incluido en la carga útil del datagrama IP (payload) que en la imagen tiene el valor 06 que se corresponde con TCP (para UDP el valor sería 11).
- **Cyan**: Dirección IP de origen, es decir, la máquina que envía el datagrama IP.
- **Azul**: El puerto origen desde el que se envía el datagrama IP.
- **Magenta**: Dirección IP de destino, es decir, el host al que se destina el datagrama IP.
- **Púrpura**: El puerto destino al que se destina el datagrama IP, en este caso el puerto bien conocido del servidor (80).
- **Amarillo**: Payload que en este caso es la ruta hacia el archivo html.
- **Negrita**: El resto de campos de una cabecera IPv4.

## Comandos útiles

Visualizar IPs de la máquina en Linux `ip a` / Windows `ipconfig`

Para saber qué servicios (aplicaciones servidoras) se están ejecutando en un equipo Linux y en qué puertos están escuchando, utilizaremos el siguiente comando:

```shell
ss -putnl
```

Ejecutar un servidor de pruebas python.

```shell
cd Public/
python3 -m http.server 8000
```

> [!CAUTION]
> 
> Ejecutarlo en un directorio específico cuyo contenido quieres compartir, si lo ejecutas en la raiz, todas las máquinas que se conecten a tu servidor tienen acceso completo a todo el contenido de tu máquina!

<link rel="stylesheet" href="./../../../README.css">
<a class="scrollup" href="#top">&#x1F53C</a>