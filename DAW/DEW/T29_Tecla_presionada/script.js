// Obtener el elemento de entrada de texto por su ID
const inputCampo = document.getElementById('inputCampo');

// Agregar un evento de escucha para el evento 'keydown' (tecla presionada)
inputCampo.addEventListener('keydown', function (event) {
    // Mostrar un mensaje de alerta con el código de la tecla presionada
    alert(`Tecla presionada: ${event.key}`);
});
