<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require 'db_connection.php';

if (isset($_POST['CheckoutID'])) {
    $checkout_id = $_POST['CheckoutID'];

    $query = "SELECT * FROM `checkout` WHERE `CheckoutID` = '$checkout_id'";
    $result = mysqli_query($conn, $query);

    if (mysqli_num_rows($result) > 0) {
        $checkout = mysqli_fetch_assoc($result);
        echo json_encode(["success" => 1, "checkout" => $checkout]);
    } else {
        echo json_encode(["success" => 0, "msg" => "Checkout not found."]);
    }
} else {
    echo json_encode(["success" => 0, "msg" => "Please provide the CheckoutID."]);
}
?>
