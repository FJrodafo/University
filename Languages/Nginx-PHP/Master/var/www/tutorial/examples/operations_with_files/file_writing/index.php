<?php
    file_put_contents("example.txt", "Loremipsum dolor sitamet, consectetueradipiscingelit.\n");
    file_put_contents("example.txt", "Aenean commodo ligulaeget dolor. Aeneanmassa.\n", FILE_APPEND);
    echo '"example.txt" was created!<br />';

    file_put_contents("test.txt", "Cum sociisnatoquepenatibus et magnisdisparturient montes, nasceturridiculus mus.\n");
    file_put_contents("test.txt", "Donecquamfelis, ultriciesnec, pellentesqueeu, pretiumquis, sem.\n", FILE_APPEND);
    echo '"test.txt" was created!<br />';

    $test = file_get_contents("test.txt");
    file_put_contents("example.txt", $test, FILE_APPEND);
    echo '"example.txt" was updated!<br />';
?>
