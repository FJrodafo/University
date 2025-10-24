document.addEventListener('DOMContentLoaded', function() {
    const tablaBody = document.getElementById('clientes-tabla-body');
    const noClientesMsg = document.getElementById('no-clientes');
    const tableContainer = document.querySelector('.table-responsive');
    const editModalElement = document.getElementById('editClientModal');
    const editModal = new bootstrap.Modal(editModalElement);
    const editForm = document.getElementById('editForm');

    let clientes = [];

    // Función para renderizar (dibujar) la tabla de clientes
    function renderTable() {
        tablaBody.innerHTML = '';
        clientes = JSON.parse(localStorage.getItem('clientes')) || [];

        if (clientes.length === 0) {
            noClientesMsg.style.display = 'block';
            tableContainer.style.display = 'none';
        } else {
            noClientesMsg.style.display = 'none';
            tableContainer.style.display = 'block';
            clientes.forEach((cliente, index) => {
                const fila = document.createElement('tr');
                fila.innerHTML = `
                    <td>${cliente.nombre}</td>
                    <td>${cliente.email}</td>
                    <td>${cliente.destino}</td>
                    <td>${cliente.personas}</td>
                    <td>${cliente.fecha}</td>
                    <td>
                        <button class="btn btn-primary btn-sm btn-editar" data-index="${index}" title="Editar cliente">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"/>
                            </svg>
                            Editar
                        </button>
                        <button class="btn btn-danger btn-sm btn-eliminar" data-index="${index}" title="Eliminar cliente">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                                <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5M8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5m3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0"/>
                            </svg>
                            Eliminar
                        </button>
                    </td>
                `;
                tablaBody.appendChild(fila);
            });
        }
    }

    // Función para manejar la eliminación de un cliente
    function handleDelete(index) {
        const clienteAEliminar = clientes[index];
        if (confirm(`¿Estás seguro de que deseas eliminar a ${clienteAEliminar.nombre}? Esta acción no se puede deshacer.`)) {
            clientes.splice(index, 1); // Elimina el cliente del array
            localStorage.setItem('clientes', JSON.stringify(clientes)); // Actualiza el localStorage
            renderTable(); // Vuelve a dibujar la tabla
            alert('Cliente eliminado con éxito.');
        }
    }

    // Función para manejar la edición (abre el modal con los datos)
    function handleEdit(index) {
        const cliente = clientes[index];
        document.getElementById('edit-client-index').value = index;
        document.getElementById('edit-nombre').value = cliente.nombre;
        document.getElementById('edit-email').value = cliente.email;
        document.getElementById('edit-destino').value = cliente.destino;
        document.getElementById('edit-personas').value = cliente.personas;
        document.getElementById('edit-fecha').value = cliente.fecha;
        editModal.show();
    }

    // Usamos delegación de eventos para manejar los clics en los botones
    tablaBody.addEventListener('click', function(event) {
        const target = event.target.closest('button'); // Busca el botón más cercano al clic
        if (!target) return;

        const index = target.getAttribute('data-index');

        if (target.classList.contains('btn-eliminar')) {
            handleDelete(index);
        }

        if (target.classList.contains('btn-editar')) {
            handleEdit(index);
        }
    });

    // Event listener para guardar los cambios del formulario de edición
    editForm.addEventListener('submit', function(event) {
        event.preventDefault();
        const index = document.getElementById('edit-client-index').value;

        if (index === null || index === '') return;

        const clienteActualizado = {
            nombre: document.getElementById('edit-nombre').value.trim(),
            email: document.getElementById('edit-email').value.trim(),
            destino: document.getElementById('edit-destino').value,
            personas: document.getElementById('edit-personas').value,
            fecha: document.getElementById('edit-fecha').value,
            comentarios: clientes[index].comentarios // Mantenemos los comentarios originales
        };

        // Validaciones básicas
        if (!clienteActualizado.nombre || !clienteActualizado.email || !clienteActualizado.destino || !clienteActualizado.personas || !clienteActualizado.fecha) {
            alert('Por favor, completa todos los campos.');
            return;
        }

        clientes[index] = clienteActualizado; // Actualiza el cliente en el array
        localStorage.setItem('clientes', JSON.stringify(clientes)); // Guarda en localStorage

        editModal.hide(); // Oculta el modal
        renderTable(); // Vuelve a dibujar la tabla con los datos actualizados
        alert('Cliente actualizado con éxito.');
    });

    // Carga inicial de la tabla
    renderTable();
});