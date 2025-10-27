document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('contactoForm');

    form.addEventListener('submit', function(event) {
        event.preventDefault();

        // 1. Obtener valores del formulario
        const nombre = document.getElementById('nombre').value.trim();
        const email = document.getElementById('email').value.trim();
        const asunto = document.getElementById('asunto').value.trim();
        const mensaje = document.getElementById('mensaje').value.trim();

        // 2. Validaciones básicas
        if (!nombre || !email || !asunto || !mensaje) {
            alert('Por favor, completa todos los campos.');
            return;
        }

        // 3. Simulación de envío y reseteo del formulario
        alert('¡Mensaje enviado con éxito! (Simulación)\n\nGracias por contactarnos, ' + nombre + '.');
        form.reset();
    });
});