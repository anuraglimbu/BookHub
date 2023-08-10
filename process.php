<?php
	session_start();
	if(!isset($_SESSION['user']) || $_SESSION['user'] != true) {
		$_SESSION['err_login'] = "You need to be logged in to purchase";
		header("Location: user_login.php");
		exit;
	}

	$_SESSION['err'] = 1;
	foreach($_POST as $key => $value){
		if(trim($value) == ''){
			$_SESSION['err'] = 0;
		}
		break;
	}

	if($_SESSION['err'] == 0){
		header("Location: purchase.php");
	} else {
		unset($_SESSION['err']);
	}

	require_once "./functions/database_functions.php";
	// print out header here
	$title = "Purchase Process";
	require "./template/header.php";
	// connect database
	$conn = db_connect();
	extract($_SESSION['ship']);

	// find customer
	$userid = $_SESSION['userid'];

	$date = date("Y-m-d H:i:s");
	insertIntoOrder($conn, $userid, $_SESSION['total_price'], $date, $name, $address, $city, $zip_code);

	// take orderid from order to insert order items
	$orderid = getOrderId($conn, $userid, $date);
	
	foreach($_SESSION['cart'] as $isbn => $qty){
		$bookprice = getbookprice($isbn);
		
		$query = "INSERT INTO order_items VALUES('$orderid', '$isbn', '$bookprice', '$qty')";
		$result = mysqli_query($conn, $query);
		if(!$result){
			echo "Insert value false!" . mysqli_error($conn);
			exit;
		}
	}

	unset($_SESSION['cart']);
?>
	<div class="alert alert-success rounded-0 my-4">Your order has been processed sucessfully. We'll be reaching you out to confirm your order. Thanks!</div>
	
<?php
	if(isset($conn)){
		mysqli_close($conn);
	}
	require_once "./template/footer.php";
?>