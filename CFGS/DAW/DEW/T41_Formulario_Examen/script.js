// Definir persona;
let persona = null;

// Función para validar el DNI
function validarDNI(dni) {
    var numero, letr, letra;
    var expresion_regular_dni = /^[XYZ]?\d{5,8}[A-Z]$/;

    dni = dni.toUpperCase();

    if (expresion_regular_dni.test(dni) === true) {
        numero = dni.substr(0, dni.length - 1);
        numero = numero.replace('X', 0);
        numero = numero.replace('Y', 1);
        numero = numero.replace('Z', 2);
        letr = dni.substr(dni.length - 1, 1);
        numero = numero % 23;
        letra = 'TRWAGMYFPDXBNJZSQVHLCKET';
        letra = letra.substring(numero, numero + 1);
        if (letra != letr) {
            return false;
        } else {
            return true;
        }
    } else {
        return false;
    }
}

// Función para crear una nueva persona
function crearPersona() {
    // Obtener el valor de los campos
    let nombre = document.getElementById('nombre').value.trim();
    let apellidos = document.getElementById('apellidos').value.trim();
    let sexo = document.getElementById('sexo').value.trim().toUpperCase();
    let edad = document.getElementById('edad').value.trim();
    let dni = document.getElementById('dni').value.trim();
    let telefono = document.getElementById('telefono').value.trim();
    let email = document.getElementById('email').value.trim();
    let fdn = document.getElementById('fdn').value.trim();
    let provincia = document.getElementById('provincia').value.trim();
    // Validaciones
    try {
        // Validar que todos los campos estén rellenos
        if (!nombre || !apellidos || !sexo || !edad || !dni || !telefono || !email || !fdn || !provincia) {
            throw new Error('Todos los campos son obligatorios.');
        }
        // Validar que el sexo sea 'V' o 'H'
        if (sexo !== 'V' && sexo !== 'H') {
            throw new Error('El sexo debe ser V (Varón) o H (Hembra).');
        }
        // Validar la edad: debe ser un número y estar en un rango aceptable
        if (!Number.isInteger(Number(edad)) || edad < 0 || edad > 120) {
            throw new Error('La edad debe ser un número válido entre 0 y 120.');
        }
        // Validar el DNI: calcula la letra correcta incluyendo DNI para extranjeros
        if (!validarDNI(dni)) {
            throw new Error('El DNI no es válido.');
        }
        // Validar el teléfono: se trata de una validación simple que acepta teléfonos internacionales
        const regexTelefono = /^[+]?[(]?[0-9]{1,4}[)]?[-\s./0-9]*$/;
        if (!regexTelefono.test(telefono)) {
            throw new Error('El número de teléfono no es válido.');
        }
        // Validar el email con una expresión regular básica
        const regexEmail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
        if (!regexEmail.test(email)) {
            throw new Error('El email no es válido.');
        }
        // Validar la fecha de nacimiento con una expresión regular compatible con la validación integrada de HTML5
        const regexFdn = /^\d{4}-\d{2}-\d{2}$/;
        if (!regexFdn.test(fdn)) {
            throw new Error('La fecha de nacimiento no es válida.');
        }
        // Validar la provincia contra una lista predefinida
        const provinciasValidas = ['Santa Cruz de Tenerife', 'Las Palmas de Gran Canaria'];
        if (!provinciasValidas.includes(provincia)) {
            throw new Error('La provincia seleccionada no es válida.');
        }
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
