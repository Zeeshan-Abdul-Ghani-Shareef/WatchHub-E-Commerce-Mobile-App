<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require 'db_connection.php';

if (isset($_POST['UserID'])) {
    $user_id = $_POST['UserID'];

    $query = "SELECT `CheckoutID`, `UserID`, `CartID`, `Phone`, `Address`, `City`, `Username`, `TotalAmount`, `PaymentStatus`, `CheckoutTimestamp`, `UpdatedAt`
            FROM `checkout` WHERE `UserID` = '$user_id'";

    $result = mysqli_query($conn, $query);

    if (mysqli_num_rows($result) > 0) {
        $checkout = mysqli_fetch_all($result, MYSQLI_ASSOC);
        echo json_encode(["success" => 1, "checkout" => $checkout]);
    } else {
        echo json_encode(["success" => 0, "msg" => "No checkout records found for this user."]);
    }
} else {
    echo json_encode(["success" => 0, "msg" => "Please provide UserID."]);
}
