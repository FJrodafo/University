document.addEventListener("DOMContentLoaded", function () {
    var resultadosDiv = document.getElementById("resultados");

    // a. 2 > 3 + 2;
    var a = 2 > 3 + 2;
    resultadosDiv.innerHTML += "a. Valor: " + a + ", Tipo de datos: " + typeof (a) + "<br />";

    // b. 1 + false + 3.5;
    var b = 1 + false + 3.5;
    resultadosDiv.innerHTML += "b. Valor: " + b + ", Tipo de datos: " + typeof (b) + "<br />";

    // c. 4 * true + 2;
    var c = 4 * true + 2;
    resultadosDiv.innerHTML += "c. Valor: " + c + ", Tipo de datos: " + typeof (c) + "<br />";

    // d. 5 / 0;
    var d = 5 / 0;
    resultadosDiv.innerHTML += "d. Valor: " + d + ", Tipo de datos: " + typeof (d) + "<br />";

    // e. 3 * 'hola' + 2;
    var e = 3 * 'hola' + 2;
    resultadosDiv.innerHTML += "e. Valor: " + e + ", Tipo de datos: " + typeof (e) + "<br />";

    // f. 'Tienes' + 23 + 'años';
    var f = 'Tienes' + 23 + 'años';
    resultadosDiv.innerHTML += "f. Valor: " + f + ", Tipo de datos: " + typeof (f) + "<br />";
});
