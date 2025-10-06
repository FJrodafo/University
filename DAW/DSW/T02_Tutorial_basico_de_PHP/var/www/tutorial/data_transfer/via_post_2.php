<?php
    $forename = $_POST["forename"];
    $surname = $_POST["surname"];
    $email = $_POST["email"];
    echo "Hello " . $forename . " " . $surname . "! <br />
    You have registered with the following email address: " . $email;
?>
