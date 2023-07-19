<head>
    <title>Francesco server</title>
</head>
<?php

   $user = "francesco";
   $password = "password";
   $database = "my_database";
   $host = "127.0.0.1";
   
   try {

        $db = new PDO("mysql:host=$host;dbname=$database", $user, $password);
        echo "<h1>Connection successfully!</h1>";
        echo "<div>user: $user</div>";
        echo "<div>password: $password</div>";
        echo "<div>database: $database</div>";
        echo "<div>host: $host</div>";

   } catch (PDOException $e) {

       print "Error!: " . $e->getMessage() . "<br/>";
       die();

   }