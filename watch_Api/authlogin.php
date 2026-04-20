<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With");

require 'db_connection.php';

// Get input data


// Check if username and password are provided
if (($_POST['email'])) {
    $email = $_POST['email'];
    $pass = $_POST['pass'];

    // Query to find the user
    $query = "SELECT * FROM users WHERE Email = '$email'";
    $result = mysqli_query($conn, $query);

    if (mysqli_num_rows($result) > 0) {
        $user = mysqli_fetch_assoc($result);

        // Check if the password matches
        if ($pass === $user['Password']) {
            echo json_encode([
                "success" => 1,
                "msg" => "Login successful.",
                "UserID" => $user['UserID'],
                "Username" => $user['Username'],
                "Email" => $user['Email'],
                "Role" => $user['Role']
            ]);
        } else {
            echo json_encode(["success" => 0, "msg" => "Invalid password."]);
        }
    } else {
        echo json_encode(["success" => 0, "msg" => "User not found."]);
    }
} else {
    echo json_encode(["success" => 0, "msg" => "Please provide Username and Password."]);
}
?>
