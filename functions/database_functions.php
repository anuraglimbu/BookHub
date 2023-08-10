<?php
	include "config.php";

	function db_connect(){
		$conn = mysqli_connect(DB_HOST, DB_USER, DB_PASS, DB_NAME);
		if(!$conn){
			echo "Can't connect database " . mysqli_connect_error($conn);
			exit;
		}
		return $conn;
	}

	function select4LatestBook($conn){
		$row = array();
		$query = "SELECT book_isbn, book_image, book_title FROM books ORDER BY abs(unix_timestamp(created_at)) DESC";
		$result = mysqli_query($conn, $query);
		if(!$result){
		    echo "Can't retrieve data " . mysqli_error($conn);
		    exit;
		}
		for($i = 0; $i < 4; $i++){
			array_push($row, mysqli_fetch_assoc($result));
		}
		return $row;
	}

	function getBookByIsbn($conn, $isbn){
		$query = "SELECT book_title, book_author, book_price FROM books WHERE book_isbn = '$isbn'";
		$result = mysqli_query($conn, $query);
		if(!$result){
			echo "Can't retrieve data " . mysqli_error($conn);
			exit;
		}
		return $result;
	}

	function getOrderId($conn, $userid, $date){
		$query = "SELECT orderid FROM orders WHERE userid = '$userid' AND date ='$date' ";
		$result = mysqli_query($conn, $query);
		if(!$result){
			echo "retrieve data failed!" . mysqli_error($conn);
			exit;
		}
		$row = mysqli_fetch_assoc($result);
		return $row['orderid'];
	}

	function insertIntoOrder($conn, $userid, $total_price, $date, $ship_name, $ship_address, $ship_city, $ship_zip_code){
		$query = "INSERT INTO orders VALUES 
		('', '" . $userid . "', '" . $total_price . "', '" . $date . "', '" . $ship_name . "', '" . $ship_address . "', '" . $ship_city . "', '" . $ship_zip_code . "', 0)";
		$result = mysqli_query($conn, $query);
		if(!$result){
			echo "Insert orders failed " . mysqli_error($conn);
			exit;
		}
	}

	function getbookprice($isbn){
		$conn = db_connect();
		$query = "SELECT book_price FROM books WHERE book_isbn = '$isbn'";
		$result = mysqli_query($conn, $query);
		if(!$result){
			echo "get book price failed! " . mysqli_error($conn);
			exit;
		}
		$row = mysqli_fetch_assoc($result);
		return $row['book_price'];
	}

	function setUserId($username, $name, $email, $contact, $address, $city, $zip_code, $gender, $password){
		$conn = db_connect();
		$query = "INSERT INTO users VALUES 
			('', '" . $username . "', '" . $name . "', '" . $email . "', '" . $contact . "', '','" . $address . "', '" . $city . "', '" . $zip_code . "', '" . $gender . "', '" . $password . "')";

		$result = mysqli_query($conn, $query);
		if(!$result){
			echo "insert false !" . mysqli_error($conn);
			return -1;
			exit;
		}
		$userid = mysqli_insert_id($conn);
		return $userid;
	}

	function getUserData($userid){
		$conn = db_connect();
		$query = "SELECT * from users WHERE `userid` = $userid";
		$result = mysqli_query($conn, $query);
		// if there is customer in db, take it out
		if($result->num_rows > 0){
			$row = mysqli_fetch_assoc($result);
			return $row;
		} else {
			return null;
		}
	}

	function getCompletedStatus($conn, $orderid) {
		$conn = db_connect();
		$query = "SELECT `completed` from orders WHERE `orderid` = $orderid";
		$result = mysqli_query($conn, $query);
		
		if($result->num_rows > 0){
			$row = mysqli_fetch_assoc($result);
			return $row;
		} else {
			return null;
		}
	}

	function getCatName($conn, $catid){
		$query = "SELECT category_name FROM category WHERE categoryid = '$catid'";
		$result = mysqli_query($conn, $query);
		if(!$result){
			echo "Can't retrieve data " . mysqli_error($conn);
			exit;
		}
		if(mysqli_num_rows($result) == 0){
			echo "Empty books ! Something wrong! check again";
			exit;
		}

		$row = mysqli_fetch_assoc($result);
		return $row['category_name'];
	}

	function getAll($conn){
		$query = "SELECT * from books ORDER BY book_isbn DESC";
		$result = mysqli_query($conn, $query);
		if(!$result){
			echo "Can't retrieve data " . mysqli_error($conn);
			exit;
		}
		return $result;
	}

	function getAllCategory($conn){
		$query = "SELECT * from category ORDER BY categoryid DESC";
		$result = mysqli_query($conn, $query);
		if(!$result){
			echo "Can't retrieve data " . mysqli_error($conn);
			exit;
		}
		return $result;
	}

	function getAllOrders($conn){
		$query = "SELECT * from orders ORDER BY orderid DESC";
		$result = mysqli_query($conn, $query);
		if(!$result){
			echo "Can't retrieve data " . mysqli_error($conn);
			exit;
		}
		return $result;
	}

	function getOrderDetails($orderid){
		$conn = db_connect();
		$query = "SELECT * from orders WHERE orderid = $orderid";
		$result = mysqli_query($conn, $query);
		if(!$result){
			echo "Can't retrieve data " . mysqli_error($conn);
			exit;
		}
		return $result;
	}

	function getOrderItems($orderid){
		$conn = db_connect();
		$query = "SELECT * from order_items WHERE orderid = $orderid";
		$result = mysqli_query($conn, $query);
		if(!$result){
			echo "Can't retrieve data " . mysqli_error($conn);
			exit;
		}
		return $result;
	}
?>