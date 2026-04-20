<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require 'db_connection.php';

if (isset($_POST['UserID']) && isset($_POST['CartID']) && isset($_POST['Phone']) && isset($_POST['Address']) && isset($_POST['City']) && isset($_POST['Username']) && isset($_POST['TotalAmount'])) {
    $user_id = $_POST['UserID'];
    $cart_id = $_POST['CartID'];
    $phone = $_POST['Phone'];
    $address = $_POST['Address'];
    $city = $_POST['City'];
    $username = $_POST['Username'];
    $total_amount = $_POST['TotalAmount'];
    $payment_status = isset($_POST['PaymentStatus']) ? $_POST['PaymentStatus'] : 'Pending';

    $query = "INSERT INTO `checkout` (`UserID`, `CartID`, `Phone`, `Address`, `City`, `Username`, `TotalAmount`, `PaymentStatus`) VALUES ('$user_id', '$cart_id', '$phone', '$address', '$city', '$username', '$total_amount', '$payment_status')";

    $cmd = mysqli_query($conn, $query);

    if ($cmd) {
        $last_id = mysqli_insert_id($conn);
        echo json_encode(["success" => 1, "msg" => "Checkout created.", "id" => $last_id]);
    } else {
        echo json_encode(["success" => 0, "msg" => "Failed to create checkout."]);
    }
} else {
    echo json_encode(["success" => 0, "msg" => "Please provide all required fields."]);
}
?>
