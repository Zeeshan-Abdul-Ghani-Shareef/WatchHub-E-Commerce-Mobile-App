<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: DELETE");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require 'db_connection.php';


if (isset($_POST['cid'])) {
    $cid = $_POST['cid'];

    $query = "DELETE FROM `categories` WHERE `CatID` = '$cid'";
    $cmd = mysqli_query($conn, $query);

    if ($cmd) {
        echo json_encode(["success" => 1, "msg" => "Category deleted successfully."]);
    } else {
        echo json_encode(["success" => 0, "msg" => "Failed to delete category."]);
    }
} else {
    echo json_encode(["success" => 0, "msg" => "Please provide the CatID to delete."]);
}
?>
