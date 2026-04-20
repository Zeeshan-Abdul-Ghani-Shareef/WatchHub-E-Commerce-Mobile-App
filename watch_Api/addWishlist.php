<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require 'db_connection.php';

$data = json_decode(file_get_contents("php://input"));

if (isset($data->UserID) && isset($data->ProductID)) {
    $user_id = $data->UserID;
    $product_id = $data->ProductID;

    $query = "INSERT INTO `wishlist` (`UserID`, `ProductID`) VALUES ('$user_id', '$product_id')";
    if (mysqli_query($conn, $query)) {
        echo json_encode(["success" => 1, "msg" => "Product added to wishlist successfully."]);
    } else {
        echo json_encode(["success" => 0, "msg" => "Failed to add product to wishlist."]);
    }
} else {
    echo json_encode(["success" => 0, "msg" => "Please provide UserID and ProductID."]);
}
?>
