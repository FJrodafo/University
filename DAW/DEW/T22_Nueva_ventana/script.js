function abrirNuevaVentana() {
    var nuevaVentana = window.open('', 'Nueva_ventana', 'width=800,height=600,resizable=no');

    nuevaVentana.document.write('<h3>Ejemplo de Ventana Nueva</h3>');
    nuevaVentana.document.write('URL Completa: ' + nuevaVentana.location.href + '<br />');
    nuevaVentana.document.write('Protocolo utilizado: ' + nuevaVentana.location.protocol + '<br />');
    nuevaVentana.document.write('Nombre en código del navegador: ' + navigator.appCodeName + '<br />');

    if (navigator.javaEnabled()) {
        nuevaVentana.document.write('Java SI está disponible en esta ventana<br />');
    } else {
        nuevaVentana.document.write('Java NO está disponible en esta ventana<br />');
    }

    nuevaVentana.document.write('<iframe src="https://www.bing.com" width="800" height="600"></iframe>');
}

// Llamada a la función para abrir la nueva ventana
abrirNuevaVentana();

// Pedir al usuario que introduzca su nombre y apellidos
var nombreCompleto = prompt("Introduce tu nombre y apellidos:");

// Pedir al usuario el día de nacimiento
var diaNacimiento = prompt("Introduce el día de tu nacimiento:");

// Pedir al usuario el mes de nacimiento
var mesNacimiento = prompt("Introduce el mes de tu nacimiento:");

// Pedir al usuario el año de nacimiento
var anioNacimiento = prompt("Introduce el año de tu nacimiento:");

// Calcular la edad
var fechaNacimiento = new Date(anioNacimiento, mesNacimiento - 1, diaNacimiento);
var fechaActual = new Date();
var edad = fechaActual.getFullYear() - fechaNacimiento.getFullYear();

// Calcular la posición de la primera y última letra "A" en el nombre
var primeraA = nombreCompleto.indexOf("A") + 1;
var ultimaA = nombreCompleto.lastIndexOf("A") + 1;

// Calcular el coseno de 180 (180 es lo mismo que PI, lo único que 180 es expresado en grados y PI en radianes)
var coseno180 = Math.cos(Math.PI);

// Encontrar el número mayor en el array
var numeros = [34, 67, 23, 75, 35, 19];
var numeroMayor = Math.max(...numeros);

// Generar un número al azar
var numeroAzar = Math.floor(Math.random() * 1_000_000_000);

// Imprimir los resultados en la ventana principal
document.write('<h1>TAREA</h1><hr />');
document.write('Buenos días ' + nombreCompleto + '<br />');
document.write('Tu nombre tiene ' + nombreCompleto.length + ' caracteres, incluidos espacios.<br />');
document.write('La primera letra A de tu nombre está en la posición: ' + primeraA + '<br />');
document.write('La última letra A de tu nombre está en la posición: ' + ultimaA + '<br />');
document.write('Tu nombre menos las 3 primeras letras es: ' + nombreCompleto.slice(3) + '<br />');
document.write('Tu nombre todo en mayúsculas es: ' + nombreCompleto.toUpperCase() + '<br />');
document.write('Tu edad es: ' + edad + ' años.<br />');
document.write('Naciste un feliz ' + diaNacimiento + ' del mes ' + mesNacimiento + ' del año ' + anioNacimiento + '.<br />');
document.write('El coseno de 180 es: ' + coseno180 + '<br />');
document.write('El número mayor de (34,67,23,75,35,19) es: ' + numeroMayor + '<br />');
document.write('Ejemplo de número al azar: ' + numeroAzar);
