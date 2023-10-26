function calcularPropina() {
    let montoFactura = parseFloat(document.getElementById("montoFactura").value);
    let porcentajePropina = parseFloat(document.getElementById("porcentajePropina").value);
    let propina = (montoFactura * porcentajePropina) / 100;
    document.getElementById("resultadoPropina").textContent = propina.toFixed(2);
}
