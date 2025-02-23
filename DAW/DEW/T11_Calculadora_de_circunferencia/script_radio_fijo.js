var radio = 5; // Radio fijo de 5 m
var area = Math.PI * radio * radio;
var perimetro = 2 * Math.PI * radio;

document.getElementById("area").innerHTML = area.toFixed(2);
document.getElementById("perimetro").innerHTML = perimetro.toFixed(2);
