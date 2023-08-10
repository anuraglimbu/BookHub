<?php
	session_start();
	require_once "./functions/user.php";
	$title = "Profile";
	require_once "./template/header.php";
	require_once "./functions/database_functions.php";
	$conn = db_connect();

   // if(isset($_SESSION['user_success'])) echo "SUCCESS";

	if(isset($_SESSION['userid'])){
		$userid = $_SESSION['userid'];
	} else {
		echo "Empty userid!";
        $_SESSION['err_login'] = "ERROR! Try Logging In Again";
        header("Location: user_login.php");
		exit;
	}

	// get user data
	$query = "SELECT * FROM users WHERE userid = $userid";
	$result = mysqli_query($conn, $query);
	if(!$result){
		echo $err = "Can't retrieve data ";
        $_SESSION['err_logn'] = "ERROR! Try Logging In Again";
        header("Location: user_login.php");
		exit;
	}else{
		$row = mysqli_fetch_assoc($result);
	}
	if(isset($_POST['edit'])){
		$userid = trim($_SESSION['userid']);
		$data = "";
		foreach($_POST as $k => $v){
			if(!in_array($k, ['edit', 'userid'])){
				if(!empty($data)) $data .=", ";
				$data .= "`{$k}` = '".(mysqli_real_escape_string($conn, $v))."'";
			}
		}


		$query = "UPDATE users set $data where userid = $userid";
		$result = mysqli_query($conn, $query);
		if($result){
			$_SESSION['user_success'] = "User Details has been updated successfully";
			header("Location: user_profile_edit.php");
		} else {
			$err =  "Can't update data " . mysqli_error($conn);
		}
	}
?>
	<h4 class="fw-bolder text-center">User Details</h4>
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
                        <?php if(isset($_SESSION['user_success'])): ?>
                            <div class="alert alert-success rounded-0">
                                <?= $_SESSION['user_success'] ?>
                            </div>
                        <?php 
                            unset($_SESSION['user_success']);
                            endif;
                        ?>
						<form method="post" action="user_profile_edit.php" >
								<div class="mb-3">
									<label class="control-label">Username</label>
									<input class="form-control rounded-0" type="text" name="username" value="<?php echo $row['username'];?>" readOnly="true">
								</div>
								<div class="mb-3">
									<label class="control-label">Name</label>
									<input class="form-control rounded-0" type="text" name="name" value="<?php echo $row['name'];?>" required>
								</div>
								<div class="mb-3">
									<label class="control-label">Email</label>
									<input class="form-control rounded-0" type="email" name="email" value="<?php echo $row['email'];?>" required>
								</div>
								<div class="mb-3">
									<label class="control-label">Contact</label>
									<input class="form-control rounded-0" type="text" name="contact" value="<?php echo $row['contact'];?>" required>
								</div>
								<div class="mb-3">
									<label class="control-label">Address</label>
									<input class="form-control rounded-0" type="text" name="address" value="<?php echo $row['address'];?>" required>
								</div>
                                <div class="mb-3">
									<label class="control-label">City</label>
									<input class="form-control rounded-0" type="text" name="city" value="<?php echo $row['city'];?>" required>
								</div>
                                <div class="mb-3">
									<label class="control-label">Zip Code</label>
									<input class="form-control rounded-0" type="text" name="zip_code" value="<?php echo $row['zip_code'];?>" required>
								</div>
								<div class="mb-3">
									<label class="control-label">Gender</label>
									<select class="form-select rounded-0"  name="gender" required>
										<option selected value="<?= $row['gender'] ?>"><?= $row['gender'] ?></option>					
                                        <?php if($row['gender'] == "Male") : ?>
                                            <option value="Female">Female</option>
                                        <?php else: ?>
                                            <option value="Male">Male</option>
                                        <?php endif; ?>
									</select>
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