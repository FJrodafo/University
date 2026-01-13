## Firma Digital

Una firma digital sirve para saber quién envía el mensaje y que el mensaje no ha sido modificado.

## Paso 1: Crear el mensaje

El emisor escribe un mensaje.

```txt
"Hola, mundo!"
```

## Paso 2: Calcular el HASH del mensaje

El emisor calcula el hash del mensaje.

```txt
"X8F3A9"
```

## Paso 3: Crear la firma digital

El emisor toma el hash del mensaje y lo cifra junto con su clave privada, eso es la firma digital.

```txt
Hash del mensaje + Clave privada = Firma digital
```

## Paso 4: Enviar el resultado

El emisor envía el mensaje original junto con la firma digital y la clave pública del emisor.

## Paso 5: Verificación

El receptor recibe el mensaje original junto con la firma digital y la clave pública del emisor.

El receptor descifra la firma digital con la clave pública del emisor para obtener el hash.

El receptor calcula el hash del mensaje recibido.

El receptor compara los dos hashes. Si los hashes son idénticos, significa que el emisor es quien dice ser. Si los hashes no coinciden, significa que el mensaje ha sido modificado por un tercero.

## Resumen

Una firma digital es un hash del mensaje cifrado con la clave privada del emisor, que permite verificar la identidad del emisor y la integridad del mensaje.

![Firma Digital](https://raw.githubusercontent.com/FJrodafo/University/main/DAW/DPL/T10_Firma_Digital/Assets/diagrama.svg)