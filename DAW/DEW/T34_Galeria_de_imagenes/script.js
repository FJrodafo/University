let currentImageIndex = 0;
const images = ["./FRUITS/ORANGE.png", "./FRUITS/PEPPER.png", "./FRUITS/PEAR.png"];

function showImage(index) {
    currentImageIndex = index;
    document.getElementById("mainImage").src = images[index];
}

function changeImage(direction) {
    currentImageIndex += direction;

    if (currentImageIndex < 0) {
        currentImageIndex = images.length - 1;
    } else if (currentImageIndex >= images.length) {
        currentImageIndex = 0;
    }

    document.getElementById("mainImage").src = images[currentImageIndex];
}

// Añadir eventos para navegar con las teclas de flecha
document.addEventListener("keydown", function (event) {
    if (event.key === "ArrowLeft") {
        changeImage(-1);
    } else if (event.key === "ArrowRight") {
        changeImage(1);
    }
});
