<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require 'db_connection.php';

if (isset($_POST['name']) && isset($_POST['desc'])) {
    $name = $_POST['name'];
    $desc = $_POST['desc'];
    $image = $_POST['image'];

    $query = "INSERT INTO `categories` (`Name`, `Description`, `Image`) VALUES ('$name', '$desc', '$image')";
    $cmd = mysqli_query($conn, $query);

    if ($cmd) {
        $last_id = mysqli_insert_id($conn);
        echo json_encode(["success" => 1, "msg" => "Category created.", "id" => $last_id]);
    } else {
        echo json_encode(["success" => 0, "msg" => "Failed to create category."]);
    }
} else {
    echo json_encode(["success" => 0, "msg" => "Please provide all required fields."]);
}
?>
