<?php
	require "conn.php";
	
	$first_name =$_POST["first_name"];
	$last_name = $_POST["last_name"];
	$username = $_POST["username"];
	$password = $_POST["password"];
	$mysql_query = "update user set first_name = '$first_name', last_name = '$last_name', password = '$password' where username = '$username';";
	if($conn->query($mysql_query) === TRUE) {
		echo "Insert success";
	}
?>