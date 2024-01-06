<?php
	session_start();
	include 'db.php' ;
	if ($_SESSION['status_login'] != true){
		echo '<script>window.location="login.php"</script>';
	}
?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Beliya Skincare</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link href="https://fonts.googleapis.com/css2?family=Kanit:ital@1&display=swap" rel="stylesheet">
</head>
<body>
	<!--header--> 
	<header>
		<div class="container">
		<h1><a href="dashboard.php">BELIYA SKINCARE</a></h1>
		<ul>
			<li><a href="dashboard.php">Dashboard</a></li>
			<li><a href="datakategori.php">Data Kategori</a></li>
			<li><a href="dataproduk.php">Data Produk</a></li>
			<li><a href="keluar.php"><span>Logout</span></a></li>
		</ul>
		</div>
	</header>

<!--content -->
	<div class="section">
		<div class="container">
			<h2>KATEGORI PRODUK</h2>
			<div class="box">
				<p><a href="tambah-kategori.php" class="btn">Tambah Data</a></p>
				<table border="1" cellspacing="0" class="table">
					<thead>
						<tr>
							<th width="50px">No</th>
							<th>Kategori</th>
							<th width="150px">Keterangan</th>
						</tr>
					</thead>
					<tbody>
						<?php
							$no = 1;
							$kategori = mysqli_query($conn, "SELECT * FROM tb_category ORDER BY category_id DESC");
						while($row = mysqli_fetch_array($kategori)){ 	
						
						?>
						<tr>
							<td><?php echo $no++ ?></td>
							<td><?php echo $row['category_name'] ?></td>
							<td>
								<a href="edit-kategori.php?id=<?php echo $row['category_id'] ?>">Edit</a> || <a href="proses-hapus.php?idk=<?php echo $row['category_id']?>" onclick="return confirm('Yakin ingin hapus?')">Hapus</a>
							</td>
						</tr>
						<?php } ?>
					</tbody>
				</table>
			</div>
				
			</div>
	</div>
	






<!--footer-->
	<footer>
	<div class="container">
		<small>Copyright &copy; 2023 | Beliya Skincare | Agustina Dewi</small>
	</div>
	</footer>
</body>
</html>