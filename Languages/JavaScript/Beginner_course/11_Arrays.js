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
var myData = myArray[1];
console.log(myData); // 60

// Modify array data with indexes
ourArray = [18, 64, 99];
ourArray[1] = 45; // ourArray now equals [18, 45, 99];

myArray = [18, 64, 99];
myArray[0] = 45;
console.log(myArray); // [45, 64, 99]

// Access multi-dimensional arrays with indexes
myArray = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
    [[10, 11, 12], 13, 14]
];

myData = myArray[3][0][2];
console.log(myData); // 12

// Manipulate Arrays with push()
ourArray = ["Stimpson", "J", "Cat"];
ourArray.push(["happy", "joy"]); // ourArray now equals ["Stimpson", "J", "Cat", ["happy", "joy"]]

myArray = [["Fran", 22], ["Cat", 2]];
myArray.push(["Dog", 3]);
console.log(myArray); // [["Fran", 22], ["Cat", 2], ["Dog", 3]]

// Manipulate Arrays with pop()
ourArray = [1, 2, 3];
var removedFromOurArray = ourArray.pop(); // removedFromOurArray now equals 3, and ourArray now equals [1, 2]

myArray = [["Fran", 22], ["Cat", 2]];
var removedFromMyArray = myArray.pop();
console.log(myArray); // [["Fran", 22]]

// Manipulate Arrays with shift()
ourArray = ["Stimpson", "J", ["Cat"]];
var removedFromOurArray = ourArray.shift(); // removedFromOurArray now equals "Stimpson", and ourArray now equals ["J", ["Cat"]]

myArray = [["Fran", 22], ["Dog", 3]];
var removedFromMyArray = myArray.shift();
console.log(myArray); // [["Dog", 3]]

// Manipulate Arrays with unshift()
ourArray = ["Stimpson", "J", "Cat"];
ourArray.shift(); // ourArray now equals ["J", "Cat"]
ourArray.unshift("Happy"); // ourArray now equals ["Happy", "J", "Cat"]

myArray = [["Fran", 22], ["Dog", 3]];
myArray.shift();
myArray.unshift(["Paul", 35]);
console.log(myArray); // [["Paul", 35], ["Dog", 3]]

// Shopping list
var myList = [["Cereals", 3], ["Milk", 2], ["Bananas", 4], ["Juice", 1], ["Eggs", 12]];
