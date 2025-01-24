// Obtener el elemento del cuadrado por su ID
const cuadrado = document.getElementById('miCuadrado');

// Función para cambiar el color del cuadrado al hacer clic
cuadrado.addEventListener('click', function () {
    const colorActual = cuadrado.style.backgroundColor;
    const nuevoColor = (colorActual === 'red' || colorActual === '') ? 'blue' : 'red';
    cuadrado.style.backgroundColor = nuevoColor;
});

// Función para mostrar un mensaje al pasar el ratón sobre el cuadrado
cuadrado.addEventListener('mouseover', function () {
    console.log('¡Ratón dentro del cuadrado!');
});

// Función para mostrar un mensaje al salir el ratón del cuadrado
cuadrado.addEventListener('mouseout', function () {
    console.log('¡Ratón fuera del cuadrado!');
});
