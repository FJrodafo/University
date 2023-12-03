// Función constructora para crear objetos Coche
function Coche(modelo, color, matricula, anio) {
    this.modelo = modelo;
    this.color = color;
    this.matricula = matricula;
    this.anio = anio;
}

// Base de datos de coches
const coches = {};

// Función para agregar un coche a la base de datos
function agregarCoche() {
    // Obtener valores del formulario
    const modelo = document.getElementById('modelo').value;
    const color = document.getElementById('color').value;
    const matricula = document.getElementById('matricula').value;
    const anio = document.getElementById('anio').value;

    // Validar que todos los campos estén llenos
    if (modelo && color && matricula && anio) {
        const nuevoCoche = new Coche(modelo, color, matricula, anio);
        coches[matricula] = nuevoCoche;
        console.log(`¡Coche con matrícula ${matricula} agregado correctamente!`);

        // Limpiar el formulario después de agregar el coche
        document.getElementById('agregarCocheForm').reset();

        // Mostrar la lista actualizada de coches
        mostrarTodosLosCoches();
    } else {
        alert('Por favor, completa todos los campos del formulario.');
    }
}

// Función para eliminar un coche de la base de datos
function eliminarCoche(matricula) {
    if (coches[matricula]) {
        delete coches[matricula];
        console.log(`¡Coche con matrícula ${matricula} eliminado correctamente!`);
    } else {
        alert(`No se encontró ningún coche con la matrícula ${matricula}`);
    }
}

// Función para eliminar un coche de la base de datos por matrícula
function eliminarCochePorMatricula() {
    const matricula = document.getElementById('eliminarCoche').value;
    if (matricula) {
        eliminarCoche(matricula);

        // Limpiar el formulario después de agregar el coche
        document.getElementById('eliminarCocheForm').reset();

        // Mostrar la lista actualizada de coches
        mostrarTodosLosCoches();
    } else {
        alert('Por favor, ingresa la matrícula del coche que deseas eliminar.');
    }
}

// Función para mostrar todos los coches en la base de datos
function mostrarTodosLosCoches() {
    const cochesTableBody = document.getElementById('cochesTable').getElementsByTagName('tbody')[0];
    cochesTableBody.innerHTML = '';

    for (const matricula in coches) {
        if (coches.hasOwnProperty(matricula)) {
            const coche = coches[matricula];
            const fila = cochesTableBody.insertRow();

            const celdaModelo = fila.insertCell(0);
            const celdaColor = fila.insertCell(1);
            const celdaMatricula = fila.insertCell(2);
            const celdaAnio = fila.insertCell(3);

            celdaModelo.textContent = coche.modelo;
            celdaColor.textContent = coche.color;
            celdaMatricula.textContent = coche.matricula;
            celdaAnio.textContent = coche.anio;
        }
    }
}
