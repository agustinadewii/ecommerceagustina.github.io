-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 06 Jan 2024 pada 03.15
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_beliyaskincare`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_admin`
--

CREATE TABLE `tb_admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `admin_telp` varchar(20) NOT NULL,
  `admin_email` varchar(50) NOT NULL,
  `admin_address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_admin`
--

INSERT INTO `tb_admin` (`admin_id`, `admin_name`, `username`, `password`, `admin_telp`, `admin_email`, `admin_address`) VALUES
(2, 'Nina', 'nina', 'f2ceea1536ac1b8fed1a167a9c8bf04d', '085112345678', 'nina84@gmail.com', 'Jalan Setia Budi no. 118'),
(3, 'Ayu Dewi', 'nina', '29c65f781a1068a41f735e1b092546de', '087124567876', 'dewiayu2@gmail.com', 'jalan pulau menjangan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_category`
--

CREATE TABLE `tb_category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_category`
--

INSERT INTO `tb_category` (`category_id`, `category_name`) VALUES
(17, 'Facewash'),
(19, 'Sunscreen'),
(20, 'Eye Cream'),
(23, 'Serum'),
(24, 'Toner'),
(25, 'Masker'),
(26, 'Moisturizer');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_product`
--

CREATE TABLE `tb_product` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` int(11) NOT NULL,
  `product_description` text NOT NULL,
  `product_image` varchar(255) NOT NULL,
  `product_status` tinyint(1) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_product`
--

INSERT INTO `tb_product` (`product_id`, `category_id`, `product_name`, `product_price`, `product_description`, `product_image`, `product_status`, `date_created`) VALUES
(9, 17, 'SKINTIFIC Panthenol Gel Cleanser Facial Wash 120ml', 90000, 'Mengkombinasikan Panthenol dan Amino Acid sehingga membersihkan hingga ke dalam pori-pori dan membantu menghilangkan kotoran, kelebihan minyak dan membantu mencegah pori tersumbat. Membuat kulit terus terhidrasi dan menjadikan kulit lebih lembut dan halus.\r\n\r\nManfaat:\r\n●Kulit Bersih & Terasa Segar Terhidrasi\r\n●Membantu menenangkan kulit\r\n●Menyegarkan & melembabkan kulit', 'cleanserskin.png', 1, '2023-12-16 11:00:39'),
(10, 17, 'SKINTIFIC Facial Wash Low pH Cleanser', 89000, 'Cleanser yang dapat membersihkan kulit wajah dari debu dan kotoran dengan gentle tanpa membuat kulit terasa tertarik. Mengandung 5 tipe ceramide yang berbeda yang dapat menutrisi dan merawat skin barrier. Kandungan Hyaluronic acid membantu menjaga kulit tetap lembab setelah dibilas.', 'fw_skin.png', 1, '2023-12-16 11:02:10'),
(11, 20, 'SKINTIFIC 360 Massager Lifting Eye Cream', 165000, 'Eye cream supercharged yang mengandung 3D Peptide Complex dan Niacinamide untuk menyamarkan tampilan kerutan atau garis halus, serta mencerahkan area bawah mata yang gelap. Dilengkapi dengan teknologi 360 ° Crystal Rolling Massager, sebuah teknologi Lift-Tech ™ dari Jerman dengan 184 permukaan kristal dan dapat berputar searah 360 °, sehingga membantu daya serap kandungan aktif pada kulit dan menyamarkan garis-garis halus yang terlihat & kantung mata di waktu yang bersamaan. Lift-Tech™ 360 ° Crystal Roll Massager yang terdapat pada eye cream ini membantu menyamarkan garis-garis halus, mengurangi area bawah mata yang gelap, dan mengurangi tampilan mata sembab.', 'eye_skin.jpeg', 1, '2023-12-16 11:03:23'),
(12, 23, 'SKINTIFIC SymWhite 377 Dark Spot Serum', 135000, 'Symwhite 377 Dark Spot Serum  \r\n\r\nSerum yang mengandung SymWhite377 dengan tekstur ringan dan berat molekul rendah, bekerja dengan efektif ke lapisan kulit untuk mencerahkan noda hitam pada kulit. Kandungan SymWhite377 membantu menyamarkan noda hitam . Dilengkapi dengan Niacinamide dan Tranexamic Acid yang membantu mencerahkan kulit, , serta mengunci kelembaban kulit. Kandungan yang stabil, mencerahkan kulit secara merata untuk kulit tampak lebih muda.', 'darkspot skin.jpg', 1, '2023-12-16 11:07:18'),
(13, 23, 'SKINTIFIC Serum Niacinamide Brightening', 120000, '10% Niacinamide Brightening Serum\r\n\r\nSerum pencerah dengan kandungan Niacinamide dan Alpha arbutin yang bekerja secara efektif mencerahkan kulit wajah. Dengan kandungan ceramide yang dapat menjaga dan menutrisi skin barrier sehingga kulit tidak hanya terlihat cerah dan merata namun juga bersih dan sehat.  \r\n\r\n', 'serum_skin.jpg', 1, '2023-12-16 11:11:17'),
(14, 23, 'SKINTIFIC 5X Ceramide Barrier Repair Serum', 120000, '5X Ceramide Barrier Serum \r\n\r\nSerum yang diformulasikan dengan kombinasi 5 Jenis Ceramide yang berbeda untuk menjaga dan merawat skin barrier. Memberikan kelembaban yang diperlukan kulit sehingga tetap lembab dan sehat. Ditambah kandungan BFL probiotik yang dapat membantu merawat kemerahan dan jerawat. Untuk kondisi skin barrier, kandungan Centella Asiatica pada serum ini juga dapat menenangkan kulit. ', 'serumbiruskin.jpeg', 1, '2023-12-16 11:12:05'),
(15, 24, 'SKINTIFIC Barrier Essence Toner 100ml', 112000, 'Toner yang dapat digunakan sehari-hari untuk menenangkan kulit saat skin barrier sedang terganggu, membantu proses perbaikan skin barrier dan menjaga kulit agar tetap sehat. Memiliki kandungan 5 jenis Ceramide yang berbeda yang baik untuk menjaga barier kulit, ditambah kandungan probiotik kompleks yang dapat meningkatkan sel mikrobioma kulit untuk mengurangi permasalahan kulit, dan juga kandungan Calendula yang memiliki fungsi anti inflamasi, dan antibakteri sehingga bisa melindungi collagen alami kulit agar kulit terlihat lebih kenyal dan sehat', 'essenbiru_skin.png', 1, '2023-12-16 11:15:00'),
(16, 24, 'SKINTIFIC Niacinamide Brightening Essence Toner 100ml', 112000, 'Brightening toner with Triple Brightening Agents: the perfect combination of Niacinamide, Alpha Arbutin, and Tranexamic acid for maximum effect. Easy-to-absorb, watery texture but gives maximum hydration on the skin with a fresh feeling. Works as an effective brightening booster for maximum brightening effect when used together with Niacinamide Serum and MSH Niacinamide Moisturizer.', 'essensepink_skin.png', 1, '2023-12-16 11:17:46'),
(17, 24, 'SKINTIFIC Toner Acne Pure Centella', 100000, 'Toner dengan kandungan Centella Asiatica, untuk merawat kulit berjerawat. Memiliki tekstur ringan dan menyegarkan serta mudah meresap tanpa menimbulkan rasa gerah. Membantu mengontrol minyak berlebih. Diperkaya dengan Ectoin dan Panthenol, menenangkan kulit. Diformulasikan untuk kulit berjerawat dan sensitif.', 'tonerijoskin.png', 1, '2023-12-16 11:19:17'),
(18, 26, 'SKINTIFIC 5X Ceramide Barrier Moisturizer 30g', 100000, 'Moisturizer yang menggabungkan 3 kandungan aktif Ceramide, Hyaluronic Acid, dan Centella Asiatica, untuk mengatasi permasalahan skin barrier yang rusak seperti jerawat, kemerahan, kulit bertekstur, dan juga kulit kering secara cepat namun tetap aman untuk skin barrier. Diperkaya dengan teknolog 5X Ceramide, yang merupakan gabungan 5 jenis Ceramide untuk melembabkan secara mendalam dan memperkuat lapisan kulit. 5X Ceramide ini membantu untuk memperbaiki dan melindungi skin barrier dengan menjaga kelembaban dan melindungi kulit dari faktor eksternal.', 'moisbiru_skin.webp', 1, '2023-12-16 11:20:34'),
(19, 26, 'SKINTIFIC Niacinamide Brightening Moisturizer 30g', 100000, 'MSH Niacinamide : Niacinamide dengan kualitas premium dengan kombinasi MSH, mencerahkan kulit dengan cepat tanpa menyebabkan iritasi.\r\nAlpha Arbutin : Antioksidan alami dan pencerah kulit. sangat efektif dalam pencegahan pembentukan melanin, memperbaiki penampilan bintik-bintik penuaan, bintik-bintik, melasma, dan pigmentasi pasca-inflamasi.\r\nTranexamic Acid : Terbukti secara ilmiah memiliki efek memutihkan, terutama untuk hiperpigmentasi akibat sinar ultraviolet.', 'moispink_skin.png', 1, '2023-12-16 11:21:33'),
(20, 25, 'SKINTIFIC Clay Mask Stick Alaska Volcano 40g', 75000, 'Clay mask berbentuk stick dari Alaska Volcano Clay, mengandung partikel halus yang berfungsi membersihkan pori-pori secara mendalam, membantu kulit tampak lebih bersih dan cerah.', 'masabu_skin.jpeg', 1, '2023-12-16 11:22:49'),
(21, 25, 'SKINTIFIC Clay Mask Stick Mugwort 40g', 75000, 'Diformulasikan dengan Mugwort, ingredients yang populer di Korea untuk mengobati jerawat. Dilengkapi dengan Niacinamide, Salicylic Acid, dan juga Centella yang dapat mengontrol produksi minyak, membersihkan pori-pori secara mendalam, membersihkan komedo, dan menenangkan kulit yang sedang meradang.', 'masmug_skin.png', 1, '2023-12-16 11:24:07'),
(22, 19, 'SKINTIFIC Sunscreen Spray SPF50 PA++++', 100000, 'Sunscreen mist dengan 0.01nm spray yang halus, mudah dibawa dan tidak merusak makeup pada saat diaplikasikan. Tekstur yang invisible, tidak terasa berat dan menyegarkan kulit. Perlindungan maksimal dengan SPF 50+ PA++++, melindungi dari UVB penyebab sunburn dan 16 x menangkal UVA untuk melindungi kulit dari penuaan dini yang disebabkan oleh efek buruk dari sinar matahari.', 'sssemprot skinn.jpeg', 1, '2023-12-16 11:25:10');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indeks untuk tabel `tb_category`
--
ALTER TABLE `tb_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indeks untuk tabel `tb_product`
--
ALTER TABLE `tb_product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tb_category`
--
ALTER TABLE `tb_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT untuk tabel `tb_product`
--
ALTER TABLE `tb_product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
