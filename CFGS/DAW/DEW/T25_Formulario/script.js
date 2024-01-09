// Función para obtener el número actual de intentos de la cookie
function obtenerIntentos() {
    var intentos = document.cookie.replace(/(?:(?:^|.*;\s*)intentos\s*\=\s*([^;]*).*$)|^.*$/, "$1");
    return intentos ? parseInt(intentos) : 0;
}

// Función para establecer el número de intentos en la cookie
function establecerIntentos(intentos) {
    document.cookie = "intentos=" + intentos;
}

// Función para mostrar el mensaje de intentos en el contenedor "intentos"
function mostrarIntentos(intentos) {
    document.getElementById('intentos').innerHTML = 'Intento de Envíos del formulario: ' + intentos;
}

// Función para convertir a mayúsculas los campos NOMBRE y APELLIDOS
function convertirMayusculas(event) {
    event.target.value = event.target.value.toUpperCase();
}

// Asignamos la función a los eventos 'blur' de los campos NOMBRE y APELLIDOS
document.getElementById('nombre').addEventListener('blur', convertirMayusculas);
document.getElementById('apellidos').addEventListener('blur', convertirMayusculas);

// Función para validar los campos NOMBRE y APELLIDOS
function validarNombreApellidos() {
    var nombre = document.getElementById('nombre').value.trim();
    var apellidos = document.getElementById('apellidos').value.trim();

    // Validación: campos no pueden estar vacíos
    if (nombre === '' || apellidos === '') {
        document.getElementById('errores').innerHTML = 'Error: Nombre y Apellidos son obligatorios.';
        if (nombre === '') {
            // document.getElementById('nombre').className = "error";
            document.getElementById('nombre').focus();
        } else {
            // document.getElementById('apellidos').className = "error";
            document.getElementById('apellidos').focus();
        }
        return false;
    } else {
        return true;
    }
}

// Función para validar la EDAD
function validarEdad() {
    var edad = document.getElementById('edad').value.trim();

    // Validación: edad debe ser numérica y estar en el rango de 0 a 105
    if (edad === '' || isNaN(edad) || edad < 0 || edad > 105) {
        document.getElementById('errores').innerHTML = 'Error: Edad debe ser un número entre 0 y 105.';
        document.getElementById('edad').focus();
        return false;
    } else {
        return true;
    }
}

// Función para validar el NIF
function validarNIF() {
    var nif = document.getElementById('nif').value.trim();

    // Explicación de la expresión regular: 8 números, un guión y una letra
    var nifRegex = /^\d{8}[A-Z]{1}$/; // También podría ser: var nifRegex = /^\d{8}-[a-zA-Z]$/;

    // Validación: nif debe cumplir el formato de la expresión regular
    if (!nifRegex.test(nif)) {
        document.getElementById('errores').innerHTML = 'Error: NIF no válido.';
        document.getElementById('nif').focus();
        return false;
    } else {
        return true;
    }
}

// Función para validar el E-MAIL
function validarEmail() {
    var email = document.getElementById('email').value.trim();

    // Explicación de la expresión regular para validar el formato de un e-mail
    var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    // Validación: email debe cumplir el formato de la expresión regular
    if (!emailRegex.test(email)) {
        document.getElementById('errores').innerHTML = 'Error: Formato de e-mail no válido.';
        document.getElementById('email').focus();
        return false;
    } else {
        return true;
    }
}

// Función para validar la selección de la PROVINCIA
function validarProvincia() {
    var provincia = document.getElementById('provincia').value;

    // Validación: se debe seleccionar una provincia
    if (provincia === '0') {
        document.getElementById('errores').innerHTML = 'Error: Seleccione una provincia.';
        document.getElementById('provincia').focus();
        return false;
    } else {
        return true;
    }
}

// Función para validar el campo FECHA
function validarFecha() {
    var fecha = document.getElementById('fecha').value.trim();

    // Explicación de la expresión regular para validar el formato de la fecha
    var fechaRegex = /^(0[1-9]|[12][0-9]|3[01])[-/](0[1-9]|1[0-2])[-/]\d{4}$/;

    // Validación: fecha debe cumplir el formato de la expresión regular
    if (!fechaRegex.test(fecha)) {
        document.getElementById('errores').innerHTML = 'Error: Formato de fecha no válido.';
        document.getElementById('fecha').focus();
        return false;
    } else {
        return true;
    }
}

// Función para validar el campo TELEFONO
function validarTelefono() {
    var telefono = document.getElementById('telefono').value.trim();

    // Explicación de la expresión regular para validar el formato del teléfono
    var telefonoRegex = /^\d{9}$/;

    // Validación: teléfono debe cumplir el formato de la expresión regular
    if (!telefonoRegex.test(telefono)) {
        document.getElementById('errores').innerHTML = 'Error: Formato de teléfono no válido.';
        document.getElementById('telefono').focus();
        return false;
    } else {
        return true;
    }
}

// Función para validar el campo HORA
function validarHora() {
    var hora = document.getElementById('hora').value.trim();

    // Explicación de la expresión regular para validar el formato de la hora
    var horaRegex = /^([01]\d|2[0-3]):[0-5]\d$/;

    // Validación: hora debe cumplir el formato de la expresión regular
    if (!horaRegex.test(hora)) {
        document.getElementById('errores').innerHTML = 'Error: Formato de hora no válido.';
        document.getElementById('hora').focus();
        return false;
    } else {
        return true;
    }
}

function enviarFormulario(event) {
    // Incrementar el número de intentos en la cookie
    var intentos = obtenerIntentos() + 1;
    establecerIntentos(intentos);

    // Mostrar el mensaje de intentos en el contenedor "intentos"
    mostrarIntentos(intentos);

    // Validar los campos antes de enviar el formulario
    if (
        validarNombreApellidos() &&
        validarEdad() &&
        validarNIF() &&
        validarEmail() &&
        validarProvincia() &&
        validarFecha() &&
        validarTelefono() &&
        validarHora()
    ) {
        // Preguntar confirmación antes de enviar el formulario
        var confirmacion = confirm("¿Está seguro de enviar el formulario?");
        if (!confirmacion) {
            // Cancelar el envío del formulario
            event.preventDefault();
        }
    } else {
        // Cancelar el envío del formulario si hay errores de validación
        event.preventDefault();
    }
}

// Asignar la función enviarFormulario al evento 'submit' del formulario
document.getElementById('formulario').addEventListener('submit', enviarFormulario);
