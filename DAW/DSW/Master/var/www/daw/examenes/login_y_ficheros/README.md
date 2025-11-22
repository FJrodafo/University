## Enunciado

Escribe un script en PHP que muestre al usuario un formulario en el que le pida su usuario y su contraseña de acceso.

Este script podemos llamarlo `login.php`.

Una vez introducidos el usuario y la contraseña se le pasarán los datos a otro script llamado `chequear_login.php`.

Este segundo script se encargará de acceder al fichero `accesos.txt` y leer las diferentes líneas contenidas en el fichero verificando si contiene un nombre de usuario y una contraseña que coincidan con las indicadas por el usuario.

Si los datos indicados por el usuario coinciden con algún par usuario:contraseña almacenados el dicho fichero se llamará al script `frases.php`.

Este script le mostrará al usuario las frases contenidas en su fichero (`frases_usuario1.txt` o `frases_usuario2.txt` dependiendo del usuario) y le dará la posibilidad de añadir una nueva frase o volver a la página inicial.

Si el fichero no existe se creará y se informará al usuario de que el fichero no existía pero fue creado y le dará la posibilidad de introducir en él una frase o volver al formulario inicial.

Si el usuario decide añadir una frase, la aplicación actualizará el contenido del fichero y le volverá a mostrar el contenido del fichero y la posibilidad de añadir una nueva frase.

Así hasta que el usuario decida salir a la página inicial.

Inicialmente los ficheros no existen y serán creados la primera vez que se ejecute la aplicación.

En caso de que los datos pasados por el usuario no coincidan con los almacenados en `accesos.txt`, se informará al usuario de que los datos han sido incorrectos y se volverá a pedir usuario y contraseña.

Para saber qué fichero mostrar al usuario, debemos crear una sesión que identifique al usuario.

Dependiendo del usuario que inicie la sesión se trabajará con el fichero `frases_usuario1.txt` o `frases_usuario2.txt`.

Los datos de usuario y contraseña deben ser pasados al script `chequear_login.php` por el método POST.