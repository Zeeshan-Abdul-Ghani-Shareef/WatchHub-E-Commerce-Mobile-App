<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require 'db_connection.php';

if (isset($_POST['CartID'])) {
    $cart_id = $_POST['CartID'];

    $query = "SELECT * FROM `shopping_cart` WHERE `CartID` = '$cart_id'";
    $result = mysqli_query($conn, $query);

    if (mysqli_num_rows($result) > 0) {
        $cart_item = mysqli_fetch_assoc($result);
        echo json_encode(["success" => 1, "cart_item" => $cart_item]);
    } else {
        echo json_encode(["success" => 0, "msg" => "Cart item not found."]);
    }
} else {
    echo json_encode(["success" => 0, "msg" => "Please provide CartID."]);
}
?>
