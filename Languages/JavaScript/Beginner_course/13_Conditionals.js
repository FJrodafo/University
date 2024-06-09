// Boolean values
function welcomeToBooleans() {
    // return true;
    return false;
}

// Use conditional logic with IF statements
function trueOrFalse(isItTrue) {
    if (isItTrue) {
        return "Yes, it's true!";
    }
    return "No, it's false.";
}

console.log(trueOrFalse(true));

// Comparison with the equality operator
function testEqual(val) {
    if (val == 12) {
        return "Equal";
    }
    return "Not Equal";
}

console.log(testEqual(12));

// Comparison with the strict equality operator
function testStrict(val) {
    if (val === 7) {
        return "Equal";
    }
    return "Not Equal";
}

console.log(testStrict("7"));

// Practice comparing different values
function compareEquality(a, b) {
    // if (a === b) {
    if (a == b) {
        return "Equal";
    }
    return "Not Equal";
}

console.log(compareEquality(10, "10"));

// Comparison with the inequality operator
function testNotEqual(val) {
    if (val != 99) {
        return "Not Equal";
    }
    return "Equal";
}

console.log(testNotEqual(10));

// Comparison with the strict inequality operator
function testStrictNotEqual(val) {
    if (val !== 10) {
        return "Not Equal";
    }
    return "Equal";
}

console.log(testStrictNotEqual("10"));
