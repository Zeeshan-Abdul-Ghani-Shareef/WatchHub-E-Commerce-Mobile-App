<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require 'db_connection.php';

if (isset($_POST['pid'])) {
    $pid = $_POST['pid'];
    $title = $_POST['title'];
    $desc = $_POST['desc'];
    $image = $_POST['image'];
    $price = $_POST['Price'];
    $qty = $_POST['qty'];
    $cid = $_POST['cid'];
    $bid = $_POST['bid'];

    $query = "UPDATE `products` SET `Title` = '$title', `Description` = '$desc', `Image` = '$image', `Price` = '$price ', `Quantity` = '$qty', `CategoryID` = '$cid', 'BrandID' = '$bid'  WHERE `products`.`ProductID` = $pid";

    $cmd = mysqli_query($conn, $query);

    if ($cmd) {
        echo json_encode(["success" => 1, "msg" => "Product Updated."]);
    } else {
        echo json_encode(["success" => 0, "msg" => "Product Not Updated!"]);
    }
} else {
    echo json_encode(["success" => 0, "msg" => "Please provide all required fields!"]);
}
