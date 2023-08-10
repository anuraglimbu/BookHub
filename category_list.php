<?php
	session_start();
	require_once "./functions/database_functions.php";
	$conn = db_connect();

	$query = "SELECT * FROM category ORDER BY categoryid";
	$result = mysqli_query($conn, $query);
	if(!$result){
		echo "Can't retrieve data " . mysqli_error($conn);
		exit;
	}
	if(mysqli_num_rows($result) == 0){
		echo "Empty category ! Something wrong! check again";
		exit;
	}

	$title = "List Of Categories";
	require "./template/header.php";
?>
	<div class="h5 fw-bolder text-center">List of Categories</div>
	<hr class="underline" style="height:2px;opacity:1">
	<div class="list-group">
		<a class="list-group-item list-group-item-action" href="books.php">
			List of All Books
		</a>
	<?php 
		while($row = mysqli_fetch_assoc($result)){
			$count = 0; 
			$query = "SELECT categoryid FROM books";
			$result2 = mysqli_query($conn, $query);
			if(!$result2){
				echo "Can't retrieve data " . mysqli_error($conn);
				exit;
			}
			while ($pubInBook = mysqli_fetch_assoc($result2)){
				if($pubInBook['categoryid'] == $row['categoryid']){
					$count++;
				}
			}
	?>
		<a class="list-group-item list-group-item-action" href="bookPerCat.php?catid=<?php echo $row['categoryid']; ?>">
			<span class="badge badge-primary bg-primary rounded-pill"><?php echo $count; ?></span>
			<?php echo $row['category_name']; ?>
		</a>
	<?php } ?>
	</div>
<?php
	mysqli_close($conn);
	require "./template/footer.php";
?>