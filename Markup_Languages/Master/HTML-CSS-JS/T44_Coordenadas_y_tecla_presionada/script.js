// Obtener el elemento del contenedor de información
const infoContenedor = document.getElementById('infoContenedor');

// Función para actualizar el contenido del contenedor con las coordenadas
function actualizarCoordenadas(event) {
    const coordenadas = `X: ${event.clientX}, Y: ${event.clientY}`;
    infoContenedor.textContent = coordenadas;
}

// Función para actualizar el contenido del contenedor con la tecla pulsada
function actualizarTecla(event) {
    const teclaPulsada = `Tecla Pulsada: ${event.key}`;
    infoContenedor.textContent = teclaPulsada;
}

// Función para actualizar el contenido del contenedor con el mensaje de clic en el ratón
function mostrarClic() {
    infoContenedor.textContent = 'Clic en el ratón';
}

// Agregar eventos de escucha para el movimiento del ratón, pulsación de tecla y clic del ratón
document.addEventListener('mousemove', actualizarCoordenadas);
document.addEventListener('keydown', actualizarTecla);
document.addEventListener('click', mostrarClic);
