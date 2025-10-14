<?php
    // COOKIES
    setcookie("Value_1", "1");
    setcookie("Value_2", "2");
    setcookie("Value_3", "3");
    setcookie("Value_4", "4");
    // SESSION
    session_start();
    $_SESSION['session_var_1'] = "Some defined value";
    $_SESSION['session_var_2'] = "Some other defined value";
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Example of reserved variables in PHP 7</title>
        <!-- http://tutorial.fjrodafo.com/examples/global_variables.php?var1=hello&var2=world&var3=0&var4=1234 -->
    </head>
    </head>
    <body>
        <h2>SERVER</h2><!-- SERVER -->
        <pre>
            <?php
                print_r($_SERVER);
            ?>
        </pre>
        <h2>GET</h2><!-- GET -->
        <pre>
            <?php
                print_r($_GET);
            ?>
        </pre>
        <h2>POST</h2><!-- POST -->
        <form method="post">
            <label for="name">Write your name:</label>
            <input type="text" name="name" value="<?=@$_POST['name'];?>" />
            <br />
            <br />
            <label for="age">Write your age:</label>
            <input type="text" name="age" value="<?=@$_POST['age'];?>" />
            <br />
            <br />
            <input type="submit" value="Send" />
        </form>
        <pre>
            <?php
                if($_POST) {
                    print_r($_POST);
                }
            ?>
        </pre>
        <h2>COOKIE</h2><!-- COOKIE -->
        <pre>
            <?php
                print_r($_COOKIE);
            ?>
        </pre>
        <h2>FILES</h2><!-- FILES -->
        <form method="post" enctype="multipart/form-data">
            <label for="file">File:</label>
            <input type="file" name="file" />
            <input type="submit" value="Send" />
        </form>
        <pre>
            <?php
                if($_FILES) {
                    print_r($_FILES);
                }
            ?>
        </pre>
        <h2>REQUEST</h2><!-- REQUEST -->
        <pre>
            <?php
                print_r($_REQUEST);
            ?>
        </pre>
        <h2>SESSION</h2><!-- SESSION -->
        <pre>
            <?php
                print_r($_SESSION);
            ?>
        </pre>
    </body>
</html>
