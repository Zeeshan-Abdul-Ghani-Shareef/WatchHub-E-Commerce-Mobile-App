<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: PUT");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require 'db_connection.php';

$data = json_decode(file_get_contents("php://input"));

if (isset($data->CartID) && isset($data->Quantity)) {
    $cart_id = $data->CartID;
    $quantity = $data->Quantity;

    // Get the product price
    $cart_query = "SELECT ProductID FROM shopping_cart WHERE CartID = '$cart_id'";
    $cart_result = mysqli_query($conn, $cart_query);
    $cart_item = mysqli_fetch_assoc($cart_result);

    if ($cart_item) {
        $product_id = $cart_item['ProductID'];

        // Get product price
        $product_query = "SELECT price FROM products WHERE ProductID = '$product_id'";
        $product_result = mysqli_query($conn, $product_query);
        $product = mysqli_fetch_assoc($product_result);

        if ($product) {
            $price = $product['price'];
            $total = $price * $quantity;

            $query = "UPDATE `shopping_cart` SET `Quantity` = '$quantity', `Total` = '$total' WHERE `CartID` = '$cart_id'";

            $cmd = mysqli_query($conn, $query);

            if ($cmd) {
                echo json_encode(["success" => 1, "msg" => "Cart item updated successfully."]);
            } else {
                echo json_encode(["success" => 0, "msg" => "Failed to update cart item."]);
            }
        } else {
            echo json_encode(["success" => 0, "msg" => "Product not found."]);
        }
    } else {
        echo json_encode(["success" => 0, "msg" => "Cart item not found."]);
    }
} else {
    echo json_encode(["success" => 0, "msg" => "Please provide CartID and Quantity."]);
}
?>
