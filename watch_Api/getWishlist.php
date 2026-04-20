<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require 'db_connection.php';

if (isset($_POST['UserID'])) {
    $user_id = $_POST['UserID'];

    $query = "SELECT `WishlistID`, `UserID`, `ProductID`, `DateAdded` FROM `wishlist` WHERE `UserID` = '$user_id'";
    $result = mysqli_query($conn, $query);

    if (mysqli_num_rows($result) > 0) {
        $wishlist = mysqli_fetch_all($result, MYSQLI_ASSOC);
        echo json_encode(["success" => 1, "wishlist" => $wishlist]);
    } else {
        echo json_encode(["success" => 0, "msg" => "No products found in wishlist."]);
    }
} else {
    echo json_encode(["success" => 0, "msg" => "Please provide UserID."]);
}
?>
