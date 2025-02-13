function abrirFormulario() {
    let confirmacion = self.confirm("¿Deseas abrir el formulario de registro?");

    let codigoFormulario = `<!DOCTYPE html>
                            <html lang="es">

                            <head>
                                <meta charset="UTF-8">
                                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                                <title>Documento</title>
                                <script>
                                    function enviarDatos() {
                                        opener.document.getElementById('nombre').innerHTML= document.getElementById('nombre').value;
                                        opener.document.getElementById('apellidos').innerHTML= document.getElementById('apellidos').value;
                                        opener.document.getElementById('direccion').innerHTML= document.getElementById('direccion').value;
                                        opener.document.getElementById('telefono').innerHTML= document.getElementById('telefono').value;
                                        opener.document.getElementById('correo').innerHTML= document.getElementById('correo').value;
                                        self.close();
                                    }
                                </script>
                            </head>
                            
                            <body>
                                <h2>Formulario de registro</h2>
                                <form id="formulario" onsubmit="enviarDatos()">
                                    <label for="nombre">Nombre:</label>
                                    <input type="text" id="nombre" name="nombre" required>
                                    <br /><br />
                                    <label for="apellidos">Apellidos:</label>
                                    <input type="text" id="apellidos" name="apellidos" required>
                                    <br /><br />
                                    <label for="direccion">Dirección:</label>
                                    <input type="text" id="direccion" name="direccion" required>
                                    <br /><br />
                                    <label for="telefono">Teléfono:</label>
                                    <input type="tel" id="telefono" name="telefono" required>
                                    <br /><br />
                                    <label for="correo">Correo electrónico:</label>
                                    <input type="email" id="correo" name="correo" required>
                                    <br /><br />
                                    <input type="submit" value="Enviar">
                                </form>
                            </body>
                            
                            </html>`;

    if (confirmacion) {
        ventanaFormulario = window.open("formulario.html", "Formulario de registro", "height=305,width=365");
        ventanaFormulario.document.write(codigoFormulario);
    } else {
        self.alert("No se pudo completar el registro.");
    }
}
