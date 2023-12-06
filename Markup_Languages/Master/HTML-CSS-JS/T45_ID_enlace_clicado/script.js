// Función para manejar el clic en los enlaces
function manejarClicEnlace(event) {
    // Evitar la acción predeterminada del enlace
    event.preventDefault();

    // Obtener el ID del enlace clicado
    const enlaceClicado = event.target.id;

    // Mostrar un mensaje indicando que se ha hecho clic en el enlace
    alert(`Se ha hecho clic en ${enlaceClicado}`);
}

// Obtener los elementos de enlace por su ID y agregar eventos de escucha
const enlace1 = document.getElementById('enlace1');
const enlace2 = document.getElementById('enlace2');
const enlace3 = document.getElementById('enlace3');

enlace1.addEventListener('click', manejarClicEnlace);
enlace2.addEventListener('click', manejarClicEnlace);
enlace3.addEventListener('click', manejarClicEnlace);
