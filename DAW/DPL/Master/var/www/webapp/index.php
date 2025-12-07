<?php
// Si es una petición AJAX (fetch) devolvemos solo el resultado en JSON
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['ajax'])) {
    $a = isset($_POST['a']) ? floatval($_POST['a']) : 0;
    $b = isset($_POST['b']) ? floatval($_POST['b']) : 0;
    $op = $_POST['op'] ?? '+';

    $error = '';
    $resultado = null;

    switch ($op) {
        case '+':
            $resultado = $a + $b;
            break;
        case '-':
            $resultado = $a - $b;
            break;
        case '*':
            $resultado = $a * $b;
            break;
        case '/':
            if ($b == 0) {
                $error = 'No se puede dividir entre cero';
            } else {
                $resultado = $a / $b;
            }
            break;
        default:
            $error = 'Operación no válida';
    }

    header('Content-Type: application/json; charset=utf-8');
    echo json_encode([
        'error' => $error,
        'resultado' => $resultado
    ]);
    exit;
}
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Calculadora PHP</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #74b9ff, #00cec9);
            height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .calc-card {
            background: #ffffff;
            padding: 25px 30px;
            border-radius: 12px;
            box-shadow: 0 6px 18px rgba(0,0,0,0.18);
            width: 320px;
        }

        .calc-title {
            text-align: center;
            margin-top: 0;
            margin-bottom: 20px;
        }

        .row {
            display: flex;
            gap: 10px;
            margin-bottom: 15px;
            align-items: center;
        }

        .row input[type="number"] {
            flex: 1;
            padding: 8px;
            border-radius: 6px;
            border: 1px solid #b2bec3;
            font-size: 16px;
        }

        .row select {
            padding: 8px;
            border-radius: 6px;
            border: 1px solid #b2bec3;
            font-size: 16px;
        }

        .buttons {
            text-align: center;
            margin-top: 10px;
        }

        button {
            background: #0984e3;
            color: white;
            border: none;
            padding: 10px 18px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            transition: 0.2s;
        }

        button:hover {
            background: #74b9ff;
        }

        .resultado-box {
            margin-top: 20px;
            padding: 10px;
            border-radius: 6px;
            background: #dfe6e9;
            text-align: center;
            min-height: 30px;
            font-size: 18px;
        }

        .error {
            color: #d63031;
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="calc-card">
    <h2 class="calc-title">Calculadora PHP</h2>

    <form id="calcForm">
        <div class="row">
            <input type="number" step="any" name="a" id="a" placeholder="Primer número" required>
        </div>

        <div class="row">
            <select name="op" id="op">
                <option value="+">+</option>
                <option value="-">−</option>
                <option value="*">×</option>
                <option value="/">÷</option>
            </select>
        </div>

        <div class="row">
            <input type="number" step="any" name="b" id="b" placeholder="Segundo número" required>
        </div>

        <div class="buttons">
            <button type="submit">=</button>
        </div>
    </form>

    <div class="resultado-box" id="resultado">
        <!-- Aquí aparecerá el resultado -->
    </div>
</div>

<script>
document.getElementById('calcForm').addEventListener('submit', function (e) {
    e.preventDefault(); // Evitar recarga de la página

    const a = document.getElementById('a').value;
    const b = document.getElementById('b').value;
    const op = document.getElementById('op').value;

    const formData = new FormData();
    formData.append('a', a);
    formData.append('b', b);
    formData.append('op', op);
    formData.append('ajax', '1'); // Para que PHP sepa que es una petición AJAX

    fetch('', {
        method: 'POST',
        body: formData
    })
    .then(r => r.json())
    .then(data => {
        const resultadoDiv = document.getElementById('resultado');
        if (data.error) {
            resultadoDiv.innerHTML = '<span class="error">' + data.error + '</span>';
        } else {
            resultadoDiv.textContent = 'Resultado: ' + data.resultado;
        }
    })
    .catch(err => {
        document.getElementById('resultado').innerHTML =
            '<span class="error">Error al realizar el cálculo</span>';
        console.error(err);
    });
});
</script>

</body>
</html>

