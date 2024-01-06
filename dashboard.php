<?php
	session_start();
	include 'db.php' ;
	if ($_SESSION['status_login'] != true){
		echo '<script>window.location="login.php"</script>';
	}

	$query = mysqli_query($conn, "SELECT * FROM tb_admin WHERE admin_id = '".$_SESSION['id']."'");
	$d = mysqli_fetch_object($query);
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
	<!--content -->
<div class="section">
    <div class="container">
        <h2>Dashboard</h2>
        <div class="box">
            <h4>Selamat Datang, Anda Berhasil Login Sebagai Admin.</h4>
        </div>
        <h3>ADMIN PROFIL</h3>
        <div class="box">
            <form method="POST" action="">
                <input type="text" name="nama" placeholder="Nama Lengkap" class="input-control" value="<?php echo $d->admin_name?>" required>
                <input type="text" name="user" placeholder="Username" class="input-control" value="<?php echo $d->username?>" required>
                <input type="text" name="hp" placeholder="No Hp" class="input-control" value="<?php echo $d->admin_telp?>" required>
                <input type="email" name="email" placeholder="Email" class="input-control" value="<?php echo $d->admin_email?>" required>
                <input type="text" name="alamat" placeholder="Alamat" class="input-control" value="<?php echo $d->admin_address?>" required>
                <input type="submit" name="submit" value="Ubah profil" class="btn">
            </form>

            <?php 
                if(isset($_POST['submit'])){
                    $nama = $_POST['nama'];
                    $user = $_POST['user'];
                    $hp = $_POST['hp'];
                    $email = $_POST['email'];
                    $alamat = $_POST['alamat'];

                    $update = mysqli_query($conn, "UPDATE tb_admin SET
                        admin_name = '".$nama."',
                        username  = '".$user."',
                        admin_telp = '".$hp."',
                        admin_email = '".$email."',
                        admin_address = '".$alamat."'
                        WHERE admin_id = '".$d->admin_id."' 
                    ");

                    if ($update) {
                        echo '<script>alert("Ubah Data Berhasil")</script>';
                        echo '<script>window.location="dashboard.php"</script>';
                    } else {
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