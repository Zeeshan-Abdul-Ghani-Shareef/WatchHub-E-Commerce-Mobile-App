<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require 'db_connection.php';

if (isset($_POST['pid'])) {
    $pid= $_POST['pid'];

    $query = "DELETE FROM `products` WHERE `ProductID` = $pid";

    $cmd = mysqli_query($conn, $query);

    if ($cmd) {
        echo json_encode(["success" => 1, "msg" => "Product Deleted."]);
    } else {
        echo json_encode(["success" => 0, "msg" => "Product Not Deleted!"]);
    }
} else {
    echo json_encode(["success" => 0, "msg" => "Please provide the ProductID!"]);
}
