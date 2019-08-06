<?php
	require "conn.php";
	
	$username = $_POST["username"];
	
	$mysql_query = "delete from user where username = '".$username."';";
	if($conn->query($mysql_query) === TRUE) {
		echo "Insert success";
	}
?>