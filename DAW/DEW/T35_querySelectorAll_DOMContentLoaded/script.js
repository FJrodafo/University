document.addEventListener('DOMContentLoaded', function () {
    /*
    // Crear un nuevo contenedor div
    var nuevoContenedor = document.createElement('div');
    document.body.insertBefore(nuevoContenedor, document.body.firstChild);
    
    // Crear un nuevo párrafo dentro del contenedor
    var nuevoParrafo = document.createElement('p');
    nuevoContenedor.appendChild(nuevoParrafo);
    */

    // Crear un nuevo párrafo
    var nuevoParrafo = document.createElement('p');
    // document.body.appendChild(nuevoParrafo);
    document.body.insertBefore(nuevoParrafo, document.body.firstChild);

    // Aplicar estilos al nuevo párrafo
    nuevoParrafo.style.border = '1px solid black';
    nuevoParrafo.style.padding = '10px';
    // Hacer que el párrafo ocupe solo el ancho del contenido
    nuevoParrafo.style.display = 'inline-block';

    // Número de enlaces de la página
    var numeroEnlaces = document.getElementsByTagName('a').length;
    // var numeroEnlaces = document.querySelectorAll('a').length;
    nuevoParrafo.innerHTML += 'Número de enlaces de la página: <span style="color: green;">' + numeroEnlaces + '</span><br />';
    console.log('Número de enlaces de la página:', numeroEnlaces);

    // Dirección a la que enlaza el penúltimo enlace
    var penultimoEnlace = document.getElementsByTagName('a')[numeroEnlaces - 2];
    // var penultimoEnlace = document.querySelectorAll('a')[numeroEnlaces - 2];
    nuevoParrafo.innerHTML += 'Dirección del penúltimo enlace: <span style="color: green;">' + penultimoEnlace.href + '</span><br />';
    console.log('Dirección del penúltimo enlace:', penultimoEnlace.href);

    // Número de enlaces que enlazan a http://prueba
    var enlacesAHttpPrueba = document.querySelectorAll('a[href="http://prueba"]').length;
    nuevoParrafo.innerHTML += 'Número de enlaces que enlazan a http://prueba: <span style="color: green;">' + enlacesAHttpPrueba + '</span><br />';
    console.log('Número de enlaces que enlazan a http://prueba:', enlacesAHttpPrueba);

    // Número de enlaces del tercer párrafo
    var tercerParrafo = document.getElementsByTagName('p')[2];
    var enlacesEnTercerParrafo = tercerParrafo.getElementsByTagName('a').length;
    /*
    var tercerParrafo = document.querySelector('p:nth-child(3)');
    var enlacesEnTercerParrafo = tercerParrafo.querySelectorAll('a').length;
    */
    nuevoParrafo.innerHTML += 'Número de enlaces del tercer párrafo: <span style="color: green;">' + enlacesEnTercerParrafo + '</span>';
    console.log('Número de enlaces del tercer párrafo:', enlacesEnTercerParrafo);
});
