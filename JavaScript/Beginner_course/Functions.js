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