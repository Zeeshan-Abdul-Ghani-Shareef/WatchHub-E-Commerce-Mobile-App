<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: PUT");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require 'db_connection.php';

$data = json_decode(file_get_contents("php://input"));

if (isset($data->CheckoutID) && isset($data->UserID) && isset($data->CartID) && isset($data->Phone) && isset($data->Address) && isset($data->City) && isset($data->Username) && isset($data->TotalAmount)) {
    $checkout_id = $data->CheckoutID;
    $user_id = $data->UserID;
    $cart_id = $data->CartID;
    $phone = $data->Phone;
    $address = $data->Address;
    $city = $data->City;
    $username = $data->Username;
    $total_amount = $data->TotalAmount;
    $payment_status = isset($data->PaymentStatus) ? $data->PaymentStatus : 'Pending';

    $query = "UPDATE `checkout` SET `UserID` = '$user_id', `CartID` = '$cart_id', `Phone` = '$phone', `Address` = '$address', `City` = '$city', `Username` = '$username', `TotalAmount` = '$total_amount', `PaymentStatus` = '$payment_status' WHERE `CheckoutID` = '$checkout_id'";
    $cmd = mysqli_query($conn, $query);

    if ($cmd) {
        echo json_encode(["success" => 1, "msg" => "Checkout updated successfully."]);
    } else {
        echo json_encode(["success" => 0, "msg" => "Failed to update checkout."]);
    }
} else {
    echo json_encode(["success" => 0, "msg" => "Please provide all required fields."]);
}
?>
