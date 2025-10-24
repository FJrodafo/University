document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('registroForm');
    const fechaInput = document.getElementById('fecha');

    // Establecer la fecha mínima para el input de fecha (mañana)
    const manana = new Date();
    manana.setDate(manana.getDate() + 1);
    const mananaString = manana.toISOString().split('T')[0];
    fechaInput.setAttribute('min', mananaString);

    form.addEventListener('submit', function(event) {
        event.preventDefault();

        // 1. Obtener valores del formulario
        const nombre = document.getElementById('nombre').value.trim();
        const email = document.getElementById('email').value.trim();
        const destino = document.getElementById('destino').value;
        const personas = document.getElementById('personas').value;
        const fecha = document.getElementById('fecha').value;
        const comentarios = document.getElementById('comentarios').value.trim();

        // 2. Validaciones
        if (!nombre || !email || !destino || !personas || !fecha) {
            alert('Por favor, completa todos los campos obligatorios.');
            return;
        }

        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(email)) {
            alert('Por favor, introduce un correo electrónico válido.');
            return;
        }

        const fechaSeleccionada = new Date(fecha);
        const hoy = new Date();
        hoy.setHours(23, 59, 59, 999); // Final del día de hoy

        if (fechaSeleccionada <= hoy) {
            alert('La fecha de viaje debe ser una fecha futura.');
            return;
        }

        // 3. Crear objeto del cliente
        const nuevoCliente = {
            nombre,
            email,
            destino,
            personas,
            fecha,
            comentarios: comentarios || 'Ninguno'
        };

        // 4. Guardar en LocalStorage
        let clientes = JSON.parse(localStorage.getItem('clientes')) || [];
        clientes.push(nuevoCliente);
        localStorage.setItem('clientes', JSON.stringify(clientes));

        // 5. Mensaje de éxito y reseteo del formulario
        alert('¡Registro exitoso! La información ha sido guardada. Puedes ver la lista de clientes en la página correspondiente.');
        form.reset();
    });
});