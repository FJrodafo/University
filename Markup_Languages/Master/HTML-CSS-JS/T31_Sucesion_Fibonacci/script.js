function sucesionFibonacci(n) {
    if (n <= 0 || n % 1 != 0) {
        alert('Introduzca un número válido.')
    } else {
        let serie = [];
        if (n == 1) {
            serie.push(0);
        } else if (n == 2) {
            serie.push(0, 1);
        } else {
            serie.push(0, 1);
            for (i = 2; i < n; i++) {
                serie.push(serie[i - 1] + serie[i - 2]);
            }
        }
        serie = serie.toString();
        document.getElementById('resultado').innerHTML = "<p>Los primeros " + n + " términos de la sucesión de Fibonacci son: " + serie + ".</p>";
    }
}
