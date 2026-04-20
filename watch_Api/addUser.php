<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require 'db_connection.php';

if (($_POST['email'])) {
    $user = $_POST['user'];
    $email = $_POST['email'];
    $pass = $_POST['pass'];

    $query = "INSERT INTO `users` (`Username`, `Password`, `Email`, `Role`) VALUES ('$user', '$pass', '$email', 'user')";

    if (mysqli_query($conn, $query)) {
        echo json_encode(["success" => 1, "msg" => "User created successfully."]);
    } else {
        echo json_encode(["success" => 0, "msg" => "Failed to create user."]);
    }
} else {
    echo json_encode(["success" => 0, "msg" => "Please provide all required fields."]);
}
?>
