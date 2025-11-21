<?php
    $num1 = 10;
    $num2 = 20;

    $mensaje1 = ($num1 === $num2)
        ? "The condition is fulfilled."
        : "The condition is not fulfilled.";

    $mensaje2 = ($num1 === $num2)
        ? "The numbers are equal."
        : "The numbers are not equal.";

    # if ($num1 == $num2) {
    #     echo "The condition is fulfilled. <br />";
    # } else {
    #     echo "The condition is not fulfilled. <br />";
    # }

    # if ($num1 == $num2) {
    #     echo "The numbers are equal.";
    # } elseif (!($num1 == $num2)) {
    #     echo "The numbers are not equal.";
    # } else {
    #     echo "The numbers are equal.";
    # }
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Conditionals</title>
    </head>
    <body>
        <h2>Result</h2>
        <p><?= $num1 ?> = <?= $num2 ?></p>
        <p><?= $mensaje1 ?></p>
        <p><?= $mensaje2 ?></p>
    </body>
</html>
