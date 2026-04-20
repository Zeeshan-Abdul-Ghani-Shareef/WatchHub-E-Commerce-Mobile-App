<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: PUT");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require 'db_connection.php';

$data = json_decode(file_get_contents("php://input"));

if (isset($data->UserID)) {
    $user_id = $data->UserID;
    $username = isset($data->Username) ? $data->Username : '';
    $email = isset($data->Email) ? $data->Email : '';
    $image = isset($data->Image) ? $data->Image : '';

    $query = "UPDATE `users` SET `Username` = '$username', `Email` = '$email', `Image` = '$image'";

    $query .= " WHERE `UserID` = '$user_id'";

    if (mysqli_query($conn, $query)) {
        echo json_encode(["success" => 1, "msg" => "User updated successfully."]);
    } else {
        echo json_encode(["success" => 0, "msg" => "Failed to update user."]);
    }
} else {
    echo json_encode(["success" => 0, "msg" => "Please provide UserID."]);
}
?>
