function iniciarCuentaAtras() {
    var inputFechaHora = document.getElementById("datetime").value;
    var fechaHoraSeleccionada = new Date(inputFechaHora).getTime();

    var cuentaAtras = setInterval(function () {
        var ahora = new Date().getTime();
        var diferencia = fechaHoraSeleccionada - ahora;

        var dias = Math.floor(diferencia / (1000 * 60 * 60 * 24));
        var horas = Math.floor((diferencia % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        var minutos = Math.floor((diferencia % (1000 * 60 * 60)) / (1000 * 60));
        var segundos = Math.floor((diferencia % (1000 * 60)) / 1000);

        document.getElementById("countdown").innerHTML = dias + "d " + horas + "h " + minutos + "m " + segundos + "s ";

        if (diferencia <= 0) {
            clearInterval(cuentaAtras);
            document.getElementById("countdown").innerHTML = "¡Tiempo agotado!";
        }
    }, 1000);
}

function reiniciar() {
    location.reload();
}
