function sumar() {
    // Obtener los valores de los números ingresados
    var numero1 = parseFloat(document.getElementById("numero1").value);
    var numero2 = parseFloat(document.getElementById("numero2").value);
    // Realizar la multiplicación
    var resultado = (numero1 + numero2).toFixed(2);
    // Mostrar el resultado en la caja de texto
    document.getElementById("resultado").value = resultado;
}

function restar() {
    // Obtener los valores de los números ingresados
    var numero1 = parseFloat(document.getElementById("numero1").value);
    var numero2 = parseFloat(document.getElementById("numero2").value);
    // Realizar la multiplicación
    var resultado = (numero1 - numero2).toFixed(2);
    // Mostrar el resultado en la caja de texto
    document.getElementById("resultado").value = resultado;
}

function multiplicar() {
    // Obtener los valores de los números ingresados
    var numero1 = parseFloat(document.getElementById("numero1").value);
    var numero2 = parseFloat(document.getElementById("numero2").value);
    // Realizar la multiplicación
    var resultado = (numero1 * numero2).toFixed(2);
    // Mostrar el resultado en la caja de texto
    document.getElementById("resultado").value = resultado;
}

function dividir() {
    // Obtener los valores de los números ingresados
    var numero1 = parseFloat(document.getElementById("numero1").value);
    var numero2 = parseFloat(document.getElementById("numero2").value);
    // Realizar la multiplicación
    var resultado = (numero1 / numero2).toFixed(2);
    // Mostrar el resultado en la caja de texto
    document.getElementById("resultado").value = resultado;
}
