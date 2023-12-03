// Operaciones usando desplazamiento de bits
var resultadoDivision = (125 >> 3); // 125 / 8
var resultadoMultiplicacion = (40 << 2); // 40 * 4
var resultadoDivision2 = (25 >> 1); // 25 / 2
var resultadoMultiplicacion2 = (10 << 4); // 10 * 16

// Mostrar resultados en la página
document.getElementById("divisionResultado").textContent = resultadoDivision;
document.getElementById("multiplicacionResultado").textContent = resultadoMultiplicacion;
document.getElementById("divisionResultado2").textContent = resultadoDivision2;
document.getElementById("multiplicacionResultado2").textContent = resultadoMultiplicacion2;
