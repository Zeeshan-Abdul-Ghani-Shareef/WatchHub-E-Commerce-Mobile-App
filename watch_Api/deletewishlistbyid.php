<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: DELETE");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require 'db_connection.php';

$data = json_decode(file_get_contents("php://input"));

if (isset($data->UserID) && isset($data->ProductID)) {
    $user_id = $data->UserID;
    $product_id = $data->ProductID;

    $query = "DELETE FROM `wishlist` WHERE `UserID` = '$user_id' AND `ProductID` = '$product_id'";

    if (mysqli_query($conn, $query)) {
        echo json_encode(["success" => 1, "msg" => "Product removed from wishlist successfully."]);
    } else {
        echo json_encode(["success" => 0, "msg" => "Failed to remove product from wishlist."]);
    }
} else {
    echo json_encode(["success" => 0, "msg" => "Please provide UserID and ProductID."]);
}
?>
