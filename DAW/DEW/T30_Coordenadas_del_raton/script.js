// Obtener el elemento del contenedor de coordenadas
const infoCoordenadas = document.getElementById('infoCoordenadas');

// Función para actualizar el contenido del contenedor con las coordenadas
function actualizarCoordenadas(event) {
    const coordenadas = `X: ${event.clientX}, Y: ${event.clientY}`;
    infoCoordenadas.textContent = coordenadas;
}

// Agregar un evento de escucha para el movimiento del ratón
document.addEventListener('mousemove', actualizarCoordenadas);
