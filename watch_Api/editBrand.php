<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: PUT");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require 'db_connection.php';

if (isset($_POST['bid'])) {
    $bid = $_POST['bid'];
    $name = $_POST['name'];
    $desc = $_POST['desc'];
    $Image = $_POST['Image'];

    $query = "UPDATE `brands` SET `Name` = '$name', `Description` = '$desc', `Image` = '$image' WHERE `brands`.`BrandID` = $bid";

    $cmd = mysqli_query($conn, $query);

    if ($cmd) {
        echo json_encode(["success" => 1, "msg" => "brand Updated."]);
    } else {
        echo json_encode(["success" => 0, "msg" => "brand Not Updated!"]);
    }
} else {
    echo json_encode(["success" => 0, "msg" => "Please provide all required fields!"]);
}