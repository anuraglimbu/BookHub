<?php
	session_start();
	require_once "./functions/admin.php";
	$title = "Add new category";
	require "./template/header.php";
	require "./functions/database_functions.php";
	$conn = db_connect();

	if(isset($_POST['add'])){
		
		$name = trim($_POST['category_name']);
		$name = mysqli_real_escape_string($conn, $name);

		$query = "INSERT INTO category (`categoryid`, `category_name`) VALUES ('', '" . $name . "')";
		$result = mysqli_query($conn, $query);
		if($result){
			$_SESSION['book_success'] = "New Category has been added successfully";
			header("Location: admin_category.php");
		} else {
			$err =  "Can't add new data " . mysqli_error($conn);

		}
	}
?>
	<h4 class="fw-bolder text-center">Add New Category</h4>
	<center>
	<hr class="underline" style="width:5em;height:3px;opacity:1">
	</center>
	<div class="row justify-content-center">
		<div class="col-lg-6 col-md-8 col-sm-10 col-xs-12">
			<div class="card rounded-0 shadow">
				<div class="card-body">
					<div class="container-fluid">
						<?php if(isset($err)): ?>
							<div class="alert alert-danger rounded-0">
								<?= $_SESSION['err_login'] ?>
							</div>
						<?php 
							endif;
						?>
						<form method="post" action="admin_category_add.php">
								<div class="mb-3">
									<label class="control-label">Category Name</label>
									<input class="form-control rounded-0" type="text" name="category_name">
								</div>
								<div class="text-center">
									<button type="submit" name="add"  class="btn btn-primary btn-sm rounded-0 save">Save</button>
									<button type="reset" class="btn btn-default btn-sm rounded-0 border">Cancel</button>
								</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<?php
	if(isset($conn)) {mysqli_close($conn);}
	require_once "./template/footer.php";
?>