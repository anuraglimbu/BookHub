<?php
	session_start();
	require_once "./functions/admin.php";
	$title = "List Category";
	require_once "./template/header.php";
	require_once "./functions/database_functions.php";
	$conn = db_connect();
	$result = getAllCategory($conn);
?>
	<h4 class="fw-bolder text-center">Category List</h4>
	<center>
	<hr class="underline" style="width:5em;height:3px;opacity:1">
	</center>
	<?php if(isset($_SESSION['category_success'])): ?>
		<div class="alert alert-success rounded-0">
			<?= $_SESSION['category_success'] ?>
		</div>
	<?php 
		unset($_SESSION['category_success']);
		endif;
	?>
	<div class="card rounded-0">
		<div class="card-body">
			<div class="container-fluid">
				<table class="table table-striped table-bordered" >
				<colgroup>
					<col width="20%">
                    <col width="20%">
					<col width="40%">
					<col width="20%">
				</colgroup>
					<thead>
					<tr>
						<th>Category ID</th>
                        <th>Books</th>
						<th>Category</th>
						<th>Action</th>
					</tr>
					</thead>
					<tbody>
					<?php while($row = mysqli_fetch_assoc($result)){ 
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
					<tr>
						<td class="px-2 py-1 align-middle"><a href="bookPerCat.php?catid=<?php echo $row['categoryid']; ?>" target="_blank"><?php echo $row['categoryid']; ?></a></td>
						<td class="px-2 py-1 align-middle"><?php echo $count; ?></td>
                        <td class="px-2 py-1 align-middle"><?php echo $row['category_name']; ?></td>
						<td class="px-2 py-1 align-middle text-center">
							<div class="btn-group btn-group-sm">
								<a href="admin_category_edit.php?catid=<?php echo $row['categoryid']; ?>" class="btn btn-sm rounded-0 btn-primary" title="Edit"><i class="fa fa-edit"></i></a>
								<a href="admin_category_delete.php?catid=<?php echo $row['categoryid']; ?>" class="btn btn-sm rounded-0 btn-danger" title="Delete" onclick="if(confirm('Are you sure to delete this categoy?') === false) event.preventDefault()"><i class="fa fa-trash"></i></a>
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