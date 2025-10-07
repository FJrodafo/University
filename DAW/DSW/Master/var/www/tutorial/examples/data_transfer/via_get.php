<?php
    // http://tutorial.fjrodafo.com/data_transfer/via_get.php?forename=Fran&surname=Afonso
    $var1 = $_GET['forename'];
    $var2 = $_GET['surname'];
    echo "Hello " . $var1 . " " . $var2 . "!";
?>
