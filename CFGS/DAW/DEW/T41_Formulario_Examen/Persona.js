class Persona {
    constructor(nombre, apellidos, sexo, edad, dni, telefono, email, fdn, provincia) {
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.sexo = sexo;
        this.edad = edad;
        this.dni = dni;
        this.telefono = telefono;
        this.email = email;
        this.fdn = fdn;
        this.provincia = provincia;
        this.historial = []; // Array para el historial
        this.contadorID = 0; // Variable de contador para el número de identificación
    }

    modificarNombre() {
        if (confirm('¿Desea modificar el nombre de la persona?')) {
            let nuevoNombre = prompt('Introduzca el nuevo nombre:');
            if (nuevoNombre === null || nuevoNombre.trim() === '') {
                alert('El nuevo nombre no es válido.');
            } else {
                this.nombre = nuevoNombre;
            }
        }
    }

    modificarApellidos() {
        if (confirm('¿Desea modificar los apellidos de la persona?')) {
            let nuevosApellidos = prompt('Introduzca los nuevos apellidos:');
            if (nuevosApellidos === null || nuevosApellidos.trim() === '') {
                alert('Los nuevos apellidos no son válidos.');
            } else {
                this.apellidos = nuevosApellidos;
            }
        }
    }

    modificarSexo() {
        if (confirm('¿Desea modificar el sexo de la persona?')) {
            let nuevoSexo = prompt('Introduzca el nuevo sexo:').toUpperCase();
            if ((nuevoSexo === null || nuevoSexo.trim() === '') || (nuevoSexo !== 'V' && nuevoSexo !== 'H')) {
                alert('El nuevo sexo debe ser V (Varón) o H (Hembra).');
            } else {
                this.sexo = nuevoSexo;
            }
        }
    }

    modificarEdad() {
        if (confirm('¿Desea modificar la edad de la persona?')) {
            let nuevaEdad = prompt('Introduzca la nueva edad:');
            if ((nuevaEdad === null || nuevaEdad.trim() === '') || (!Number.isInteger(Number(nuevaEdad)) || nuevaEdad < 0 || nuevaEdad > 120)) {
                alert('La nueva edad debe ser un número válido entre 0 y 120.');
            } else {
                this.edad = nuevaEdad;
            }
        }
    }

    modificarDni() {
        if (confirm('¿Desea modificar el DNI de la persona?')) {
            let nuevoDni = prompt('Introduzca el nuevo DNI:');
            if ((nuevoDni === null || nuevoDni.trim() === '') || (!validarDNI(nuevoDni))) {
                alert('El nuevo DNI no es válido.');
            } else {
                this.dni = nuevoDni;
            }
        }
    }

    modificarTelefono() {
        if (confirm('¿Desea modificar el número de teléfono de la persona?')) {
            let nuevoTelefono = prompt('Introduzca el nuevo número de teléfono:');
            const regexTelefono = /^[+]?[(]?[0-9]{1,4}[)]?[-\s./0-9]*$/;
            if ((nuevoTelefono === null || nuevoTelefono.trim() === '') || (!regexTelefono.test(nuevoTelefono))) {
                alert('El nuevo número de teléfono no es válido.');
            } else {
                this.telefono = nuevoTelefono;
            }
        }
    }

    modificarEmail() {
        if (confirm('¿Desea modificar el email de la persona?')) {
            let nuevoEmail = prompt('Introduzca el nuevo email:');
            const regexEmail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
            if ((nuevoEmail === null || nuevoEmail.trim() === '') || (!regexEmail.test(nuevoEmail))) {
                alert('El nuevo email no es válido.');
            } else {
                this.email = nuevoEmail;
            }
        }
    }

    modificarFdn() {
        if (confirm('¿Desea modificar la fecha de nacimiento de la persona?')) {
            let nuevaFdn = prompt('Introduzca la nueva fecha de nacimiento:');
            const regexFdn = /^\d{4}-\d{2}-\d{2}$/;
            if ((nuevaFdn === null || nuevaFdn.trim() === '') || (!regexFdn.test(nuevaFdn))) {
                alert('La nueva fecha de nacimiento no es válida.');
            } else {
                this.fdn = nuevaFdn;
            }
        }
    }

    modificarProvincia() {
        if (confirm('¿Desea modificar la provincia de la persona?')) {
            let nuevaProvincia = prompt('Introduzca el nueva provincia:');
            const provinciasValidas = ['Santa Cruz de Tenerife', 'Las Palmas de Gran Canaria'];
            if ((nuevaProvincia === null || nuevaProvincia.trim() === '') || (!provinciasValidas.includes(nuevaProvincia))) {
                alert('La nueva provincia no es válida.');
            } else {
                this.provincia = nuevaProvincia;
            }
        }
    }

    /**
     * @returns los datos de la persona
     */
    mostrarInformacion() {
        return `Nombre completo: ${this.nombre} ${this.apellidos}\nSexo: ${this.sexo}\nEdad: ${this.edad}\nDNI: ${this.dni}\nTeléfono: ${this.telefono}\nEmail: ${this.email}\nFecha de nacimiento: ${this.fdn}\nProvincia: ${this.provincia}`;
    }

    agregarHistorial() {
        if (!confirm('¿Desea agregar información al historial?')) {
            return;
        }

        // Incrementar el contador de identificación
        this.contadorID++;

        let anio = prompt('Introduzca año:');
        let trabajo = prompt('Introduzca trabajo:');
        let hobby = prompt('Introduzca hobby:');

        // Validación: Si el usuario cancela, asignar un valor predeterminado a los campos.
        if (anio === null || anio.trim() === '') anio = 'No especificado';
        if (trabajo === null || trabajo.trim() === '') trabajo = 'No especificado';
        if (hobby === null || hobby.trim() === '') hobby = 'No especificado';

        // Utilizar el contador como número de identificación
        const ID = this.contadorID;

        this.historial.push({ 'ID': ID, 'anio': anio, 'trabajo': trabajo, 'hobby': hobby });
        alert('Información agregada correctamente. Número de identificación: ' + ID);
    }

    eliminarHistorial() {
        if (this.historial.length === 0) {
            alert('No existe información en el historial.');
            return;
        }

        if (!confirm('¿Desea eliminar información del historial?')) {
            return;
        }

        // Convertir la entrada del usuario a un número
        const ID = parseInt(prompt('Introduzca el número de identificación:'));

        // Verificar si la entrada es un número válido
        if (isNaN(ID)) {
            alert('Por favor, introduzca un número válido.');
            return;
        }

        const index = this.historial.findIndex(item => item.ID === ID);

        if (index === -1) {
            alert('El ID proporcionado no existe.');
            return;
        }

        this.historial.splice(index, 1);
        alert('Información eliminada correctamente.');
    }

    modificarHistorial() {
        if (this.historial.length === 0) {
            alert('No existe información en el historial.');
            return;
        }

        if (!confirm('¿Desea modificar información del historial?')) {
            return;
        }

        // Convertir la entrada del usuario a un número
        const ID = parseInt(prompt('Introduzca el número de identificación:'));

        // Verificar si la entrada es un número válido
        if (isNaN(ID)) {
            alert('Por favor, introduzca un número válido.');
            return;
        }

        const historialItem = this.historial.find(item => item.ID === ID);

        if (!historialItem) {
            alert('El ID proporcionado no existe.');
            return;
        }

        let nuevoAnio = prompt('Introduzca el nuevo año:');
        let nuevoTrabajo = prompt('Introduzca el nuevo trabajo:');
        let nuevoHobby = prompt('Introduzca el nuevo hobby:');

        // Validación: Si el usuario cancela, asignar un valor predeterminado a los campos.
        if (nuevoAnio === null || nuevoAnio.trim() === '') nuevoAnio = 'No especificado';
        if (nuevoTrabajo === null || nuevoTrabajo.trim() === '') nuevoTrabajo = 'No especificado';
        if (nuevoHobby === null || nuevoHobby.trim() === '') nuevoHobby = 'No especificado';

        historialItem.anio = nuevoAnio;
        historialItem.trabajo = nuevoTrabajo;
        historialItem.hobby = nuevoHobby;

        alert('Información modificada correctamente.');
    }
}
