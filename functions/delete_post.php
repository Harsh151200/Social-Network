<?php
$con = mysqli_connect("localhost","root","","social_network") or die("Connection was not established");

if(isset($_GET['post_id'])){
    $post_id = $_GET['post_id'];

    $delete_post = "delte from posts where post_id='$post_id'";

    $run_delte =mysqli_query($con,$delete_post);

    if($run_delete){
        echo "<script>alert('A Post have been deleted')</script>";
        echo "<script>window.open('../home.php','_self')</script>";
    }

}
?>