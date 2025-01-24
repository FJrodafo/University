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
function agregarCoche(modelo, color, matricula, anio) {
    const nuevoCoche = new Coche(modelo, color, matricula, anio);
    coches[matricula] = nuevoCoche;
    console.log(`¡Coche agregado! Modelo: ${modelo}, Color: ${color}, Matrícula: ${matricula}, Año: ${anio}.`);
}

// Función para eliminar un coche de la base de datos
function eliminarCoche(matricula) {
    if (coches[matricula]) {
        delete coches[matricula];
        console.log(`¡Coche con matrícula ${matricula} eliminado!`);
    } else {
        console.log(`No se encontró ningún coche con la matrícula ${matricula}`);
    }
}

// Función para mostrar todos los coches en la base de datos
function mostrarTodosLosCoches() {
    console.log("Lista de coches en la base de datos:");
    for (const matricula in coches) {
        if (coches.hasOwnProperty(matricula)) {
            const coche = coches[matricula];
            console.log(`\t· Modelo: ${coche.modelo}, Color: ${coche.color}, Matrícula: ${coche.matricula}, Año: ${coche.anio}`);
        }
    }
}

// Ejemplos de uso
agregarCoche("Toyota Camry", "Azul", "ABC123", 2020);
agregarCoche("Honda Civic", "Rojo", "XYZ789", 2019);
mostrarTodosLosCoches();
eliminarCoche("ABC123");
mostrarTodosLosCoches();
