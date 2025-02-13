// Tabla de multiplicar del 7 (usando bucle for)
var tablaMultiplicar = '';
for (var i = 1; i <= 10; i++) {
    tablaMultiplicar += '7 x ' + i + ' = ' + (7 * i) + '<br />';
}
document.getElementById('tablaMultiplicar').innerHTML = tablaMultiplicar;

// Tabla de sumar del 8 (usando bucle while)
var tablaSumar = '';
var i = 1;
while (i <= 10) {
    tablaSumar += '8 + ' + i + ' = ' + (8 + i) + '<br />';
    i++;
}
document.getElementById('tablaSumar').innerHTML = tablaSumar;

// Tabla de dividir del 9 (usando bucle do-while)
var tablaDividir = '';
var i = 1;
do {
    tablaDividir += '9 ÷ ' + i + ' = ' + (9 / i) + '<br />';
    i++;
} while (i <= 10);
document.getElementById('tablaDividir').innerHTML = tablaDividir;
