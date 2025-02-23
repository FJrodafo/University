document.addEventListener("DOMContentLoaded", function () {
    var arr = [1, 2, 3, 4];

    // Primer Bucle (for...of)
    var forOfResult = "";
    for (i of arr) {
        forOfResult += i + " ";
    }
    document.getElementById("forOfResult").innerHTML = forOfResult;

    // Segundo Bucle (for...in)
    var forInResult = "";
    for (i in arr) {
        forInResult += i + " ";
    }
    document.getElementById("forInResult").innerHTML = forInResult;

    // Función forEach
    var forEachResult = "";
    arr.forEach(function (i) {
        forEachResult += i + " ";
    });
    document.getElementById("forEachResult").innerHTML = forEachResult;
});
