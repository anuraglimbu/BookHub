<?php
session_start();

if(isset($_SESSION['user']) && $_SESSION['user'] == true){
	header('location:index.php');
}
	$title = "Sign Up";
	require_once "./template/header.php";
?>
<div class="row justify-content-center my-5">
	<div class="col-lg-4 col-md-6 col-sm-10 col-xs-12">
		<div class="card rounded-0 shadow">
			<div class="card-header">
				<div class="card-title text-center h4 fw-bolder">Sign Up</div>
			</div>
			<div class="card-body">
				<div class="container-fluid">
					<?php if(isset($_SESSION['err_login'])): ?>
						<div class="alert alert-danger rounded-0">
							<?= $_SESSION['err_login'] ?>
						</div>
					<?php 
						unset($_SESSION['err_login']);
						endif;
					?>
					<form class="form-horizontal" method="post" action="user_signup_verify.php">
                        <div class="mb-3">
							<label for="username" class="control-label ">Username</label>
							<input type="text" name="username" class="form-control rounded-0" required>
						</div>
                        <div class="mb-3">
							<label for="email" class="control-label ">Email</label>
							<input type="email" name="email" class="form-control rounded-0" required>
						</div>
                        <div class="mb-3">
							<label for="name" class="control-label ">Full Name</label>
							<input type="text" name="name" class="form-control rounded-0" required>
						</div>
                        <div class="mb-3">
							<label for="gender" class="control-label ">Gender</label>
                            <select name="gender" class="form-control rounded-0" required>
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                            </select>
						</div>
                        <div class="mb-3">
							<label for="contact" class="control-label ">Contact</label>
							<input type="text" name="contact" class="form-control rounded-0" required>
						</div>
                        <div class="mb-3">
							<label for="address" class="control-label ">Address</label>
							<input type="text" name="address" class="form-control rounded-0" required>
						</div>
                        <div class="mb-3">
							<label for="city" class="control-label ">City</label>
							<input type="text" name="city" class="form-control rounded-0" required>
						</div>
                        <div class="mb-3">
							<label for="zip" class="control-label ">Zip Code</label>
							<input type="text" name="zip" class="form-control rounded-0" required>
						</div>
						<div class="mb-3">
							<label for="pass" class="control-label ">Password</label>
							<input type="password" name="pass" class="form-control rounded-0" required>
						</div>
                        <div class="mb-3">
							<label for="cpass" class="control-label ">Confirm Password</label>
							<input type="password" name="cpass" class="form-control rounded-0" required>
						</div>
						<div class="mb-3 d-grid">
							<input type="submit" name="submit" value="Sign Up" class="btn btn-primary rounded-0">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
	

<?php
	require_once "./template/footer.php";
?>