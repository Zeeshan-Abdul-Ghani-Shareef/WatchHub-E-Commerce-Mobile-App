<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require 'db_connection.php';

$query = "SELECT `UserID`, `Username`, `Email`, `Role`, `Image`, `CreatedAt` FROM `users`";
$result = mysqli_query($conn, $query);

if (mysqli_num_rows($result) > 0) {
    $users = mysqli_fetch_all($result, MYSQLI_ASSOC);
    echo json_encode(["success" => 1, "users" => $users]);
} else {
    echo json_encode(["success" => 0, "msg" => "No users found."]);
}
?>
