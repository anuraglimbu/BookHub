<?php
	session_start();
	require_once "./functions/admin.php";
	$title = "Orders";
	require_once "./template/header.php";
	require_once "./functions/database_functions.php";
	$conn = db_connect();
	$result = getAllOrders($conn);
?>
	<h4 class="fw-bolder text-center">Orders List</h4>
	<center>
	<hr class="underline" style="width:5em;height:3px;opacity:1">
	</center>
	<?php if(isset($_SESSION['order_success'])): ?>
		<div class="alert alert-success rounded-0">
			<?= $_SESSION['order_success'] ?>
		</div>
	<?php 
		unset($_SESSION['order_success']);
		endif;
	?>
	<div class="card rounded-0">
		<div class="card-body">
			<div class="container-fluid">
				<table class="table table-striped table-bordered" >
				<colgroup>
					<col width="5%">
					<col width="5%">
					<col width="5%">
					<col width="10%">
					<col width="20%">
                    <col width="20%">
					<col width="10%">
					<col width="5%">
					<col width="10%">
                    <col width="10%">
				</colgroup>
					<thead>
					<tr>
						<th>Order ID</th>
						<th>User ID</th>
						<th>Amount</th>
						<th>Date</th>
						<th>Name</th>
						<th>Address</th>
						<th>City</th>
                        <th>Zip Code</th>
                        <th>Status</th>
						<th>Action</th>
					</tr>
					</thead>
					<tbody>
					<?php while($row = mysqli_fetch_assoc($result)){ ?>
					<tr>
						<td class="px-2 py-1 align-middle"><a href="order.php?orderid=<?php echo $row['orderid']; ?>" target="_blank"><?php echo $row['orderid']; ?></a></td>
						<td class="px-2 py-1 align-middle"><?php echo $row['userid']; ?></td>
						<td class="px-2 py-1 align-middle"><?php echo $row['amount']; ?></td>
						<td class="px-2 py-1 align-middle"><?php echo $row['date']; ?></td>
                        <td class="px-2 py-1 align-middle"><?php echo $row['ship_name']; ?></td>
						<td class="px-2 py-1 align-middle"><p class="text-truncate" style="width:15em"><?php echo $row['ship_address']; ?></p></td>
						<td class="px-2 py-1 align-middle"><?php echo $row['ship_city']; ?></td>
                        <td class="px-2 py-1 align-middle"><?php echo $row['ship_zip_code']; ?></td>
                        <td class="px-2 py-1 align-middle"><?php if($row['completed'] == 0) echo "Pending"; else echo  "Complete";?></td>
						<td class="px-2 py-1 align-middle text-center">
							<div class="btn-group btn-group-sm">
                                <a href="order.php?orderid=<?php echo $row['orderid']; ?>" target="_blank" class="btn btn-sm rounded-0 btn-primary" title="View In Detail"><i class="fa fa-eye"></i></a>
								
                                <?php if($row['completed'] == 0): ?>
                                    <a href="admin_order_complete.php?orderid=<?php echo $row['orderid']; ?>" class="btn btn-sm rounded-0 btn-success" title="Order Completed" onclick="if(confirm('Are you sure to change status of this order to Completed?') === false) event.preventDefault()"><i class="fa fa-edit"></i></a>
								<?php else: ?>
                                    <a href="admin_order_pending.php?orderid=<?php echo $row['orderid']; ?>" class="btn btn-sm rounded-0 btn-warning" title="Order Pending" onclick="if(confirm('Are you sure to change status of this order to Pending?') === false) event.preventDefault()"><i class="fa fa-edit"></i></a>
                                <?php endif; ?>
                                    <a href="admin_order_delete.php?orderid=<?php echo $row['orderid']; ?>" class="btn btn-sm rounded-0 btn-danger" title="Delete" onclick="if(confirm('Are you sure to delete this order?') === false) event.preventDefault()"><i class="fa fa-trash"></i></a>
							</div>
						</td>
					</tr>
					<?php } ?>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	

<?php
	if(isset($conn)) {mysqli_close($conn);}
	require_once "./template/footer.php";
?>