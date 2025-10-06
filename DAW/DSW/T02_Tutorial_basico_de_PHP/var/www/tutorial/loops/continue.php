<?php
    for ($num = 1; $num <= 10 ; $num++) {
        if ($num == 5) {
            echo "Number 5 has been omitted!<br />";
            continue;
        } else {
            echo $num . "<br />";
        }
    }
?>
