<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: DELETE");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require 'db_connection.php';

$data = json_decode(file_get_contents("php://input"));

if (isset($data->UserID)) {
    $user_id = $data->UserID;

    $query = "DELETE FROM `users` WHERE `UserID` = '$user_id'";

    if (mysqli_query($conn, $query)) {
        echo json_encode(["success" => 1, "msg" => "User deleted successfully."]);
    } else {
        echo json_encode(["success" => 0, "msg" => "Failed to delete user."]);
    }
} else {
    echo json_encode(["success" => 0, "msg" => "Please provide UserID to delete."]);
}
?>
