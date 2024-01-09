function generarArrayAleatorio(numElementos = 10, valorMinimo = 100, valorMaximo = 200) {
    const arrayAleatorio = [];

    for (let i = 0; i < numElementos; i++) {
        const elementoAleatorio = Math.floor(Math.random() * (valorMaximo - valorMinimo + 1)) + valorMinimo;
        arrayAleatorio.push(elementoAleatorio);
    }

    return arrayAleatorio;
}

document.getElementById('resultado').innerHTML = generarArrayAleatorio().join(', ');
// document.getElementById('resultado').innerHTML = generarArrayAleatorio(5, 1, 10).join(', ');
