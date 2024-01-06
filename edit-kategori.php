<?php
	session_start();
	include 'db.php' ;
	if ($_SESSION['status_login'] != true) {
		echo '<script>window.location="login.php"</script>' ;
	}
	
	$kategori = mysqli_query($conn, "SELECT * FROM tb_category WHERE category_id = '".$_GET['id']."' ");
	$k = mysqli_fetch_object($kategori);
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
			<li><a href="profil.php">Profil</a></li>
			<li><a href="datakategori.php">Data Kategori</a></li>
			<li><a href="dataproduk.php">Data Produk</a></li>
			<li><a href="keluar.php"><span>Logout</span></a></li>
		</ul>
		</div>
	</header>

<!--content -->
	<div class="section">
		<div class="container">
			<h2>EDIT KATEGORI PRODUK</h2>
			<div class="box">
				<form action="" method="POST">
					<input type="text" name="nama" placeholder="Nama Kategori" class="input-control" value="<?php echo $k->category_name ?>" required>

					<input type="submit" name="submit" value="Ubah" class="btn">
				</form>
			
			<?php
				if (isset($_POST['submit'])) {
					$nama = ucwords($_POST['nama']);

					$update = mysqli_query($conn, "UPDATE tb_category SET 
											category_name = '".$nama."'
											WHERE category_id = '".$k->category_id."' ");
					if($update){
						echo '<script>alert("Kategori Berhasil Diedit")</script>';
						echo '<script>window.location="datakategori.php"</script>' ;

					} else {
						echo 'Kategori Gagal Diedit' .mysqli_error($conn);
					}
				}


			?>

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