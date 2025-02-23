document.addEventListener('DOMContentLoaded', (event) => {
    // Limpiar los campos del formulario de creación de pacientes
    document.getElementById('nombre').value = '';
    document.getElementById('apellidos').value = '';
    document.getElementById('nhc').value = '';
    document.getElementById('sexo').value = '';
    document.getElementById('fechaNacimiento').value = '';

    // Limpiar el área de texto de visualización y modificación de pacientes
    document.getElementById('datospaciente').value = '';

    // Limpiar el área de texto del historial completo
    document.getElementById('historial').value = '';

    // Comenzar la aplicación sin ningún paciente
    let pacienteActual = null;

    function crearNuevo() {
        let nombre = document.getElementById('nombre').value;
        let apellidos = document.getElementById('apellidos').value;
        let nhc = document.getElementById('nhc').value;
        let sexo = document.getElementById('sexo').value;
        let fdn = document.getElementById('fechaNacimiento').value;

        pacienteActual = new Paciente(nombre, apellidos, nhc, sexo, fdn);
        document.getElementById('datospaciente').value = `Nombre completo: ${nombre} ${apellidos}\nNHC: ${nhc}\nSexo: ${sexo}\nFecha de nacimiento: ${fdn}`;
        return false; // Dar ayuda aquí para evitar el comportamiento por defecho del formulario.
    }

    function modificarNombre() {
        pacienteActual.modificarNombre();
        document.getElementById('datospaciente').value = `Nombre completo: ${pacienteActual.nombre} ${pacienteActual.apellidos}\nNHC: ${pacienteActual.nhc}\nSexo: ${pacienteActual.sexo}\nFecha de nacimiento: ${pacienteActual.fdn}`;
    }

    function modificarApellidos() {
        pacienteActual.modificarApellidos();
        document.getElementById('datospaciente').value = `Nombre completo: ${pacienteActual.nombre} ${pacienteActual.apellidos}\nNHC: ${pacienteActual.nhc}\nSexo: ${pacienteActual.sexo}\nFecha de nacimiento: ${pacienteActual.fdn}`;
    }

    function modificarNhc() {
        pacienteActual.modificarNhc();
        document.getElementById('datospaciente').value = `Nombre completo: ${pacienteActual.nombre} ${pacienteActual.apellidos}\nNHC: ${pacienteActual.nhc}\nSexo: ${pacienteActual.sexo}\nFecha de nacimiento: ${pacienteActual.fdn}`;
    }

    function modificarSexo() {
        pacienteActual.modificarSexo();
        document.getElementById('datospaciente').value = `Nombre completo: ${pacienteActual.nombre} ${pacienteActual.apellidos}\nNHC: ${pacienteActual.nhc}\nSexo: ${pacienteActual.sexo}\nFecha de nacimiento: ${pacienteActual.fdn}`;
    }

    function modificarFecha() {
        pacienteActual.modificarFdn();
        document.getElementById('datospaciente').value = `Nombre completo: ${pacienteActual.nombre} ${pacienteActual.apellidos}\nNHC: ${pacienteActual.nhc}\nSexo: ${pacienteActual.sexo}\nFecha de nacimiento: ${pacienteActual.fdn}`;
    }

    function agregarHistorial() {
        pacienteActual.agregarHistorial();
        let text = '';
        for (let i = 0; i < pacienteActual.historial.length; i++) {
            text += `ID episodio: ${pacienteActual.historial[i].ID}\nFecha episodio: ${pacienteActual.historial[i].Fecha}\nDiagnóstico: ${pacienteActual.historial[i].Diagnóstico}\nTratamiento: ${pacienteActual.historial[i].Tratamiento}\nResponsable: ${pacienteActual.historial[i].Responsable}\n----\n`;
        }
        document.getElementById('historial').value = text;
    }

    function modificarEpisodio() {
        if (pacienteActual) {
            pacienteActual.modificarEpisodioPorID();
            let text = '';
            for (let i = 0; i < pacienteActual.historial.length; i++) {
                text += `ID episodio: ${pacienteActual.historial[i].ID}\nFecha episodio: ${pacienteActual.historial[i].Fecha}\nDiagnóstico: ${pacienteActual.historial[i].Diagnóstico}\nTratamiento: ${pacienteActual.historial[i].Tratamiento}\nResponsable: ${pacienteActual.historial[i].Responsable}\n----\n`;
            }
            document.getElementById('historial').value = text;
        }
    }

    function limpiar() {
        if (confirm('¿Desea limpiar la ventana actual?')) {
            window.location.reload();
        }
    }

    document.getElementById('crearnuevo').onclick = crearNuevo;
    document.getElementById('modificarNombre').onclick = modificarNombre;
    document.getElementById('modificarApellidos').onclick = modificarApellidos;
    document.getElementById('modificarNhc').onclick = modificarNhc;
    document.getElementById('modificarSexo').onclick = modificarSexo;
    document.getElementById('modificarFechaNacimiento').onclick = modificarFecha;
    document.getElementById('agregarDxyTto').onclick = agregarHistorial;
    document.getElementById('modificarEpisodio').onclick = modificarEpisodio;
    document.getElementById('limpiar').onclick = limpiar;
});
