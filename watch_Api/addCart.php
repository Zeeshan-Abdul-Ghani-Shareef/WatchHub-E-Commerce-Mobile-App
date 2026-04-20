<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require 'db_connection.php';

if (isset($_POST['pid']) && isset($_POST['qty'])) {
    $pid = $_POST['pid'];
    $qty = $_POST['qty'];

    // Get product price
    $product_query = "SELECT price FROM products WHERE ProductID = '$pid'";
    $product_result = mysqli_query($conn, $product_query);
    $product = mysqli_fetch_assoc($product_result);

    if ($product) {
        $price = $product['price'];
        $total = $price * $qty;
        $query = "INSERT INTO `shopping_cart` (`UserID`, `ProductID`, `Quantity`, `Total`) VALUES (1, '$pid', '$qty', '$total')";
        $cmd = mysqli_query($conn, $query);

        if ($cmd) {
            $last_id = mysqli_insert_id($conn);
            echo json_encode(["success" => 1, "msg" => "Item added to cart.", "CartID" => $last_id]);
        } else {
            echo json_encode(["success" => 0, "msg" => "Failed to add item to cart."]);
        }
    } else {
        echo json_encode(["success" => 0, "msg" => "Product not found."]);
    }
} else {
    echo json_encode(["success" => 0, "msg" => "Please provide all required fields."]);
}
?>
