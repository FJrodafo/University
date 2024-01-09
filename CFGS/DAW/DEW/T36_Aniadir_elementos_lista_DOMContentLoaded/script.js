document.addEventListener('DOMContentLoaded', function () {
    // Utilizando getElementById y createElement
    document.getElementById('button').onclick = function () {
        let lista = document.getElementById('lista');
        let nuevoTexto = prompt('Ingrese el texto del nuevo elemento:');
        if (nuevoTexto) {
            let nuevoElemento = document.createElement('li');
            nuevoElemento.appendChild(document.createTextNode(nuevoTexto));
            lista.appendChild(nuevoElemento);
        }
    };

    /*
    // Utilizando querySelector y querySelectorAll
    document.querySelector('#button').onclick = function () {
        let lista = document.querySelector('#lista');
        let nuevoTexto = prompt('Ingrese el texto del nuevo elemento con querySelector:');
        if (nuevoTexto) {
            let nuevoElemento = document.createElement('li');
            nuevoElemento.appendChild(document.createTextNode(nuevoTexto));
            lista.appendChild(nuevoElemento);
        }
    };
    */
});
