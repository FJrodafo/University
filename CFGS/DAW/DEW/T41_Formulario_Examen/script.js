// Definir persona;
let persona = null;

// Función para crear una nueva persona
function crearPersona() {
    // Obtener el valor de los campos
    let nombre = document.getElementById('nombre').value.trim();
    let apellidos = document.getElementById('apellidos').value.trim();
    let sexo = document.getElementById('sexo').value.trim().toUpperCase();
    let edad = document.getElementById('edad').value.trim();
    let dni = document.getElementById('dni').value.trim().toUpperCase();
    let telefono = document.getElementById('telefono').value.trim();
    let email = document.getElementById('email').value.trim();
    let fdn = document.getElementById('fdn').value.trim();
    let provincia = document.getElementById('provincia').value.trim();

    try {
        // Validaciones
        validarCamposFormulario(nombre, apellidos, sexo, edad, dni, telefono, email, fdn, provincia);
        // Crear persona
        persona = new Persona(nombre, apellidos, sexo, edad, dni, telefono, email, fdn, provincia);
        // Mostrar datos de la nueva persona
        document.getElementById('datos').value = persona.mostrarInformacion();
        // Limpiar el formulario al crear la persona
        limpiarFormulario();
    } catch (error) {
        alert(error.message);
    }
}

// Función para limpiar los campos del formulario
function limpiarFormulario() {
    document.getElementById('nombre').value = '';
    document.getElementById('apellidos').value = '';
    document.getElementById('sexo').value = '';
    document.getElementById('edad').value = '';
    document.getElementById('dni').value = '';
    document.getElementById('telefono').value = '';
    document.getElementById('email').value = '';
    document.getElementById('fdn').value = '';
    document.getElementById('provincia').value = '';
}

// Función para modificar el nombre de la persona
function modificarNombre() {
    if (persona) {
        persona.modificarNombre();
        document.getElementById('datos').value = persona.mostrarInformacion();
    }
}

// Función para modificar los apellidos de la persona
function modificarApellidos() {
    if (persona) {
        persona.modificarApellidos();
        document.getElementById('datos').value = persona.mostrarInformacion();
    }
}

// Función para modificar el sexo de la persona
function modificarSexo() {
    if (persona) {
        persona.modificarSexo();
        document.getElementById('datos').value = persona.mostrarInformacion();
    }
}

// Función para modificar la edad de la persona
function modificarEdad() {
    if (persona) {
        persona.modificarEdad();
        document.getElementById('datos').value = persona.mostrarInformacion();
    }
}

// Función para modificar el DNI de la persona
function modificarDni() {
    if (persona) {
        persona.modificarDni();
        document.getElementById('datos').value = persona.mostrarInformacion();
    }
}

// Función para modificar el teléfono de la persona
function modificarTelefono() {
    if (persona) {
        persona.modificarTelefono();
        document.getElementById('datos').value = persona.mostrarInformacion();
    }
}

// Función para modificar el email de la persona
function modificarEmail() {
    if (persona) {
        persona.modificarEmail();
        document.getElementById('datos').value = persona.mostrarInformacion();
    }
}

// Función para modificar la fecha de nacimiento de la persona
function modificarFdn() {
    if (persona) {
        persona.modificarFdn();
        document.getElementById('datos').value = persona.mostrarInformacion();
    }
}

// Función para modificar la provincia de la persona
function modificarProvincia() {
    if (persona) {
        persona.modificarProvincia();
        document.getElementById('datos').value = persona.mostrarInformacion();
    }
}

// Función para agregar información al historial
function agregarHistorial() {
    if (persona) {
        persona.agregarHistorial();
        let text = '';
        /*for (let i = 0; i < persona.historial.length; i++) {
            text += `ID: ${persona.historial[i].ID}\nAño: ${persona.historial[i].anio}\nTrabajo: ${persona.historial[i].trabajo}\nHobby: ${persona.historial[i].hobby}\n----\n`;
        }*/
        for (let i of persona.historial) {
            text += `ID: ${i.ID}\nAño: ${i.anio}\nTrabajo: ${i.trabajo}\nHobby: ${i.hobby}\n----\n`;
        }
        document.getElementById('historial').value = text;
    }
}

// Función para eliminar información del historial
function eliminarHistorial() {
    if (persona) {
        persona.eliminarHistorial();
        let text = '';
        /*for (let i = 0; i < persona.historial.length; i++) {
            text += `ID: ${persona.historial[i].ID}\nAño: ${persona.historial[i].anio}\nTrabajo: ${persona.historial[i].trabajo}\nHobby: ${persona.historial[i].hobby}\n----\n`;
        }*/
        for (let i of persona.historial) {
            text += `ID: ${i.ID}\nAño: ${i.anio}\nTrabajo: ${i.trabajo}\nHobby: ${i.hobby}\n----\n`;
        }
        document.getElementById('historial').value = text;
    }
}

// Función para modificar información del historial
function modificarHistorial() {
    if (persona) {
        persona.modificarHistorial();
        let text = '';
        /*for (let i = 0; i < persona.historial.length; i++) {
            text += `ID: ${persona.historial[i].ID}\nAño: ${persona.historial[i].anio}\nTrabajo: ${persona.historial[i].trabajo}\nHobby: ${persona.historial[i].hobby}\n----\n`;
        }*/
        for (let i of persona.historial) {
            text += `ID: ${i.ID}\nAño: ${i.anio}\nTrabajo: ${i.trabajo}\nHobby: ${i.hobby}\n----\n`;
        }
        document.getElementById('historial').value = text;
    }
}

