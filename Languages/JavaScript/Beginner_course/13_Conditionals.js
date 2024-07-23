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

// Comparison with the Equality operator
function testEqual(val) {
    if (val == 12) {
        return "Equal";
    }
    return "Not Equal";
}

console.log(testEqual(12));

// Comparison with the Strict Equality operator
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

// Comparison with the Inequality operator
function testNotEqual(val) {
    if (val != 99) {
        return "Not Equal";
    }
    return "Equal";
}

console.log(testNotEqual(10));

// Comparison with the Strict Inequality operator
function testStrictNotEqual(val) {
    if (val !== 10) {
        return "Not Equal";
    }
    return "Equal";
}

console.log(testStrictNotEqual("10"));

// Comparison with the Greater Than operator
function testGreaterThan(val) {
    if (val > 100) {
        return "Over 100";
    }
    if (val > 10) {
        return "Over 10";
    }
    return "10 or Under";
}

console.log(testGreaterThan(10));

// Comparison with the Greater Than or Equal To operator
function testGreaterOrEqual(val) {
    if (val >= 20) {
        return "20 or Over";
    }
    if (val >= 10) {
        return "10 or Over";
    }
    return "Less than 10";
}

console.log(testGreaterOrEqual(10));

// Comparison with the Less Than operator
function testLessThan(val) {
    if (val < 25) {
        return "Under 25";
    }
    if (val < 55) {
        return "Under 55";
    }
    return "55 or Over";
}

console.log(testLessThan(10));

// Comparison with the Less Than or Equal To operator
function testLessOrEqual(val) {
    if (val <= 12) {
        return "12 or Under";
    }
    if (val <= 24) {
        return "24 or Under";
    }
    return "More than 24";
}

console.log(testLessOrEqual(10));

// Comparison with the Logical And operator
function testLogicalAnd(val) {
    if (val <= 50 && val >= 25) {
        return "Yes";
    }

    return "No";
}

console.log(testLessOrEqual(40));

// Comparison with the Logical Or operator
function testLogicalOr(val) {
    if (val < 10 || val > 20) {
        return "Outside";
    }

    return "Inside";
}

console.log(testLessOrEqual(15));
