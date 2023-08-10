<?php
	session_start();
	require_once "./functions/database_functions.php";
	// get catid
	if(isset($_GET['catid'])){
		$catid = $_GET['catid'];
	} else {
		echo "Wrong query! Check again!";
		exit;
	}

	// connect database
	$conn = db_connect();
	$catName = getCatName($conn, $catid);

	$query = "SELECT book_isbn, book_title, book_image, book_descr FROM books WHERE categoryid = '$catid'";
	$result = mysqli_query($conn, $query);
	if(!$result){
		echo "Can't retrieve data " . mysqli_error($conn);
		exit;
	}
	if(mysqli_num_rows($result) == 0){
		echo "Empty books ! Please wait until new books coming!";
		exit;
	}

	$title = "Books Per Category";
	require "./template/header.php";
?>
<style>
	.book-item .img-holder {
		height: 20em;
	}
	.book-item:nth-child(even){
		direction: rtl !important;
	}
</style>
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="category_list.php" class="text-decoration-none text-muted fw-light">Categories</a></li>
			<li class="breadcrumb-item active" aria-current="page"><?php echo $catName; ?></li>
		</ol>
	</nav>
	<div id="pubBooks">
	<?php while($row = mysqli_fetch_assoc($result)){
?>
	<div class="row book-item mb-2">
		<div class="col-md-3">
			<div class="img-holder overflow-hidden">
				<img class="img-top" src="./bootstrap/img/<?php echo $row['book_image'];?>">
			</div>
		</div>
		<div class="col-md-9">
			<h4><?php echo $row['book_title'];?></h4>
			<hr>
			<p class="truncate-5"><?= $row['book_descr'] ?></p>
			<a href="book.php?bookisbn=<?php echo $row['book_isbn'];?>" class="btn btn-primary">Get Details</a>
		</div>
	</div>
<?php
	}
?>
</div>
<?php
	if(isset($conn)) { mysqli_close($conn);}
	require "./template/footer.php";
?>