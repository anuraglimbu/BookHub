<?php
	session_start();
    require_once "./functions/admin.php";
	require_once "./functions/database_functions.php";
	require_once "./functions/cart_functions.php";

	// orderid got from form get method
	if(!isset($_GET['orderid'])){
		header("Location: admin_orders.php");
        exit;
	} else {
        $orderid = $_GET['orderid'];
    }

	// print out header here
	$title = "Order Details";
	require "./template/header.php";
?>
	<h4 class="fw-bolder text-center">Order Details</h4>
      <center>
        <hr class="underline" style="width:5em;height:3px;opacity:1">
      </center>
<?php
    $items = getOrderItems($orderid);
    $total_items = 0;
    $total_price = 0;

    if($items->num_rows > 0) {
?>
	<div class="card rounded-0 shadow">
		<div class="card-body">
			<div class="container-fluid">
				<form action="cart.php" method="post" id="cart-form">
					<table class="table">
						<tr>
							<th>Item</th>
							<th>Price</th>
							<th>Quantity</th>
							<th>Total</th>
						</tr>
						<?php
							while($row = mysqli_fetch_assoc($items)){
								$conn = db_connect();
								$book = mysqli_fetch_assoc(getBookByIsbn($conn, $row['book_isbn']));
                                $total_items += $row['quantity'];
                                $total_price += ($row['quantity'] * $book['book_price']);
						?>
						<tr>
							<td><?php echo $book['book_title'] . " by " . $book['book_author']; ?></td>
							<td><?php echo "Rs." . $book['book_price']; ?></td>
							<td><?php echo $row['quantity']; ?></td>
							<td><?php echo "Rs." . $row['quantity'] * $book['book_price']; ?></td>
						</tr>
						<?php } ?>
						<tr>
							<th>&nbsp;</th>
							<th>&nbsp;</th>
							<th><?php echo $total_items; ?></th>
							<th><?php echo "Rs." . $total_price; ?></th>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	
<?php
	} else {
?>
<div class="alert alert-warning rounded-0">The order is empty! Suggested to delete this corrupted order.</div>
<?php

	    }
	if(isset($conn)){ mysqli_close($conn); }
	require_once "./template/footer.php";
?>