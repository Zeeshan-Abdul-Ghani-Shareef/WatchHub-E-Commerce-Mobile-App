<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require 'db_connection.php';

if (isset($_POST['pid'])) {
    $pid = $_POST['pid'];

    $query = "SELECT p.ProductID, p.Title, p.Description, p.Image, p.Price, p.Quantity, 
           c.Name as Category, b.Name as Brand 
    FROM products p
    JOIN categories c ON p.CategoryID = c.CatID
    JOIN brands b ON p.BrandID = b.BrandID
    WHERE p.ProductID = $pid";

    $cmd = mysqli_query($conn,$query);      
    $json_array=array();    
    while($row=mysqli_fetch_assoc($cmd))
    {
     $json_array[]=$row;
    }
   
    $output=json_encode(['product'=>$json_array]);    
    echo $output;
}
else
{
  echo json_encode(["success"=>0,"msg"=>"Please fill all the required fields!"]);
}