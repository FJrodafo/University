function dibujarRombo(filas) {

    let output = '';

    //Parte creciente del rombo:
    for (let i = 1; i <= filas; i++) {
        let linea = '';
        for (let j = 1; j <= 2 * i - 1; j++) {
            linea += '*';
        }
        output += linea + '<br />';
    }

    //Parte decreciente del rombo:
    for (let i = filas - 1; i >= 1; i--) {
        let linea = '';
        for (let j = 1; j <= 2 * i - 1; j++) {
            linea += '*';
        }
        output += linea + '<br />';
    }
    document.getElementById('rombo').innerHTML = output;
}
dibujarRombo(15); //Ejecutamos la función.
