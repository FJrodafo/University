<?php
    $dir = "/etc/php/";

    // Open a known directory, and proceed to read the contents.
    if (is_dir($dir)) {
        if ($dh = opendir($dir)) {
            while (($file = readdir($dh)) !== false) {
                echo "File name: " . $file . " | File type: " . filetype($dir . $file) . "<br />";
            }
            closedir($dh);
        }
    }
?>
