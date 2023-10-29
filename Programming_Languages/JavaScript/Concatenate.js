// Concatenating strings with plus operator
var firstExample = "I come first." + " " + "I come second.";
console.log(firstExample); // I come first. I come second.

// Concatenating strings with plus equals operator
var secondExample = "I come first.";
secondExample += " I come second.";
console.log(secondExample); // I come first. I come second.

// Concatenating strings with variables
var myName = "Fran";
var myStr = "Hello, my name is " + myName + ", how are you?";
console.log(myStr); // Hello, my name is Fran, how are you?

// Appending variables to strings
var sentence = "JavaScript is";
var adjective = " awesome!";
sentence += adjective;
console.log(sentence); // JavaScript is awesome!
