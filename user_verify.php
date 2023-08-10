<?php
	session_start();
	if(!isset($_POST['submit'])){
		echo "Something wrong! Check again!";
		exit;
	}
	require_once "./functions/database_functions.php";
	$conn = db_connect();

	$email = trim($_POST['email']);
	$pass = trim($_POST['pass']);

	if($email == "" || $pass == ""){
		$_SESSION['err_login'] = "Email or Password is empty!";
		header("Location: user_login.php");
		exit;
	}

	$email = mysqli_real_escape_string($conn, $email);
	$pass = mysqli_real_escape_string($conn, $pass);
	$pass = sha1($pass);

	// get from db
	$query = "SELECT * from `users` where `email` = '{$email}' and `password` ='{$pass}'";
	$result = mysqli_query($conn, $query);
	if($result->num_rows <= 0){
		$_SESSION['err_login'] = "Incorrect Username or Password";
		header("Location: user_login.php");
		exit;
	}

    $row = mysqli_fetch_assoc($result);

	if(isset($conn)) {mysqli_close($conn);}
    $_SESSION['username'] = $row['username'];
    $_SESSION['userid'] = $row['userid'];
	$_SESSION['user'] = true;
	
    if(isset($_SESSION['LoginToCheckout']) && $_SESSION['LoginToCheckout']) {
        header('location: checkout.php');
    } else {
        header("Location: index.php");
    }
	
?>