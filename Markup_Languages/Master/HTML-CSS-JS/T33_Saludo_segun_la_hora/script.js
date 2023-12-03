// Generar un número aleatorio entre 0 y 10
var numeroAleatorio = Math.floor(Math.random() * 11);

// Comprobar si el número es menor o igual a 5
if (numeroAleatorio <= 5) {
    // Redirigir al usuario a la página de Google
    window.location.href = "https://www.google.com";
} else {
    // Obtener la hora actual del sistema
    var horaActual = new Date().getHours();

    // Saludar al usuario según la hora del día
    var saludo;
    if (horaActual < 12) {
        saludo = "Buenos días";
    } else {
        saludo = "Buenas tardes, " + horaActual + " horas.";
    }

    // Mostrar un mensaje de saludo
    alert(saludo);
}
