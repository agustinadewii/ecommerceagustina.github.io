<?php
	session_start();
	include 'db.php' ;
	if ($_SESSION['status_login'] != true){
		echo '<script>window.location="login.php"</script>';
	}

	$produk = mysqli_query($conn, "SELECT * FROM tb_product WHERE product_id = '".$_GET['id']."'  ");
	$p = mysqli_fetch_object($produk);
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
			<h2>EDIT PRODUK</h2>
			<div class="box">
				<form action="" method="POST" enctype="multipart/form-data">
					<select class="input-control" name="kategori" required>
						<option value="">---PILIH---</option>
						<?php
							$kategori = mysqli_query($conn, "SELECT * FROM tb_category ORDER BY category_id DESC") ;
							while($r = mysqli_fetch_array ($kategori)){
						?>
						<option value="<?php echo $r['category_id'] ?>" <?php echo ($r['category_id'] == $p->category_id)? 'selected':'' ; ?>><?php echo $r['category_name']?></option>
						<?php } ?>
					</select>

					<input type="text" name="nama" class="input-control" placeholder="Nama Produk" value="<?php echo $p->product_name?>" required>
					<input type="text" name="harga" class="input-control" placeholder="Harga" value="<?php echo $p->product_price?>" required>
					
					<img src="produk/<?php echo $p->product_image ?>" width="150px">
					<input type="hidden" name="foto" value="<?php echo $p->product_image ?>">
					<input type="file" name="gambar" class="input-control">
					<textarea class="input-control" name="deskripsi" placeholder="Deskripsi"><?php echo $p->product_description?></textarea><br>
					<select class="input-control" name="status">
						<option value="">--Pilih--</option>
						<option value="1" <?php echo ($p->product_status == 1)? 'selected':'' ?> >Aktif</option>
						<option value="0"<?php echo ($p->product_status == 0)? 'selected':'' ?> >Tidak Aktif</option>
					</select>
					<input type="submit" name="submit" value="Tambah Produk" class="btn">
				</form>
			
			<?php
				if (isset($_POST['submit'])) {

					//data inputan form

					$kategori	= $_POST['kategori'];
					$nama 		= $_POST['nama'];
					$harga 		= $_POST['harga'];
					$deskripsi 	= $_POST['deskripsi'];
					$status	 	= $_POST['status'];
					$foto	 	= $_POST['foto'];

					//data gambar yg baru

					$filename = $_FILES['gambar']['name'];
					$tmp_name = $_FILES['gambar'] ['tmp_name'] ;
					
					$type1 = explode('.', $filename);
					$type2 = $type1[1];
					
					//menampung data format file yang diijinkan 
					$tipe_diizinkan = array('jpg', 'jpeg', 'png', 'webp') ;

					//validasi admin ganti gambar

					if ($filename != '') {
					//validasi format file
					if(!in_array($type2, $tipe_diizinkan)){
						echo '<script>alert("Format File Tidak Diizinkan")</script' ;
					}else{
						unlink('./produk/'.$foto);
						move_uploaded_file($tmp_name, './produk/'.$filename) ;
						$namagambar = $filename ;

					}

					} else{

						//admin tidak ganti gambar
						$namagambar = $foto ;

					}

					//query update

					$update = mysqli_query($conn, "UPDATE tb_product SET
											category_id = '".$kategori."',
											product_name = '".$nama."',
											product_price = '".$harga."',
											product_description = '".$deskripsi."',
											product_image = '".$namagambar."',
											product_status = '".$status."'
											WHERE product_id = '".$p->product_id."' ");

					if ($update) {
							echo '<script>alert("Ubah Data Berhasil")</script>' ;
							echo '<script>window.location="dataproduk.php"</script>' ;
						}else{
							echo 'gagal' .mysqli_error($conn);
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