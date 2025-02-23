const espaniolBtn = document.getElementById('espaniolBtn')
const inglesBtn = document.getElementById('inglesBtn')
const japonesBtn = document.getElementById('japonesBtn')

espaniolBtn.onclick = function () {
    alert('Bienvenido')
    console.log('Selección del usuario: Español')
}

inglesBtn.onclick = function () {
    alert('Welcome')
    console.log('Selección del usuario: Inglés')
}

japonesBtn.onclick = function () {
    alert('ようこそ')
    console.log('Selección del usuario: Japonés')
}
