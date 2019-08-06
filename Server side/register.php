<?php

	require "conn.php";

	$first_name =$_POST["first_name"];
	$last_name = $_POST["last_name"];
	$username = $_POST["username"];
	$password = $_POST["password"];
	$mysql_query = "insert into user (first_name, last_name, username, password) values ('$first_name', '$last_name', '$username', '$password');";

	if($conn->query($mysql_query) === TRUE) {
		echo "Insert success";
	}
	else {
		echo "Error: " . $sql . "<br>" . $conn->error;
	}
	$conn->close();

?>