document.addEventListener('DOMContentLoaded', function () {
    var pincelActivo = false;
    var colores = ['#FF0', '#0F0', '#000', '#F00', '#06C', '#FFF'];
    var colorSeleccionado = colores[0];

    var tablero = document.createElement('table');
    tablero.className = 'tablerodibujo';

    for (var i = 0; i < 30; i++) {
        var fila = tablero.insertRow();
        for (var j = 0; j < 30; j++) {
            var celda = fila.insertCell();
            celda.addEventListener('mouseover', pintarCelda);
            celda.addEventListener('mousedown', cambiarEstadoPincel);
        }
    }

    document.getElementById('zonadibujo').appendChild(tablero);

    var paleta = document.getElementById('paleta');
    paleta.addEventListener('mousedown', cambiarColor);

    var coloresPaleta = Array.from(paleta.getElementsByClassName('color'));

    coloresPaleta.forEach(function (color, index) {
        color.style.backgroundColor = colores[index];
    });

    actualizarEstadoPincel();

    function pintarCelda() {
        if (pincelActivo) {
            this.style.backgroundColor = colorSeleccionado;
        }
    }

    function cambiarEstadoPincel() {
        pincelActivo = !pincelActivo;
        actualizarEstadoPincel();
    }

    function cambiarColor(event) {
        if (event.target.classList.contains('color')) {
            colorSeleccionado = event.target.style.backgroundColor;
            actualizarEstadoPincel();
            actualizarSeleccionColor();
        }
    }

    function actualizarEstadoPincel() {
        var estadoPincel = document.getElementById('estadoPincel');
        estadoPincel.textContent = pincelActivo ? 'PINCEL ACTIVADO' : 'PINCEL DESACTIVADO';
    }

    function actualizarSeleccionColor() {
        coloresPaleta.forEach(function (color) {
            color.classList.toggle('seleccionado', color.style.backgroundColor === colorSeleccionado);
        });
    }

    var parrafo = document.querySelectorAll('p')[1];
    parrafo.textContent = "Haga CLICK en cualquier celda para activar/desactivar el Pincel";
});
