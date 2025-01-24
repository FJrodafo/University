// En este caso estaríamos parando la propagación mostrando como última alerta la del contenedor secundario
window.onload = function () {
    document.getElementById("principal").addEventListener("click", function () { alert("Pulsado el contenedor principal"); }, true); // estamos utilizando captura
    document.getElementById("secundario").addEventListener("click", function (e) { alert("Pulsado el contenedor secundario y paramos la propagación"); e.stopPropagation(); }, true);
    document.getElementById("miboton").addEventListener("click", function () { alert("Pulsado el botón"); }, true); // estamos utilizando captura
}
