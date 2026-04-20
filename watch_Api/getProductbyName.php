<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require 'db_connection.php';

if (isset($_POST['title'])) {
    $title = $_POST['title'];

    $query = "SELECT * FROM `products` WHERE `Title` LIKE '%$title%'";

    $result = mysqli_query($conn, $query);

    if (mysqli_num_rows($result) > 0) {
        $products = mysqli_fetch_all($result, MYSQLI_ASSOC);
        echo json_encode(["success" => 1, "products" => $products]);
    } else {
        echo json_encode(["success" => 0, "msg" => "No products found!"]);
    }
} else {
    echo json_encode(["success" => 0, "msg" => "Please provide the product name!"]);
}
