<?php
/*
	require_once("config.php");
	$email = $_POST['inputEmail'];
	$pswd = $_POST['inputPasswd'];

	$conn = mysqli_connect(DB_HOST, DB_USER, DB_PASS, DB_NAME);
	if(!$conn){
		echo "Cannot connecto to database " . mysqli_connect_error($conn);
		exit;
	}

	$query = "SELECT username, password FROM admin";
	$result = mysqli_query($conn, $query);
	if(!$result){
		echo "Empty!";
		exit;
	}

	while ($row = mysqli_fetch_assoc($result)){
		if($email == $row['username'] && $pswd == $row['password']){
			echo "Welcome admin! Long time no see";
			break;
		}
	}*/
	echo sha1("12345678");
?>