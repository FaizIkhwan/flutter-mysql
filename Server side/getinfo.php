<?php
	require "conn.php";
	$username = $_POST["username"];	

	$mysql_query = "select * from user where username like '".$username."';";
	$queryResult = mysqli_query($conn, $mysql_query);
	$result = array();

	while($fetchData = mysqli_fetch_array($queryResult)) {	
		$result[] = $fetchData;
	}

	echo json_encode($result);

?>