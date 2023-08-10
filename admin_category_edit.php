<?php
	session_start();
	require_once "./functions/admin.php";
	$title = "Edit Category";
	require_once "./template/header.php";
	require_once "./functions/database_functions.php";
	$conn = db_connect();

	if(isset($_GET['catid'])){
		$categoryid = $_GET['catid'];
	} else {
		echo "Empty query!";
		exit;
	}

	if(!isset($categoryid)){
		echo "Empty categoryid! check again!";
		exit;
	}

	// get book data
	$query = "SELECT * FROM category WHERE categoryid = '{$categoryid}'";
	$result = mysqli_query($conn, $query);
	if(!$result){
		echo $err = "Can't retrieve data ";
		exit;
	}else{
		$row = mysqli_fetch_assoc($result);
	}
	if(isset($_POST['edit'])){
		$isbn = trim($_POST['catid']);
		$data = "";
		foreach($_POST as $k => $v){
			if(!in_array($k, ['edit', 'catid'])){
				if(!empty($data)) $data .=", ";
				$data .= "`{$k}` = '".(mysqli_real_escape_string($conn, $v))."'";
			}
		}


		$query = "UPDATE category set $data where categoryid = $categoryid";
		$result = mysqli_query($conn, $query);
		if($result){
			$_SESSION['category_success'] = "Category Details has been updated successfully";
			header("Location: admin_category.php");
		} else {
			$err =  "Can't update data " . mysqli_error($conn);
		}
	}
?>
	<h4 class="fw-bolder text-center">Edit Category Details</h4>
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
						<form method="post" action="admin_category_edit.php?catid=<?php echo $row['categoryid'];?>">
								<div class="mb-3">
									<label class="control-label">Category ID</label>
									<input class="form-control rounded-0" type="text" name="catid" value="<?php echo $row['categoryid'];?>" readOnly="true">
								</div>
								<div class="mb-3">
									<label class="control-label">Category Name</label>
									<input class="form-control rounded-0" type="text" name="category_name" value="<?php echo $row['category_name'];?>" required>
								</div>
								<div class="text-center">
									<button type="submit" name="edit"  class="btn btn-primary btn-sm rounded-0">Update</button>
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
	require "./template/footer.php"
?>