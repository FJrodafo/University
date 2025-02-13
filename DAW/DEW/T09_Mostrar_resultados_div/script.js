document.addEventListener("DOMContentLoaded", function () {
    var resultadosDiv = document.getElementById("resultados");

    // a. 16 << 2;
    var a = 16 << 2;
    resultadosDiv.innerHTML += "a. Valor: " + a + "<br />";

    // b. 8 > 10 ? v1 = 'sí' : v1 = 'no';
    var b = 8 > 10 ? v1 = 'sí' : v1 = 'no';
    resultadosDiv.innerHTML += "b. Valor: " + b + "<br />";

    // c. var n = 7; alert("n vale " + (++n));
    var n = 7;
    var c = "n vale " + (++n);
    resultadosDiv.innerHTML += "c. Valor: " + c + "<br />";

    // d. var m = 17; alert("m vale " + (m++)); alert(m);
    var m = 17;
    var d = "m vale " + (m++);
    resultadosDiv.innerHTML += "d. Valor: " + d + "; Valor: " + m + "<br />";

    // e. var y = 17; y %= 5;
    var y = 17; y %= 5;
    resultadosDiv.innerHTML += "e. Valor: " + y + "<br />";
});
