// Example
var ourArray = ["Fran", 22];

var myArray = ["Quincy", 1];

// Nested arrays
ourArray = [["The universe", 42], ["everything", 101010]];

myArray = [
    ["Bulls", 23],
    ["White Sox", 45]
];

// Access array data with indexes
ourArray = [50, 60, 70];
var ourData = ourArray[0]; // equals 50

myArray = [50, 60, 70];
var myData = myArray[0];

console.log(myData);

// Modify array data with indexes
ourArray = [18, 64, 99];
ourArray[1] = 45; // ourArray now equals [18, 45, 99];

myArray = [18, 64, 99];
myArray[0] = 45;

console.log(myArray);

// Access multi-dimensional arrays with indexes
myArray = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
    [[10, 11, 12], 13, 14]
];

myData = myArray[3][0][2]; // 12
console.log(myData);
