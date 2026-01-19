Emplea un archivo de configuración solo con las directivas que vayas a usar, no incluyas más directivas que las necesarias.

Debes subir al servidor de archivos la configuración de Nginx usada en el `/etc/nginx/sites-enabled`.

<details>
<summary>Estructura del proyecto</summary>

```
etc/
└── nginx/
    └── sites-available/
        └── examen
```
</details>

Despliega un servicio web con Nginx que cumpla lo siguiente:

1. Servicio HTTPS IPv4.
2. Puerto TCP bien conocido.
3. Tiene que ser el servidor por defecto.
4. Usa un certificado autofirmado (snakeoil).
5. Ubica el certificado y la clave en `/etc/nginx`.
6. La aplicación PHP se encuentra en el PC del profesor en `http://<ip_del_pc_del_profesor>/enunciados_dpl/app_php`.
7. Permite que se pueda ejecutar la aplicación cuando el cliente web usa la URL `https://<ip_de_tu_vps>` (Cuando actúas como proxy, ten en cuenta usar un `/` al final en la redirección).