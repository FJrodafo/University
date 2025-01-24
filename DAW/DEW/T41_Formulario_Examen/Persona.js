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
            if (nuevoNombre === null) return;
            nuevoNombre = nuevoNombre.trim();
            try {
                validarModificarNombre(nuevoNombre);
                this.nombre = nuevoNombre;
            } catch (error) {
                alert(error.message);
            }
        }
    }

    modificarApellidos() {
        if (confirm('¿Desea modificar los apellidos de la persona?')) {
            let nuevosApellidos = prompt('Introduzca los nuevos apellidos:');
            if (nuevosApellidos === null) return;
            nuevosApellidos = nuevosApellidos.trim();
            try {
                validarModificarApellidos(nuevosApellidos);
                this.apellidos = nuevosApellidos;
            } catch (error) {
                alert(error.message);
            }
        }
    }

    modificarSexo() {
        if (confirm('¿Desea modificar el sexo de la persona?')) {
            let nuevoSexo = prompt('Introduzca el nuevo sexo:');
            if (nuevoSexo === null) return;
            nuevoSexo = nuevoSexo.trim().toUpperCase();
            try {
                validarModificarSexo(nuevoSexo);
                this.sexo = nuevoSexo;
            } catch (error) {
                alert(error.message);
            }
        }
    }

    modificarEdad() {
        if (confirm('¿Desea modificar la edad de la persona?')) {
            let nuevaEdad = prompt('Introduzca la nueva edad:');
            if (nuevaEdad === null) return;
            nuevaEdad = nuevaEdad.trim();
            try {
                validarModificarEdad(nuevaEdad);
                this.edad = nuevaEdad;
            } catch (error) {
                alert(error.message);
            }
        }
    }

    modificarDni() {
        if (confirm('¿Desea modificar el DNI de la persona?')) {
            let nuevoDni = prompt('Introduzca el nuevo DNI:');
            if (nuevoDni === null) return;
            nuevoDni = nuevoDni.trim().toUpperCase();
            try {
                validarModificarDni(nuevoDni);
                this.dni = nuevoDni;
            } catch (error) {
                alert(error.message);
            }
        }
    }

    modificarTelefono() {
        if (confirm('¿Desea modificar el número de teléfono de la persona?')) {
            let nuevoTelefono = prompt('Introduzca el nuevo número de teléfono:');
            if (nuevoTelefono === null) return;
            nuevoTelefono = nuevoTelefono.trim();
            try {
                validarModificarTelefono(nuevoTelefono);
                this.telefono = nuevoTelefono;
            } catch (error) {
                alert(error.message);
            }
        }
    }

    modificarEmail() {
        if (confirm('¿Desea modificar el email de la persona?')) {
            let nuevoEmail = prompt('Introduzca el nuevo email:');
            if (nuevoEmail === null) return;
            nuevoEmail = nuevoEmail.trim();
            try {
                validarModificarEmail(nuevoEmail);
                this.email = nuevoEmail;
            } catch (error) {
                alert(error.message);
            }
        }
    }

    modificarFdn() {
        if (confirm('¿Desea modificar la fecha de nacimiento de la persona?')) {
            let nuevaFdn = prompt('Introduzca la nueva fecha de nacimiento:');
            if (nuevaFdn === null) return;
            nuevaFdn = nuevaFdn.trim();
            try {
                validarModificarFdn(nuevaFdn);
                this.fdn = nuevaFdn;
            } catch (error) {
                alert(error.message);
            }
        }
    }

    modificarProvincia() {
        if (confirm('¿Desea modificar la provincia de la persona?')) {
            let nuevaProvincia = prompt('Introduzca la nueva provincia:');
            if (nuevaProvincia === null) return;
            nuevaProvincia = nuevaProvincia.trim();
            try {
                validarModificarProvincia(nuevaProvincia);
                this.provincia = nuevaProvincia;
            } catch (error) {
                alert(error.message);
            }
        }
    }

    /**
     * @returns {string} Los datos de la persona como una cadena de texto formateada.
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
