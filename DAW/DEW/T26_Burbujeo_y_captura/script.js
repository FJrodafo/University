/*
window.onload = function () {
    document.getElementById("principal").addEventListener("click", function () { alert("Pulsado el contenedor principal"); }, false); // estamos utilizando burbujeo
    document.getElementById("secundario").addEventListener("click", function () { alert("Pulsado el contenedor secundario"); }, false); // estamos utilizando burbujeo
    document.getElementById("miboton").addEventListener("click", function () { alert("Pulsado el botón"); }, false); // estamos utilizando burbujeo
}
*/

window.onload = function () {
    document.getElementById("principal").addEventListener("click", function () { alert("Pulsado el contenedor principal"); }, true); // estamos utilizando captura
    document.getElementById("secundario").addEventListener("click", function () { alert("Pulsado el contenedor secundario"); }, true); // estamos utilizando captura
    document.getElementById("miboton").addEventListener("click", function () { alert("Pulsado el botón"); }, true); // estamos utilizando captura
}
