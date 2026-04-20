<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require 'db_connection.php';

if (isset($_POST['cid'])) {
    $cid = $_POST['cid'];

    $query = "SELECT * FROM `categories` WHERE `CatID` = '$cid'";
    $cmd = mysqli_query($conn,$query);      
    $json_array=array();    
    while($row=mysqli_fetch_assoc($cmd))
    {
     $json_array[]=$row;
    }
   
    $output=json_encode(['category'=>$json_array]);    
    echo $output;
}
else
{
  echo json_encode(["success"=>0,"category"=>"Please fill all the required fields!"]);
}