// Función para limpiar los datos y el historial de la persona
function resetear() {
    if (confirm('¿Desea resetear la aplicación?')) {
        document.getElementById('datos').value = '';
        document.getElementById('historial').value = '';
        window.location.reload();
    }
}

/*
// DOMContentLoaded
document.addEventListener('DOMContentLoaded', (event) => {
    // ...
});
*/

/*
// DOM Level 1
// Asignar las funciones a cada botón
document.getElementById('crearPersona').onclick = crearPersona;
document.getElementById('limpiarFormulario').onclick = limpiarFormulario;
document.getElementById('modificarNombre').onclick = modificarNombre;
document.getElementById('modificarApellidos').onclick = modificarApellidos;
document.getElementById('modificarSexo').onclick = modificarSexo;
document.getElementById('modificarEdad').onclick = modificarEdad;
document.getElementById('modificarDni').onclick = modificarDni;
document.getElementById('modificarTelefono').onclick = modificarTelefono;
document.getElementById('modificarEmail').onclick = modificarEmail;
document.getElementById('modificarFdn').onclick = modificarFdn;
document.getElementById('modificarProvincia').onclick = modificarProvincia;
document.getElementById('agregarHistorial').onclick = agregarHistorial;
document.getElementById('eliminarHistorial').onclick = eliminarHistorial;
document.getElementById('modificarHistorial').onclick = modificarHistorial;
document.getElementById('resetear').onclick = resetear;
*/

// DOM Level 2
// Función para asignar eventos a los botones
function asignarEventos() {
    document.getElementById('crearPersona').addEventListener('click', crearPersona);
    document.getElementById('limpiarFormulario').addEventListener('click', limpiarFormulario);
    document.getElementById('modificarNombre').addEventListener('click', modificarNombre);
    document.getElementById('modificarApellidos').addEventListener('click', modificarApellidos);
    document.getElementById('modificarSexo').addEventListener('click', modificarSexo);
    document.getElementById('modificarEdad').addEventListener('click', modificarEdad);
    document.getElementById('modificarDni').addEventListener('click', modificarDni);
    document.getElementById('modificarTelefono').addEventListener('click', modificarTelefono);
    document.getElementById('modificarEmail').addEventListener('click', modificarEmail);
    document.getElementById('modificarFdn').addEventListener('click', modificarFdn);
    document.getElementById('modificarProvincia').addEventListener('click', modificarProvincia);
    document.getElementById('agregarHistorial').addEventListener('click', agregarHistorial);
    document.getElementById('eliminarHistorial').addEventListener('click', eliminarHistorial);
    document.getElementById('modificarHistorial').addEventListener('click', modificarHistorial);
    document.getElementById('resetear').addEventListener('click', resetear);
}

// Llamar a la función de asignación de eventos cuando se carga la página
window.onload = asignarEventos;

/*
// DOM Level 3
// Función para asignar eventos a los botones
function asignarEventos() {
    document.getElementById('crearPersona').addEventListener('click', crearPersona);
    document.getElementById('limpiarFormulario').addEventListener('click', limpiarFormulario);
    document.getElementById('modificarNombre').addEventListener('click', modificarNombre);
    document.getElementById('modificarApellidos').addEventListener('click', modificarApellidos);
    document.getElementById('modificarSexo').addEventListener('click', modificarSexo);
    document.getElementById('modificarEdad').addEventListener('click', modificarEdad);
    document.getElementById('modificarDni').addEventListener('click', modificarDni);
    document.getElementById('modificarTelefono').addEventListener('click', modificarTelefono);
    document.getElementById('modificarEmail').addEventListener('click', modificarEmail);
    document.getElementById('modificarFdn').addEventListener('click', modificarFdn);
    document.getElementById('modificarProvincia').addEventListener('click', modificarProvincia);
    document.getElementById('agregarHistorial').addEventListener('click', agregarHistorial);
    document.getElementById('eliminarHistorial').addEventListener('click', eliminarHistorial);
    document.getElementById('modificarHistorial').addEventListener('click', modificarHistorial);
    document.getElementById('resetear').addEventListener('click', resetear);
}

// Función para eliminar eventos de los botones
function eliminarEventos() {
    document.getElementById('crearPersona').removeEventListener('click', crearPersona);
    document.getElementById('limpiarFormulario').removeEventListener('click', limpiarFormulario);
    document.getElementById('modificarNombre').removeEventListener('click', modificarNombre);
    document.getElementById('modificarApellidos').removeEventListener('click', modificarApellidos);
    document.getElementById('modificarSexo').removeEventListener('click', modificarSexo);
    document.getElementById('modificarEdad').removeEventListener('click', modificarEdad);
    document.getElementById('modificarDni').removeEventListener('click', modificarDni);
    document.getElementById('modificarTelefono').removeEventListener('click', modificarTelefono);
    document.getElementById('modificarEmail').removeEventListener('click', modificarEmail);
    document.getElementById('modificarFdn').removeEventListener('click', modificarFdn);
    document.getElementById('modificarProvincia').removeEventListener('click', modificarProvincia);
    document.getElementById('agregarHistorial').removeEventListener('click', agregarHistorial);
    document.getElementById('eliminarHistorial').removeEventListener('click', eliminarHistorial);
    document.getElementById('modificarHistorial').removeEventListener('click', modificarHistorial);
    document.getElementById('resetear').removeEventListener('click', resetear);
}

// Llamar a la función de asignación de eventos cuando se carga la página
window.addEventListener('load', asignarEventos);

// Llamar a la función de eliminación de eventos al descargar la página
window.addEventListener('unload', eliminarEventos);
*/
