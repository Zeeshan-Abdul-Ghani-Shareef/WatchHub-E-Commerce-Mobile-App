<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require 'db_connection.php';

$query = "SELECT * FROM `checkout`";
$result = mysqli_query($conn, $query);

if (mysqli_num_rows($result) > 0) {
    $checkouts = mysqli_fetch_all($result, MYSQLI_ASSOC);
    echo json_encode(["success" => 1, "checkouts" => $checkouts]);
} else {
    echo json_encode(["success" => 0, "msg" => "No checkouts found."]);
}
?>
