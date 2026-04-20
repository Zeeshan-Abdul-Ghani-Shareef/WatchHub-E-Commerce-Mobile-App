<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: DELETE");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require 'db_connection.php';

$data = json_decode(file_get_contents("php://input"));

if (isset($data->CheckoutID)) {
    $checkout_id = $data->CheckoutID;

    $query = "DELETE FROM `checkout` WHERE `CheckoutID` = '$checkout_id'";
    $cmd = mysqli_query($conn, $query);

    if ($cmd) {
        echo json_encode(["success" => 1, "msg" => "Checkout deleted successfully."]);
    } else {
        echo json_encode(["success" => 0, "msg" => "Failed to delete checkout."]);
    }
} else {
    echo json_encode(["success" => 0, "msg" => "Please provide the CheckoutID to delete."]);
}
?>
