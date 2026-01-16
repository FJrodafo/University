## Índice

1. [Cifrado Simétrico](#cifrado-simétrico)
2. [Cirado Asimétrico](#cirado-asimétrico)

# Cifrado Simétrico

Una sola clave para cifrar y descifrar los datos.

## Paso 1: Crear la clave

Emisor y receptor tienen la misma clave.

## Paso 2: Cifrar el mensaje

El emisor usa la clave para cifrar el mensaje.

## Paso 3: Enviar el mensaje cifrado

Se envía el mensaje cifrado por la red.

## Paso 4: Descifrar el mensaje

El receptor usa la misma clave para recuperar el mensaje original.

## Ventajas y desventajas

Muy rápido, pero el problema es cómo enviar la clave de forma segura.

# Cirado Asimétrico

Dos claves distintas, pero relacionadas entre si (privada y pública) donde lo cifrado con la clave pública solo se puede descifrar con la clave privada relacionada.

## Paso 1: Crear las claves

El servidor crea una clave pública (se puede compartir) y una clave privada (secreta).

## Paso 2: Cifrar el mensaje

El emisor cifra el mensaje con la clave pública del receptor.

## Paso 3: Enviar el mensaje cifrado

Se envía el mensaje cifrado al receptor.

## Paso 4: Descifrar el mensaje

El receptor usa su clave privada para recuperar el mensaje original.

## Ventajas y desventajas

Muy seguro para intercambiar datos, pero es más lento que el cifrado simétrico y tienes que asegurarte de que la clave pública con la que cifras el mensaje, sea realmente la clave pública del receptor al que quieres enviarle el mensaje.