<?php

$server = "localhost";
// Place the username for the MySQL database here
//$username = "root";
$username = "root";
// Place the password for the MySQL database here
//$password = "";
$password = "";
// Place the name for the MySQL database here
// $database = "ecommdbmar";
$database = "watchhub";

// NEW Run the actual connection here
$conn = mysqli_connect($server, $username, $password, $database)
    or die("Could not connect to database");
