<!DOCTYPE html>
<?php

use Symfony\Contracts\HttpClient\Test\TestHttpServer;

session_start();
include("includes/connection.php");

if(!isset($_SESSION['user_email'])){
	header("location: index.php");
}

if(isset($_GET['post_id'])){
    // global $con;
    $post_id = $_GET['post_id'];
    $select = "INSERT INTO `like` (`user_id`, `post_id`) VALUES ('1', '4');";
    $run = mysqli_query($con, $select);
    $row = mysqli_fetch_array($run);
}
?>