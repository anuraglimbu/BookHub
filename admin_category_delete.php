<?php
	$categoryid = $_GET['catid'];

	require_once "./functions/database_functions.php";
	$conn = db_connect();

	$query = "DELETE FROM category WHERE categoryid = $categoryid";
	$result = mysqli_query($conn, $query);
	if(!$result){
		echo "delete data unsuccessfully " . mysqli_error($conn);
		exit;
	}
	header("Location: admin_book.php");
?>