<?php
    $num1 = 10;
    $num2 = 20;

    if ($num1 == $num2) {
        echo "The condition is fulfilled. <br />";
    } else {
        echo "The condition is not fulfilled. <br />";
    }

    if ($num1 == $num2) {
        echo "The numbers are equal.";
    } elseif (!($num1 == $num2)) {
        echo "The numbers are not equal.";
    } else {
        echo "The numbers are equal.";
    }
?>
