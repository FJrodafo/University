<?php
    $num1 = 237;
    $num2 = 148;

    $addition = $num1 + $num2;
    $subtraction = $num1 - $num2;
    $multiplication = $num1 * $num2;
    $division = $num1 / $num2;
    $exponentiation = $num1 ** 2;

    echo "Addition: " . $num1 . " + " . $num2 . " = " . $addition . "<br />";
    echo "Subtraction: " . $num1 . " - " . $num2 . " = " . $subtraction . "<br />";
    echo "Multiplication: " . $num1 . " * " . $num2 . " = " . $multiplication . "<br />";
    echo "Division: " . $num1 . " / " . $num2 . " = " . $division . "<br />";
    echo "Exponentiation: " . $num1 . "^2 = " . $exponentiation . "<br />";
    echo "Square root: √" . $num2 . " = " . sqrt($num2) . "<br />";

    echo "<br />";

    $num1 = 10;
    $num2 = 5;
    $result = 2 * $num1 + $num2 * $num2 - 3 * sqrt(81);
    echo "2 * 10 + 5 * 5 - 3 * √81 = 20 + 25 - 27 = " . $result;

    echo "<br />";

    $num1 = 2.5;
    $num2 = 3.7;
    $result = 2 * ($num1 + 5) * ($num2 - 3) * sqrt(81);
    echo "2 * (2.5 + 5) * (3.7 - 3) * √81 = " . $result;

    echo "<br />";

    $num = 0;
    $result = ++$num;
    echo "++0 = " . $result;

    echo "<br />";

    $num = 0;
    $result = --$num;
    echo "--0 = " . $result;
?>
