function realizarOperacion(operador) {
    // Obtener los valores de los números ingresados
    var numero1 = parseFloat(document.getElementById("numero1").value);
    var numero2 = parseFloat(document.getElementById("numero2").value);
    var resultado;

    // Realizar la operación según el operador seleccionado
    switch (operador) {
        case '+':
            resultado = numero1 + numero2;
            break;
        case '-':
            resultado = numero1 - numero2;
            break;
        case '*':
            resultado = numero1 * numero2;
            break;
        case '/':
            if (numero2 !== 0) {
                resultado = numero1 / numero2;
            } else {
                resultado = "Error: División entre cero";
            }
            break;
        default:
            resultado = "Operador no válido";
    }

    // Mostrar el resultado en la caja de texto
    document.getElementById("resultado").value = resultado;
}
