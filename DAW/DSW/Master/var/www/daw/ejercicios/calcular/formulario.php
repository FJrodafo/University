<?php
    // Muestra un formulario para que el usuario introduzca dos números
?>

<h2>Calculadora</h2>
<form action="calcular.php" method="post">
    <label for="num1">Primer número:</label>
    <input type="number" name="num1" id="num1" required />
    <br />
    <br />
    <label for="num2">Segundo número:</label>
    <input type="number" name="num2" id="num2" required />
    <br />
    <br />
    <input type="submit" value="Calcular" />
</form>
