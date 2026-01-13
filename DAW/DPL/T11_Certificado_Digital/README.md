## Certificado Digital

Un certificado digital sirve para saber quién es el servidor, obtener su clave pública y confiar en que no es un impostor.

## Paso 1: El servidor pide un certificado

El dueño de la web genera un par de claves (pública y privada), posteriormente envía la clave pública y el dominio a una CA (Certificate Authority).

## Paso 2: La CA verifica al servidor

La CA comprueba que el dominio pertenece realmente a ese servidor ya sea por medio de una validación DNS (La CA pide crear un registro DNS especial `_acme-challenge.ejemplo.com TXT "token-único"`, si la CA puede leer ese registro, asume que el solicitante controla el dominio), validación por archivo HTTP/HTTPS (La CA pide colocar un archivo en `http://ejemplo.com/.well-known/pki-validation/archivo.txt` o en ACME `https://ejemplo.com/.well-known/acme-challenge/token`, si la CA puede acceder al archivo, asume que el solicitante controla el dominio) o validaciones adicionales según el tipo de certificado...

## Paso 3: La CA crea el certificado

La CA mete los datos (clave pública + dominio + otros datos) y los firma con su clave privada, así nace el certificado digital.

## Paso 4: El servidor envía el certificado

Cuando entras en una web HTTPS, el servidor manda su certificado a tu navegador.

## Paso 5: Tu navegador comprueba el certificado

Tu navegador verifica la firma digital usando la clave pública de la CA, comprueba que el certificado no ha caducado, el dominio coincide y que la CA es de confianza.

## Paso 6: Confianza establecida

Si todo es correcto, el navegador confía en la clave pública del servidor y ya puede empezar el cifrado HTTPS. Si algo falla, salta un aviso de seguridad por parte del navegador.

## Resumen

Un certificado digital es un documento que asocia una clave pública a un dominio y está firmado por una CA de confianza.

La CA genera el certificado digital calculando un hash de los datos del servidor y cifrándolo con su clave privada para crear la firma digital, que se adjunta al certificado.

![Certificado Digital](https://raw.githubusercontent.com/FJrodafo/University/main/DAW/DPL/T11_Certificado_Digital/Assets/diagrama.svg)