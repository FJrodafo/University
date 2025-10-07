<?php
    $a = 1;

    increase($a);

    print $a;

    function increase (&$a) {
        $a = $a + 1;
    }
?>
