// Función para manejar el clic en el botón
function manejarClicBoton() {
    // Mostrar un mensaje indicando que se ha hecho clic
    alert('Se ha hecho clic en el botón');

    // Desactivar el evento de clic después del primer clic
    miBoton.removeEventListener('click', manejarClicBoton);
}

// Obtener el elemento del botón por su ID
const miBoton = document.getElementById('miBoton');

// Agregar un evento de escucha para el clic en el botón
miBoton.addEventListener('click', manejarClicBoton);
