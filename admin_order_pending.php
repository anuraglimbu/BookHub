<?php
	$orderid = $_GET['orderid'];

	require_once "./functions/database_functions.php";
	$conn = db_connect();

	$query = "UPDATE orders SET completed=0 WHERE orderid = $orderid ";
	$result = mysqli_query($conn, $query);
	if(!$result){
		echo "Edited data unsuccessfully " . mysqli_error($conn);
		exit;
	}
	header("Location: admin_orders.php");
?>