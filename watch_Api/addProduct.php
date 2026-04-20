<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require 'db_connection.php';


if (isset($_POST['title'])) {
    $title = $_POST['title'];
    $desc = $_POST['desc'];
    $image = $_POST['image'];
    $price = $_POST['price'];
    $qty = $_POST['qty'];
    $cid = $_POST['cid'];
    $bid = $_POST['bid'];

    $query = "INSERT INTO `products` (`ProductID`, `Title`, `Description`, `Image`, `Price`, `Quantity`, `CategoryID`, `BrandID`, `CreatedAt`) VALUES (NULL, '$title', '$desc', '$image', '$price ', '$qty', '$cid', '$bid', current_timestamp());";

    $cmd = mysqli_query($conn, $query);

    if ($cmd) {
        echo json_encode(["success" => 1, "msg" => "Product Updated."]);
    } else {
        echo json_encode(["success" => 0, "msg" => "Product Not Updated!"]);
    }
} else {
    echo json_encode(["success" => 0, "msg" => "Please provide all required fields!"]);
}
