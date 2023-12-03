function cambiaPic() {
    var image = document.getElementById('myImage');
    if (image.src.match("black")) {
        image.src = "./assets/green.png";
    } else if (image.src.match("green")) {
        image.src = "./assets/red.png";
    } else {
        image.src = "./assets/black.png";
    }
}
