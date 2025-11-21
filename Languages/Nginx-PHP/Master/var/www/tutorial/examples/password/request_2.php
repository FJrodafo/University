<?php
    $username = $_POST["username"];
    $password = $_POST["password"];

    if ($username == "FJrodafo" AND $password == "1234") {
        echo "Welcome " . $username . "!";
    } else {
        echo "Access denied";
    }
?>
