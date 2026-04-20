<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: PUT");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require 'db_connection.php';

$data = json_decode(file_get_contents("php://input"));

if (isset($data->UserID) && isset($data->NewPassword)) {
    $user_id = $data->UserID;
    $new_password = $data->NewPassword;

    // Hash the new password for security
    $hashed_password = password_hash($new_password, PASSWORD_DEFAULT);

    // SQL query to update the password
    $query = "UPDATE `users` SET `Password` = '$hashed_password' WHERE `UserID` = '$user_id'";

    $cmd = mysqli_query($conn, $query);

    if ($cmd) {
        echo json_encode(["success" => 1, "msg" => "Password updated successfully."]);
    } else {
        echo json_encode(["success" => 0, "msg" => "Password update failed."]);
    }
} else {
    echo json_encode(["success" => 0, "msg" => "Please provide UserID and NewPassword."]);
}
?>
