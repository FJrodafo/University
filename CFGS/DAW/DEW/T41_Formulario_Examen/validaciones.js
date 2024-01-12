// Función para validar que todos los campos estén rellenos
function validarCamposObligatorios(nombre, apellidos, sexo, edad, dni, telefono, email, fdn, provincia) {
    if (!nombre || !apellidos || !sexo || !edad || !dni || !telefono || !email || !fdn || !provincia) {
        throw new Error('Todos los campos son obligatorios.');
    }
}

// Función para validar el nombre
function validarNombre(nombre) {
    if (nombre === '') {
        throw new Error('El nombre no es válido');
    }
}

// Función para validar los apellidos
function validarApellidos(apellidos) {
    if (apellidos === '') {
        throw new Error('Los apellidos no son válidos');
    }
}

// Función para validar que el sexo sea 'H' o 'M'
function validarSexo(sexo) {
    if (sexo === '' || sexo !== 'H' && sexo !== 'M') {
        throw new Error('El sexo debe ser H (Hombre) o M (Mujer).');
    }
}

// Función para validar la edad: debe ser un número y estar en un rango aceptable
function validarEdad(edad) {
    if (edad === '' || !Number.isInteger(Number(edad)) || edad < 0 || edad > 120) {
        throw new Error('La edad debe ser un número válido entre 0 y 120.');
    }
}

// Función para validar el DNI: calcula la letra correcta incluyendo DNI para extranjeros
function validarDni(dni) {
    let numero, letr, letra;
    const regexDNI = /^[XYZ]?\d{5,8}[A-Z]$/;

    dni = dni.toUpperCase();

    if (regexDNI.test(dni)) {
        numero = dni.substr(0, dni.length - 1);
        numero = numero.replace('X', 0);
        numero = numero.replace('Y', 1);
        numero = numero.replace('Z', 2);
        letr = dni.substr(dni.length - 1, 1);
        numero = numero % 23;
        letra = 'TRWAGMYFPDXBNJZSQVHLCKET';
        letra = letra.substring(numero, numero + 1);
        if (letra !== letr) {
            throw new Error('El DNI no es válido.');
        }
    } else {
        throw new Error('El formato del DNI no es válido.');
    }
}

// Función para validar el teléfono: se trata de una validación simple que acepta teléfonos internacionales
function validarTelefono(telefono) {
    const regexTelefono = /^[+]?[(]?[0-9]{1,4}[)]?[-\s./0-9]*$/;
    if (!regexTelefono.test(telefono)) {
        throw new Error('El número de teléfono no es válido.');
    }
}

// Función para validar el email con una expresión regular básica
function validarEmail(email) {
    const regexEmail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
    if (!regexEmail.test(email)) {
        throw new Error('El email no es válido.');
    }
}

// Función para validar la fecha de nacimiento con una expresión regular compatible con la validación integrada de HTML5
function validarFdn(fdn) {
    const regexFdn = /^\d{4}-\d{2}-\d{2}$/;
    if (!regexFdn.test(fdn)) {
        throw new Error('La fecha de nacimiento no es válida.');
    }
}

// Función para validar la provincia contra una lista predefinida
function validarProvincia(provincia) {
    const provinciasValidas = ['Santa Cruz de Tenerife', 'Las Palmas de Gran Canaria'];
    if (!provinciasValidas.includes(provincia)) {
        throw new Error('La provincia no es válida.');
    }
}

// Función para validar todos los campos del formulario
function validarCamposFormulario(nombre, apellidos, sexo, edad, dni, telefono, email, fdn, provincia) {
    validarCamposObligatorios(nombre, apellidos, sexo, edad, dni, telefono, email, fdn, provincia);
    validarNombre(nombre);
    validarApellidos(apellidos);
    validarSexo(sexo);
    validarEdad(edad);
    validarDni(dni);
    validarTelefono(telefono);
    validarEmail(email);
    validarFdn(fdn);
    validarProvincia(provincia);
}
