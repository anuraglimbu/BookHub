<?php
	session_start();
	if(!isset($_POST['submit'])){
		echo "Something wrong! Check again!";
		exit;
	}
	require_once "./functions/database_functions.php";
	$conn = db_connect();

    $username = trim($_POST['username']);
    $email = trim($_POST['email']);
    $name = trim($_POST['name']);
	$gender = trim($_POST['gender']);
    $contact = trim($_POST['contact']);
    $address = trim($_POST['address']);
    $city = trim($_POST['city']);
    $zip = trim($_POST['zip']);
	$pass = trim($_POST['pass']);
    $cpass = trim($_POST['cpass']);

    $username = mysqli_real_escape_string($conn, $username);
    $name = mysqli_real_escape_string($conn, $name);
	$email = mysqli_real_escape_string($conn, $email);
    $contact = mysqli_real_escape_string($conn, $contact);
    $address = mysqli_real_escape_string($conn, $address);
    $city = mysqli_real_escape_string($conn, $city);
    $zip = mysqli_real_escape_string($conn, $zip);


    // empty inputs
    foreach($_POST as $key => $value){
		if(trim($value) == '' || trim($value) == " "){
			$_SESSION['err_login'] = "Don't leave any values empty!";
            header("Location: user_signup.php");
            exit;
		}
		break;
	}

    // confirm pw
	if($cpass != $pass){
		$_SESSION['err_login'] = "Passwords don't match!";
		header("Location: user_signup.php");
		exit;
	}

    // username exists
	$result = mysqli_query($conn, "SELECT * from `users` where `username` = '{$username}'");
	if($result->num_rows > 0){
		$_SESSION['err_login'] = "Username already exists";
		header("Location: user_signup.php");
		exit;
	}

    // username exists
	$result = mysqli_query($conn, "SELECT * from `users` where `email` = '{$email}'");
	if($result->num_rows > 0){
		$_SESSION['err_login'] = "Email already exists";
		header("Location: user_signup.php");
		exit;
	}

    $pass = mysqli_real_escape_string($conn, $pass);
	$pass = sha1($pass);

    // insert into db
    $userid = setUserId($username, $name, $email, $contact, $address, $city, $zip, $gender, $pass);
    if ($userid == -1 ) {
        $_SESSION['err_login'] = "Error Signing Up";
		header("Location: user_signup.php");
		exit;
    } else {
        // get from db
        $query = "SELECT * from `users` where `userid` = $userid";
        $result = mysqli_query($conn, $query);
        if($result->num_rows <= 0){
            $_SESSION['err_login'] = "Error Signing Up";
            header("Location: user_signup.php");
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
    }
	
?>