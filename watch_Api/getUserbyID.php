<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require 'db_connection.php';

if (isset($_GET['UserID'])) {
    $user_id = $_GET['UserID'];

    $query = "SELECT `UserID`, `Username`, `Email`, `Role`, `Image`, `CreatedAt` FROM `users` WHERE `UserID` = '$user_id'";
    $result = mysqli_query($conn, $query);

    if (mysqli_num_rows($result) > 0) {
        $user = mysqli_fetch_assoc($result);
        echo json_encode(["success" => 1, "user" => $user]);
    } else {
        echo json_encode(["success" => 0, "msg" => "User not found."]);
    }
} else {
    echo json_encode(["success" => 0, "msg" => "Please provide UserID."]);
}
?>
