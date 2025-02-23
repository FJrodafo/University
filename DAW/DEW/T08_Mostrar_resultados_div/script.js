document.addEventListener("DOMContentLoaded", function () {
    var resultadosDiv = document.getElementById("resultados");

    // a. parseInt("15.5");
    resultadosDiv.innerHTML += "a. Valor: " + parseInt("15.5") + "<br />";

    // b. parseInt(true);
    resultadosDiv.innerHTML += "b. Valor: " + parseInt(true) + "<br />";

    // c. parseInt("Pedro");
    resultadosDiv.innerHTML += "c. Valor: " + parseInt("Pedro") + "<br />";

    // d. parseInt(15 + "Pedro");
    resultadosDiv.innerHTML += "d. Valor: " + parseInt(15 + "Pedro") + "<br />";

    // e. parseFloat("15.5");
    resultadosDiv.innerHTML += "e. Valor: " + parseFloat("15.5") + "<br />";
});
