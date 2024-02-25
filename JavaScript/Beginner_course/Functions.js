// Write reusable code with functions
function ourReusableFunction() {
    console.log("Heyya, World!");
}

ourReusableFunction();

function reusableFunction() {
    console.log("Hi, World!");
}

reusableFunction();
reusableFunction();

// Passing values to functions with arguments
function ourFunctionWithArgs(a, b) {
    console.log(a - b);
}

ourFunctionWithArgs(9, 5); // Outputs 4

function functionWithArgs(a, b) {
    console.log(a + b);
}

functionWithArgs(9, 5); // Outputs 14

// Global scope and functions
var myGlobal = 10;

function fun1() {
    var oopsGlobal = 5; // Without var keyword, it becomes global automatically
}

function fun2() {
    var output = "";
    if (typeof myGlobal != "undefined") {
        output += " myGlobal: " + myGlobal + "\n";
    }
    if (typeof oopsGlobal != "undefined") {
        output += " oopsGlobal: " + oopsGlobal;
    }
    console.log(output);
}

fun1();
fun2();

// Local scope and functions
function myLocalScope() {
    var myVar = 5; // myVar is only visible inside the function
    console.log(myVar);
}

myLocalScope();

console.log(myVar); // There is an error because it tried to access myVar outside of the function

// Global vs. Local scope in functions
var outerWear = "T-Shirt";

function myOutfit() {
    var outerWear = "Sweater";

    return outerWear;
}

console.log(myOutfit());
console.log(outerWear);

// Return a value from a function with return
function minusSeven(num) {
    return num - 7;
}

function timesFive(num) {
    return num * 5;
}

console.log(minusSeven(10)); // 3
console.log(timesFive(5)); // 25

// Understanding undefined value returned from a function
var sum = 0;

function addThree() {
    sum = sum + 3;
}

function addFive() {
    sum += 5;
}

addThree(); // Undefined
addFive(); // Undefined

// Assignment with a returned value
var changed = 0;
var processed = 0;

function change(num) {
    return (num + 5) / 3;
}

function processArg(num) {
    return (num + 3) / 5;
}

changed = change(10);
processed = processArg(7);

console.log(changed); // 5
console.log(processed); // 2

// Stand in line
function nextInLine(arr, item) {
    arr.push(item);
    // return item;
    return arr.shift();
}

var testArr = [1, 2, 3, 4, 5];

console.log("Before: " + JSON.stringify(testArr)); // Before: [1,2,3,4,5]
console.log(nextInLine(testArr, 6)); // 1
console.log("After: " + JSON.stringify(testArr)); // After: [2,3,4,5,6]
