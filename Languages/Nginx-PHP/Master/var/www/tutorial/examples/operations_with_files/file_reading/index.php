<?php
    $example = file_get_contents("example.txt");
    echo $example;

    echo "<br /><br />";

    // The nl2br() function tells PHP that new lines should be automatically transformed into HTML line breaks.
    echo nl2br($example);

    echo "<br /><br />";

    $example = file("example.txt");
    echo $example [2];
?>
