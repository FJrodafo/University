function calcularCircunferencia() {
    var radio = parseFloat(document.getElementById("radioInput").value);
    var area = Math.PI * radio * radio;
    var perimetro = 2 * Math.PI * radio;

    document.getElementById("area").innerHTML = area.toFixed(2);
    document.getElementById("perimetro").innerHTML = perimetro.toFixed(2);
}
