class Paciente {
    /**
     * Constructor de la clase Paciente. Inicializa una nueva instancia de un paciente con los detalles proporcionados.
     * Este constructor es parte esencial del manejo de pacientes en el sistema, asegurándose de que todos los datos necesarios estén presentes.
     * 
     * @param {string} nombre - Nombre del paciente.
     * @param {string} apellidos - Apellidos del paciente.
     * @param {number} nhc - Número de historia clínica del paciente.
     * @param {char} sexo - Sexo del paciente. Debe ser uno de los siguientes valores: 'V' para varón o 'H' para hembra.
     * @param {Date} fdn - Fecha de nacimiento del paciente.
     */
    constructor(nombre, apellidos, nhc, sexo, fdn) {
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.nhc = nhc;
        this.sexo = sexo;
        this.fdn = fdn;
        this.historial = []; // Array para el historial
    }

    modificarNombre() {
        if (confirm('¿Desea modificar el nombre del paciente?')) {
            this.nombre = prompt('Introduzca nuevo nombre:');
            alert(`Nuevo nombre: ${this.nombre}.`);
        } else {
            alert('No se ha modificado el nombre.');
        }
    }

    modificarApellidos() {
        if (confirm('¿Desea modificar los apellidos del paciente?')) {
            this.apellidos = prompt('Introduzca nuevos apellidos:');
            alert(`Nuevos apellidos: ${this.apellidos}.`);
        } else {
            alert('No se ha modificado los apellidos.');
        }
    }

    modificarNhc() {
        if (confirm('¿Desea modificar el NHC del paciente?')) {
            this.nhc = prompt('Introduzca nuevo NHC:');
            alert(`Nuevo NHC: ${this.nhc}.`);
        } else {
            alert('No se ha modificado el NHC.');
        }
    }

    modificarSexo() {
        if (confirm('¿Desea modificar el sexo del paciente?')) {
            this.sexo = prompt('Introduzca nuevo sexo:');
            alert(`Nuevo sexo: ${this.sexo}.`);
        } else {
            alert('No se ha modificado el sexo.');
        }
    }

    modificarFdn() {
        if (confirm('¿Desea modificar la fecha de nacimiento del paciente?')) {
            this.fdn = prompt('Introduzca nueva fecha de nacimiento:');
            alert(`Nueva Fecha de Nacimiento: ${this.fdn}.`);
        } else {
            alert('No se ha modificado la fecha de nacimiento.');
        }
    }

    agregarHistorial() {
        if (confirm('¿Desea agregar un episodio al historial?')) {
            let ID = prompt('Introduzca n.º de episodio:');
            let fecha = prompt('Introduzca fecha:');
            let Dx = prompt('Introduzca diagnóstico:')
            let Tto = prompt('Introduzca tratamiento:');
            let Doc = prompt('Introduzca responsable:');
            this.historial.push({ 'ID': ID, 'Fecha': fecha, 'Diagnóstico': Dx, 'Tratamiento': Tto, 'Responsable': Doc });
        } else {
            alert('No se ha agregado ningún episodio al historial.');
        }
    }

    modificarEpisodioPorID() {
        if (confirm('¿Desea modificar un episodio en el historial por ID?')) {
            let idEpisodio = prompt('Introduzca el ID del episodio a modificar:');
            for (let i = 0; i < this.historial.length; i++) {
                if (this.historial[i].ID === idEpisodio) {

                    this.historial[i].Fecha = prompt('Introduzca nueva fecha:');
                    this.historial[i].Diagnóstico = prompt('Introduzca nuevo diagnóstico:');
                    this.historial[i].Tratamiento = prompt('Introduzca nuevo tratamiento:');
                    this.historial[i].Responsable = prompt('Introduzca nuevo responsable:');

                    alert('Episodio modificado correctamente.');
                }
            }
        } else {
            alert('No se ha modificado ningún episodio en el historial.');
        }
    }
}
