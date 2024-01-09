let monutain_01 = document.getElementById('monutain_01');
let monutain_02 = document.getElementById('monutain_02');
let monutain_03 = document.getElementById('monutain_03');
let monutain_04 = document.getElementById('monutain_04');
let trees = document.getElementById('trees');
let cable_cars = document.getElementById('cable_cars');
let text = document.getElementById('text');
let house = document.getElementById('house');
let header = document.querySelector('header');

window.addEventListener('scroll', function () {
    let value = window.scrollY;
    monutain_01.style.top = value * -0.2 + 'px';
    monutain_02.style.top = value * -0.1 + 'px';
    monutain_03.style.top = value * -0.4 + 'px';
    monutain_04.style.top = value * -0.3 + 'px';
    trees.style.top = value * -0.3 + 'px';
    cable_cars.style.marginLeft = value * 1 + 'px';
    cable_cars.style.top = value * 0.6 + 'px';
    text.style.marginRight = value * 1.5 + 'px';
    house.style.top = value * 0.01 + 'px';
    header.style.top = value * 0.5 + 'px';
});