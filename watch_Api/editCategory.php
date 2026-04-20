<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: PUT");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require 'db_connection.php';

if (isset($_POST['cid'])) {
    $cid = $_POST['cid'];
    $name = $_POST['name'];
    $desc = $_POST['desc'];
    $image = $_POST['image'];

    $query = "UPDATE `categories` SET `Name` = '$name', `Description` = '$desc', `Image` = '$image' WHERE `categories`.`CatID` = $cid";

    $cmd = mysqli_query($conn, $query);

    if ($cmd) {
        echo json_encode(["success" => 1, "msg" => "Category Updated."]);
    } else {
        echo json_encode(["success" => 0, "msg" => "Category Not Updated!"]);
    }
} else {
    echo json_encode(["success" => 0, "msg" => "Please provide all required fields!"]);
}