<?php
    $author1 = "John Doe";
    $author2 = "Max Mustermann";
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Hello, World!</title>
    </head>
    <body>
        <h2>Hello, World!</h2>
        <p>This dynamic web page was created by <?= $author1 ?>.</p>
        <p>Supported by <?= $author2 ?>.</p>
        <p><?= $author1 ?> and <?= $author2 ?> worked together on this project.</p>
    </body>
</html>
