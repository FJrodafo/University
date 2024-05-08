function arabicToRoman(arabicNumber) {
    var romanNumerals = [
        { value: 1000, digit: "M" },
        { value: 900, digit: "CM" },
        { value: 500, digit: "D" },
        { value: 400, digit: "CD" },
        { value: 100, digit: "C" },
        { value: 90, digit: "XC" },
        { value: 50, digit: "L" },
        { value: 40, digit: "XL" },
        { value: 10, digit: "X" },
        { value: 9, digit: "IX" },
        { value: 5, digit: "V" },
        { value: 4, digit: "IV" },
        { value: 1, digit: "I" }
    ];

    var romanNumber = "";

    if (arabicNumber < 1 || arabicNumber > 4999) return alert("Only consider positive integers between 1 and 4999.");
    if (!arabicNumber && arabicNumber != 0) return "Enter a value between 1 and 4999.";

    for (var i = 0; i < romanNumerals.length; i++) {
        while (arabicNumber >= romanNumerals[i].value) {
            romanNumber += romanNumerals[i].digit;
            arabicNumber -= romanNumerals[i].value;
        }
    }

    return romanNumber;
}

function romanToArabic(romanNumber) {
    var romanNumerals = { "I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000 };
    var arabicNumber = 0;
    var consecutiveDigit = 0;

    if (!romanNumber) return "Enter a value in Roman numerals.";

    for (var i = 0; i < romanNumber.length; i++) {
        var currentDigit = romanNumerals[romanNumber[i]];
        var nextDigit = romanNumerals[romanNumber[i + 1]];
        if (currentDigit === nextDigit) {
            consecutiveDigit++;
            if (consecutiveDigit > 3) {
                return "Invalid value.";
            }
        } else {
            consecutiveDigit = 0;
        }
        if (nextDigit && currentDigit < nextDigit) {
            if (currentDigit !== 1 && currentDigit !== 10 && currentDigit !== 100) {
                return alert("Invalid value.");
            }
            if (nextDigit !== currentDigit * 5 && nextDigit !== currentDigit * 10) {
                return alert("Invalid value.");
            }
            arabicNumber -= currentDigit;
        } else {
            arabicNumber += currentDigit;
        }
    }

    if (arabicToRoman(arabicNumber) !== romanNumber) return alert("Invalid value.");

    return arabicNumber;
}

function converterArabicToRoman() {
    var arabicInput = parseInt(document.getElementById("arabic-input").value);
    var romanResult = arabicToRoman(arabicInput);

    if (romanResult === undefined || romanResult === null) document.getElementById("roman-result").innerText = "";
    else if (romanResult === "Enter a value between 1 and 4999.") document.getElementById("roman-result").innerText = romanResult;
    else document.getElementById("roman-result").innerHTML = `<span>${romanResult}</span>`;
}

function converterRomanToArabic() {
    var inputRomano = document.getElementById("roman-input").value.toUpperCase();
    var resultadoArabico = romanToArabic(inputRomano);

    if (resultadoArabico === undefined || resultadoArabico === null) {
        document.getElementById("arabic-result").innerHTML = "";
        return;
    }
    else document.getElementById("arabic-result").innerHTML = resultadoArabico;
}
