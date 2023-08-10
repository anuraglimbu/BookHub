<?php
	if(!isset($_SESSION['user']) && $_SESSION['user'] != true){
		$_SESSION['err_login'] = "Please Login First";
		header("Location: user_login.php");
	}
?>