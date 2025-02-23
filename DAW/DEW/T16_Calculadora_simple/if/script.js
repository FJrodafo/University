function realizarOperacion(operador) {
    // Obtener los valores de los números ingresados
    var numero1 = parseFloat(document.getElementById("numero1").value);
    var numero2 = parseFloat(document.getElementById("numero2").value);
    var resultado;

    // Realizar la operación según el operador seleccionado
    if (operador === '+') {
        resultado = numero1 + numero2;
    } else if (operador === '-') {
        resultado = numero1 - numero2;
    } else if (operador === '*') {
        resultado = numero1 * numero2;
    } else if (operador === '/') {
        if (numero2 !== 0) {
            resultado = numero1 / numero2;
        } else {
            resultado = "Error: División por cero";
        }
    }

    // Mostrar el resultado en la caja de texto
    document.getElementById("resultado").value = resultado;
}
