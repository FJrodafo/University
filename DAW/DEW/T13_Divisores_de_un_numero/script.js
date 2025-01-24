function mostrarDivisores() {
    var numero = parseInt(document.getElementById("numeroInput").value);
    var divisores = [];

    for (var i = 1; i <= numero; i++) {
        if (numero % i === 0) {
            divisores.push(i);
        }
    }

    document.getElementById("divisores").innerHTML = divisores.join(", ");
}
