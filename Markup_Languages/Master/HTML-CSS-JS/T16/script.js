function cambiaPic() {
    var image = document.getElementById('myImage');
    if (image.src.match("red")) {
        image.src = "./assets/black.png";
    } else if (image.src.match("green")) {
        image.src = "./assets/red.png";
    } else {
        image.src = "./assets/green.png";
    }
}
