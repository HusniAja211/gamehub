-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 28, 2025 at 04:12 PM
-- Server version: 8.4.3
-- PHP Version: 8.3.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gamehub1`
--

-- --------------------------------------------------------

--
-- Table structure for table `developer`
--

CREATE TABLE `developer` (
  `id_developer` int NOT NULL,
  `nama_developer` varchar(100) NOT NULL,
  `instagram` varchar(100) DEFAULT NULL,
  `linkedin` varchar(100) DEFAULT NULL,
  `github` varchar(100) DEFAULT NULL,
  `deskripsi` varchar(200) NOT NULL,
  `gambar_developer` varchar(100) NOT NULL
);

--
-- Dumping data for table `developer`
--

INSERT INTO `developer` (`id_developer`, `nama_developer`, `instagram`, `linkedin`, `github`, `deskripsi`, `gambar_developer`) VALUES
(3, 'Husni Mubarak', 'https://www.instagram.com/husniaja211/', 'https://www.instagram.com/husniaja211/', 'https://github.com/HusniAja211', 'Project Manager, Game Developer, Back-End Developer. Developer yang suka backend (gak ahli T_T), tapi ogah frontend :D', 'husni_mubarak.jpg'),
(4, 'Cornel Firstio', 'https://www.instagram.com/corneltio_cinematographer?igsh=b3M0OXNkbW9ydXcw', '', '', 'Game Developer, Photographer', 'cornel_firstio.jpg'),
(5, 'Felicia Giona Budiman', 'https://www.instagram.com/felicia_giona_b/', NULL, NULL, 'Game Developer, Web Designer', 'felicia_giona_budiman.jpg'),
(6, 'Muhammad Fachri Al Farizky', 'https://www.instagram.com/fachri0507?igsh=MTg0Nzd2YWtlN2Vsbw==', NULL, NULL, 'Game Developer', 'muhammad_fachri_al_farizky.jpg'),
(7, 'Nabila Hajizah', 'https://www.instagram.com/xbilahjzh_?igsh=MXIxNnR2YmVic3V3bw==', NULL, NULL, 'Game Developer, Web Designer', 'nabila_hajizah.jpg'),
(8, 'Naufal Raihan Ramadhan', 'https://www.instagram.com/nvra_sh?igsh=MWZ5cjJycWQ0OWpwZQ==', NULL, NULL, 'Game Developer', 'naufal_raihan_ramadhan.jpg'),
(9, 'Nur Said Syaban', 'https://www.instagram.com/nursaidsyaban?igsh=MWFvNms1ODA5cXRqdw==', NULL, NULL, 'Game Developer', 'nur_said_syaban.jpg'),
(10, 'Queenrine Messia Shireen Meray', 'https://www.instagram.com/shrn.mry?igsh=MXBuMmd5YW92aDFiYg==', '', '', 'Game Developer, Web Designer', 'queenrine_messia_shireen_meray.jpg'),
(11, 'Rachel Fayza Idris', 'https://www.instagram.com/rechlzzza?igsh=MXZ6YnhrbWV3a2RsaQ==', NULL, NULL, 'Game Developer, Web Designer', 'rachel_fayza_idris.jpg'),
(12, 'Romulus Pandapotan', 'https://www.instagram.com/romulus.pandapotan?igsh=MTg0Nzd2YWtlN2Vsbw==', NULL, NULL, 'Game Developer', 'romulus_pandapotan.jpg'),
(13, 'Artaresya Faragista Ramadhani', 'https://www.instagram.com/chocoloveyou_?igsh=MWF4ZHhweHFoaWU4dw==', '', '', 'Game Developer, Web Designer', 'artaresya_faragista_ramadhani.png');

-- --------------------------------------------------------

--
-- Table structure for table `galery`
--

CREATE TABLE `galery` (
  `id_galery` int NOT NULL,
  `nama_galery` varchar(255) NOT NULL
);

--
-- Dumping data for table `galery`
--

INSERT INTO `galery` (`id_galery`, `nama_galery`) VALUES
(1, 'aset_01.png'),
(2, 'aset_02.png'),
(3, 'aset_03.png'),
(4, 'aset_04.png'),
(5, 'aset_05.png'),
(6, 'aset_06.png'),
(7, 'aset_07.png'),
(8, 'aset_08.png'),
(9, 'aset_09.png'),
(10, 'aset_10.png'),
(11, 'aset_11.png'),
(12, 'aset_12.png'),
(13, 'aset_13.png'),
(14, 'aset_14.png'),
(15, 'aset_15.png'),
(16, 'aset_16.png'),
(17, 'aset_17.png');

-- --------------------------------------------------------

--
-- Table structure for table `game`
--

CREATE TABLE `game` (
  `id_game` int NOT NULL,
  `nama_game` varchar(100) DEFAULT NULL,
  `fid_timDeveloper` int NOT NULL,
  `gambar_game` varchar(100) NOT NULL,
  `tautan` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL
);

--
-- Dumping data for table `game`
--

INSERT INTO `game` (`id_game`, `nama_game`, `fid_timDeveloper`, `gambar_game`, `tautan`, `deskripsi`) VALUES
(1, 'Quizz', 5, 'quizz.png', 'game/quiz/', 'Game seru! Menyediakan soal dari mata pelajaran normatif dan produktif RPL !'),
(2, 'Brick Breaker Master', 8, 'brick_breaker_master.png', 'game/brick_breaker_master', 'Game Menghancurkan block'),
(3, 'Chess Master', 2, 'chess_master.png', 'game/chess_master/chess.html', 'Game Catur'),
(4, 'Car Racing', 6, 'car_racing.png', 'game/game_balap/index.html', 'RACING!!'),
(5, 'Gunting Batu Kertas RPG', 1, 'gunting_batu_kertas_rpg.png', 'game/gunting_batu_kertas_rpg/index.php', 'Game Gunting Batu Kertas dengan Sistem Level'),
(6, 'Memory Game', 11, 'memory_game.png', 'game/memory_game_master/index.php', 'Game pengasah ingatan!'),
(7, 'Semangka Anomali', 7, 'semangka_anomali.png', 'game/semangka_anomali/index.html', 'Anomali Banget!'),
(8, 'Doom Bubble', 3, 'doom_bubble.png', 'game/doom_bubble/index.php', 'Labirin');

-- --------------------------------------------------------

--
-- Table structure for table `jawaban_asal`
--

CREATE TABLE `jawaban_asal` (
  `id` int NOT NULL,
  `jawaban_asal` varchar(255) NOT NULL,
  `id_kategori` int NOT NULL
);

--
-- Dumping data for table `jawaban_asal`
--

INSERT INTO `jawaban_asal` (`id`, `jawaban_asal`, `id_kategori`) VALUES
(1, 'Menuntut kebijakan yang hanya menguntungkan sebagian golongan', 1),
(3, 'Array', 2),
(4, 'Switch', 2),
(5, 'PHP', 2),
(6, 'a>b', 2),
(7, ' Sumber dari segala sumber hukum', 1),
(8, 'Monarki Konstitusional', 1),
(9, 'Pemerintah tidak perlu diawasi rakyat', 1),
(10, 'Menyimpan sampah di tempatnya', 1),
(11, 'Mahkamah Internasional', 1),
(12, 'Mahkamah Konstitusi', 1),
(13, 'Menjunjung tinggi kepentingan bangsa di atas kepentingan kelompok', 1),
(14, 'Pembukaan UUD 1945 alinea ke-4', 1),
(15, ' 28A - 28J', 1),
(16, 'Hanya bergaul dengan suku sendiri', 1),
(17, ' Object-Oriented Programming', 2),
(18, 'Output Optimization Process', 2),
(19, 'True dan False', 2),
(20, ' try dan except', 2),
(21, 'System.print(\"Hello World\");', 2),
(22, 'Console.write(\"Hello World\");', 2),
(23, ' int x = 10;', 2),
(24, 'Python', 2),
(25, 'Mengakhiri perulangan sebelum kondisi selesai', 2),
(26, ' /* Komentar */', 2),
(27, ' Mikroorganisme', 3),
(28, 'Mesosfer', 3),
(29, 'Modernisasi', 3),
(30, 'Energi matahari', 3),
(31, 'Komensalisme', 3),
(32, 'Ketergantungan terhadap produk luar negeri', 3),
(33, ' Berkurangnya lahan pertanian', 3),
(34, '19876', 4),
(35, 'x - y = 3x + y6', 4),
(36, '100', 4),
(37, 'x(-1) + y9 + 18 ', 4),
(38, '\r\nlog2 8=x', 4),
(39, '18', 4),
(40, '11', 4),
(41, 'Perjanjian Versailles', 5),
(42, ' Penyebaran agama Kristen di Eropa\r\n', 5),
(43, 'Subhas Chandra Bose', 5),
(44, 'Kemunduran ekonomi akibat Revolusi Industri', 5),
(45, ' Menghapus diskriminasi rasial', 5),
(46, '1628–1629', 5),
(47, 'Yogyakarta', 5),
(55, 'Sebagai media ekspresi diri', 6),
(56, 'Kursi ukir', 6),
(57, 'Tari Saman', 6),
(58, 'Gamelan', 6),
(59, 'Keseimbangan', 6),
(60, 'Melodi', 6),
(61, 'Seni kriya', 6),
(62, 'Mengubah hukum-hukum Islam', 7),
(63, ' Nabi Musa a.s.', 7),
(64, 'Menyampaikan wahyu', 7),
(65, 'Memalsukan tanda tangan orang tua untuk izin sekolah', 7),
(66, 'Semakin rajin beribadah dan berbuat baik', 7),
(67, 'Mengabaikan kehidupan dunia karena tidak penting', 7),
(68, ' Menyampaikan petunjuk hidup bagi manusia', 7),
(69, 'Menyatakan alasan', 8),
(70, 'Dengan baik', 8),
(71, 'Nilai-nilai yang terkandung dalam cerita', 8),
(72, 'Kalimat majemuk', 8),
(73, ' Dia sedang mendengar musik.', 8),
(74, ' Cerita fiksi', 8),
(75, 'Penghubung kalimat utama dan penjelasannya', 8),
(76, 'Slow', 9),
(77, ' requesting', 9),
(78, 'will have', 9),
(79, 'He doesn\t like pizza.', 9),
(80, 'I went to the store and I bought some fruit', 9),
(81, 'will go', 9),
(82, 'she finished her homework', 9);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int NOT NULL,
  `kategori` varchar(50) NOT NULL
);

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `kategori`) VALUES
(1, 'PPKN'),
(2, 'Pemrograman'),
(3, 'IPAS'),
(4, 'MTK'),
(5, 'Sejarah'),
(6, 'Seni budaya'),
(7, 'Agama Islam'),
(8, 'Bahasa Indonesia'),
(9, 'Bahasa Inggris');

-- --------------------------------------------------------

--
-- Table structure for table `soal`
--

CREATE TABLE `soal` (
  `id` int NOT NULL,
  `id_kategori` int NOT NULL,
  `soal` varchar(255) NOT NULL,
  `jawaban` varchar(255) NOT NULL,
  `petunjuk` varchar(255) NOT NULL
);

--
-- Dumping data for table `soal`
--

INSERT INTO `soal` (`id`, `id_kategori`, `soal`, `jawaban`, `petunjuk`) VALUES
(1, 2, 'Apa itu variabel dalam pemrograman?\r\n', 'Variabel adalah tempat untuk menyimpan data atau nilai dalam program. Variabel dapat menyimpan berbagai tipe data, seperti angka, teks, atau nilai boolean.\r\n', 'Variabel biasanya diberi nama untuk mengidentifikasi data tersebut.\r\n'),
(2, 1, 'Hak asasi manusia yang diatur dalam UUD 1945 salah satunya adalah hak untuk hidup. Hal ini diatur dalam:\r\n\r\n', 'Pasal 28A', 'Pasal ini mengatur hak setiap orang untuk hidup dan mempertahankan hidup.'),
(3, 1, 'Demokrasi Pancasila merupakan sistem demokrasi yang diterapkan di Indonesia yang berdasarkan pada', 'Kehidupan gotong royong', 'Pancasila sebagai dasar negara mengandung prinsip gotong royong yang mempengaruhi pelaksanaan demokrasi di Indonesia.'),
(4, 1, 'Salah satu ciri negara hukum menurut UUD 1945 adalah adanya', ' Pengakuan terhadap hak asasi manusia', ' Negara hukum di Indonesia harus menghormati dan melindungi hak asasi manusia'),
(5, 1, ' Prinsip negara Pancasila yang menekankan pada adanya keseimbangan antara hak dan kewajiban adalah', ' Keadilan sosial', 'Keadilan sosial mengatur pembagian hak dan kewajiban agar ada keseimbangan bagi seluruh warga negara'),
(6, 1, 'Menjaga persatuan dan kesatuan dalam kehidupan berbangsa dan bernegara adalah tanggung jawab setiap warga negara. Hal ini sesuai dengan amanat yang terkandung dalam', 'UUD 1945', 'UUD 1945 mengamanatkan pentingnya menjaga persatuan dalam kehidupan berbangsa'),
(7, 1, 'Salah satu ciri negara hukum adalah adanya pengadilan yang bebas dari campur tangan pemerintah. Ciri ini ada dalam prinsip negara hukum yang terkandung dalam', 'Pasal 24B UUD 1945', 'Pasal 24B mengatur kekuasaan kehakiman yang independen.\r\n\r\n'),
(8, 1, ' Dalam sistem politik Indonesia, lembaga yang memiliki wewenang untuk membuat undang-undang adalah', 'Dewan Perwakilan Rakyat (DPR)', 'DPR memiliki tugas untuk menyusun dan membahas undang-undang bersama dengan presiden.'),
(9, 1, 'Pengertian demokrasi perwakilan adalah', 'Rakyat memilih wakil yang akan mengatur pemerintahan', 'Demokrasi perwakilan berarti rakyat memilih wakil untuk membuat keputusan bagi mereka.'),
(10, 1, ' Fungsi utama DPR menurut UUD 1945 adalah', 'Menetapkan undang-undang', 'DPR memiliki fungsi utama dalam membuat dan menetapkan undang-undang.'),
(11, 1, 'Salah satu contoh peran serta masyarakat dalam mewujudkan keadilan sosial adalah dengan', 'Mematuhi hukum yang berlaku', 'Mematuhi hukum adalah salah satu wujud kontribusi masyarakat untuk keadilan sosial.\r\n\r\n'),
(12, 3, 'Suatu ekosistem terdiri dari komponen abiotik dan biotik. Yang termasuk komponen abiotik adalah...  \r\n', ' Air dan cahaya matahari  \r\n', 'Unsur yang tidak memiliki kehidupan  \r\n'),
(13, 3, 'Menurut Hukum Newton I, benda akan tetap diam atau bergerak lurus beraturan jika...  \r\n', 'Tidak ada gaya yang bekerja padanya atau resultan gaya sama dengan nol  \r\n\r\n', ' Konsep kelembaman benda\r\n'),
(14, 3, 'Penyebab utama perubahan iklim global adalah...  \r\n', ' Penggunaan bahan bakar fosil yang berlebihan  \r\n', 'Berkaitan dengan emisi karbon dioksida (CO₂) \r\n'),
(15, 3, 'Lapisan bumi yang terdiri dari bahan cair dengan suhu sangat tinggi disebut...  \r\n', ' Inti luar  \r\n', ' Lapisan yang menyebabkan pergerakan lempeng bumi \r\n'),
(16, 3, 'Sumber daya alam yang dapat diperbarui adalah...  \r\n', 'Air dan energi matahari  \r\n', 'Sumber daya yang bisa digunakan terus-menerus  \r\n'),
(17, 3, 'Gaya gravitasi bumi menyebabkan...', ' Benda jatuh ke bawah  \r\n', 'Fenomena apel jatuh dari pohon'),
(18, 3, 'Energi yang tersimpan dalam makanan disebut...  \r\n', ' Energi kimia  \r\n', 'Dihasilkan dari reaksi dalam tubuh  \r\n'),
(19, 3, 'Salah satu dampak utama pencemaran air adalah...  \r\n', 'Terganggunya ekosistem perairan  \r\n\r\n', ' Berhubungan dengan kesehatan makhluk hidup di air'),
(20, 3, 'Pada gerak lurus beraturan, kecepatan benda...  ', 'Tetap setiap saat  \r\n', 'Tidak ada percepatan \r\n'),
(21, 3, 'Gas yang dihasilkan oleh tumbuhan saat proses fotosintesis adalah...  \r\n', 'Oksigen  \r\n', 'Gas yang dibutuhkan manusia untuk bernapas'),
(22, 5, 'Siapa pendiri Kerajaan Majapahit?\r\n', ' Raden Wijaya\r\n', 'Pendiri Majapahit adalah menantu Kertanegara, raja terakhir Singasari'),
(23, 5, 'Apa nama kitab yang ditulis oleh Mpu Prapanca yang menjadi sumber sejarah penting Kerajaan Majapahit?  \r\n', ' Negarakertagama  \r\n', 'Kitab ini berisi pujian terhadap kejayaan Hayam Wuruk'),
(24, 5, 'Siapa tokoh yang mengucapkan Sumpah Palapa untuk mempersatukan Nusantara?  \r\n', 'Gajah Mada  \r\n', 'Ia adalah Mahapatih Majapahit yang terkenal'),
(25, 5, 'Pada masa pemerintahan siapa Kerajaan Majapahit mencapai puncak kejayaannya? \r\n', 'Hayam Wuruk  \r\n', 'Raja ini memerintah bersama Gajah Mada'),
(26, 5, 'Apa penyebab utama keruntuhan Kerajaan Majapahit?  \r\n', 'Perang saudara  \r\n', 'Konflik ini dikenal sebagai Perang Paregreg'),
(27, 5, 'Apa nama pelabuhan penting yang dimiliki Kerajaan Majapahit?  \r\n', ' Tuban  \r\n', ' Pelabuhan ini menjadi pusat perdagangan internasional Majapahit \r\n\r\n'),
(28, 5, 'Apa makna dari Sumpah Palapa yang diucapkan oleh Gajah Mada?  \r\n', 'Tidak akan menikmati kesenangan sebelum menyatukan Nusantara', 'Sumpah ini menunjukkan tekad Gajah Mada untuk mempersatukan wilayah'),
(29, 5, 'Siapa raja Majapahit yang memerintah sebelum Hayam Wuruk? ', 'Tribhuwana Tunggadewi  \r\n', 'Beliau adalah ibu dari Hayam Wuruk'),
(30, 5, 'Apa nama karya sastra yang ditulis oleh Mpu Tantular dan memuat semboyan “Bhinneka Tunggal Ika”?  \r\n', ' Sutasoma  \r\n', 'Karya ini menekankan pentingnya persatuan dalam keberagaman'),
(31, 5, 'Wilayah Majapahit yang disebutkan dalam Negarakertagama meliputi daerah mana saja?  \r\n', 'Nusantara dan sebagian Asia Tenggara  \r\n', 'Wilayah ini mencakup hingga Semenanjung Malaya dan Filipina'),
(32, 6, ' Apa yang dimaksud dengan seni instalasi?\r\n', 'Seni tiga dimensi yang memanfaatkan ruang sebagai bagian dari karya\r\n', 'Pikirkan seni yang melibatkan penataan ruang atau objek secara khusus'),
(33, 6, 'Kesenian wayang kulit berasal dari daerah mana?\r\n', 'Yogyakarta\r\n', 'Berasal dari Pulau Jawa, sering digunakan untuk cerita Mahabharata dan Ramayana'),
(34, 6, 'Unsur utama dalam seni musik adalah...\r\n', 'Ritme dan melodi\r\n', 'Unsur ini membangun suasana dalam musik'),
(35, 6, ' Apa nama alat musik tradisional dari Papua yang menghasilkan bunyi dengan cara dipukul?\r\n', 'Tifa\r\n', 'Terbuat dari kayu dan kulit hewan'),
(36, 6, ' Jenis tari yang terinspirasi dari cerita rakyat disebut...?\r\n', 'Tari tradisional\r\n', 'Tarian ini biasanya diwariskan secara turun-temurun'),
(37, 6, 'Apakah fungsi utama motif geometris pada batik tradisional?\r\n', 'Sebagai simbol status sosial\r\n', 'Biasanya menunjukkan identitas pemakainya'),
(38, 6, 'Aliran seni rupa yang menampilkan realitas kehidupan dengan detail disebut...?\r\n', 'Realisme\r\n', 'Fokus pada penggambaran objek sesuai kenyataan'),
(39, 6, 'Jenis lukisan yang menggunakan cahaya sebagai media disebut...?\r\n', 'Fotografi\r\n', 'Media ini berkembang pesat seiring teknologi'),
(40, 6, 'Apa nama tarian daerah yang mengisahkan tentang panen raya di Sumatera Barat?\r\n', 'Tari Piring\r\n', 'Dalam tarian ini, penari sering menggunakan alat makan'),
(41, 6, 'Teknik arsir dalam menggambar digunakan untuk...?\r\n', 'Memberikan efek gelap terang\r\n', 'Teknik ini sering digunakan untuk memberikan kedalaman'),
(42, 8, 'Teks yang bertujuan memberikan informasi secara objektif berdasarkan fakta disebut …', 'Teks eksposisi', 'Teks ini sering ditemukan di artikel berita atau opini dan bertujuan untuk menjelaskan suatu hal secara logis'),
(43, 8, 'Kalimat efektif adalah kalimat yang …', 'Mudah dipahami dan jelas', 'Ciri kalimat efektif adalah hemat kata dan tidak bertele-tele'),
(44, 8, 'Penggunaan huruf kapital yang benar terdapat pada kalimat …', 'Kami akan ke rumah Paman Rudi di Surabaya', 'Nama tempat, orang, dan awal kalimat menggunakan huruf kapital'),
(45, 8, 'Tokoh utama dalam sebuah cerita disebut juga …', 'Protagonis', 'Tokoh ini biasanya menjadi fokus utama cerita dan sering kali memiliki sifat baik'),
(46, 8, 'Makna konotasi dari kata \"harimau\" dalam kalimat \"Dia adalah harimau di dunia politik\" adalah …', ' Orang yang kuat', 'Konotasi adalah makna tambahan yang bukan makna sebenarnya'),
(47, 8, 'Manakah yang merupakan contoh teks persuasif?', 'Artikel yang mengajak menjaga kebersihan lingkungan', 'Teks persuasif bertujuan mengajak atau memengaruhi pembaca untuk melakukan sesuatu'),
(48, 8, 'Berikut ini yang bukan termasuk unsur intrinsik cerpen adalah …', 'Narasumber', 'Unsur intrinsik adalah unsur yang membangun cerita dari dalam'),
(49, 8, 'Makna imbuhan me- pada kata \"menulis\" adalah …', 'Melakukan sesuatu', ' Imbuhan me- biasanya menyatakan perbuatan'),
(50, 8, 'Antonim dari kata \"optimis\" adalah …', 'Pesimis', 'Antonim adalah kata yang berlawanan makna'),
(51, 8, 'Peribahasa \"Bagai air di daun talas\" memiliki arti …', 'Ketidakstabilan pendirian', 'Daun talas memiliki permukaan licin, air mudah tergelincir tanpa menetap'),
(52, 9, ' \"My sister ..... to school every day.\"\r\n', 'goes\r\n', ' Subject \"my sister\" is singular, so the verb needs to agree.\r\n'),
(53, 9, 'Which sentence correctly uses an adjective?\r\n', ' He is a fast runner.\r\n', ' Look for a sentence where the adjective describes a noun.\r\n'),
(54, 9, 'What is the synonym of \"beautiful\"?\r\n', 'Pretty\r\n', 'Think about a word that also means attractive or lovely.\r\n'),
(55, 9, 'Change this sentence into passive voice: \"The chef cooked a delicious meal.\"', ' A delicious meal was cooked by the chef.\r\n', 'Identify the tense of the verb in the active sentence.\r\n'),
(56, 9, 'Change this sentence into reported speech: \"I will go to the party,\" she said.\r\n', 'She said she would go to the party.\r\n', 'Remember the rule for changing \"will\" in reported speech.\r\n'),
(57, 9, ' \"The cat is hiding ___ the table.\"\r\n', 'under\r\n', 'Think about where a cat might hide.\r\n'),
(58, 9, '\"If I ___ a bird, I would fly around the world.\"\r\n', 'were', 'For unreal conditions, we use a specific form of the verb \"to be.\"\r\n'),
(59, 9, 'Which sentence uses the correct modal verb?\r\n', 'You should study for the exam.\r\n', 'Check the grammar of the modal verb and the verb that follows.\r\n'),
(60, 9, 'Choose the correct sentence:\r\n', 'She enjoys playing piano.\r\n', 'Some verbs are followed by gerunds (-ing form).\r\n'),
(61, 9, 'Which question is correct?\r\n', 'Where does she live?\r\n', 'Pay attention to subject-verb agreement and tense.'),
(62, 7, 'Apa fungsi utama Al-Qur\an bagi umat Islam?', ' Petunjuk hidup bagi manusia', 'Al-Qur\an disebut sebagai \"Hudan lil Muttaqin\" yang berarti petunjuk bagi orang-orang bertakwa.  \r\n'),
(63, 7, 'Apa arti sifat wajib Allah Al-Hakim', 'Maha Bijaksana', ' Kata \"Hakim\" dalam bahasa Arab berkaitan dengan hikmah dan kebijaksanaan. '),
(64, 7, 'Apa hukum shalat lima waktu bagi seorang Muslim', 'Wajib ain', 'Wajib ain adalah kewajiban yang harus dilakukan setiap individu. '),
(65, 7, 'Apa contoh perilaku amanah dalam kehidupan sehari-hari?', 'Menyampaikan titipan kepada orang yang dituju', 'Amanah berarti menjaga kepercayaan atau tanggung jawab yang diberikan'),
(66, 7, 'Peristiwa apa yang menjadi awal dari penanggalan hijriah?', 'Hijrah Rasulullah SAW ke Madinah', ' Penanggalan hijriah dinamakan berdasarkan peristiwa hijrah.  '),
(67, 7, 'Apa syarat sah dalam melaksanakan puasa Ramadan?', 'Membaca niat setiap malam', 'Niat adalah salah satu rukun puasa yang harus dilakukan sebelum waktu subuh.  \r\n'),
(68, 7, 'Apa perbedaan antara najis dan hadas dalam Islam?', 'Najis adalah kotoran fisik, hadas adalah keadaan tidak suci', 'Najis berkaitan dengan benda eksternal, sedangkan hadas adalah kondisi internal.  \r\n'),
(69, 7, 'Surah apa yang pertama kali diturunkan kepada Nabi Muhammad SAW?', 'Al-‘Alaq', 'Surah ini dimulai dengan \"Iqra\" yang berarti \"bacalah.'),
(70, 7, 'Apa tujuan utama seorang Muslim beriman kepada Allah?', 'Mendapatkan ridha dan rahmat Allah', 'Tujuan ibadah dalam Islam adalah mendekatkan diri kepada Allah'),
(71, 7, 'Apa isi utama dari Perjanjian Hudaibiyah?', ' Kesepakatan damai antara Quraisy dan Muslim selama 10 tahun', ' Perjanjian ini menjadi awal dari penyebaran Islam secara lebih luas.'),
(72, 2, 'Dalam logika pemrograman, jika pernyataan adalah: \"Jika saya bangun pagi ATAU alarm berbunyi, maka saya tidak akan terlambat.\" Jika alarm tidak berbunyi, tetapi Anda bangun pagi, apakah Anda terlambat?  \r\n', 'Tidak  ', 'Dalam logika OR, cukup salah satu kondisi terpenuhi agar hasilnya true.\r\n'),
(73, 2, 'Dalam logika pemrograman, jika pernyataan adalah: \"Jika saya bangun pagi ATAU alarm berbunyi, maka saya tidak akan terlambat.\" Jika alarm tidak berbunyi, tetapi Anda bangun pagi, apakah Anda terlambat?  \r\n\r\n', 'Tidak', 'Dalam logika OR, cukup salah satu kondisi terpenuhi agar hasilnya true'),
(74, 2, 'Manakah dari berikut ini yang bukan operator logika dalam pemrograman?', 'MAYBE', 'Cek daftar operator logika standar yang sering digunakan dalam bahasa pemrograman'),
(75, 2, 'Dalam logika aritmatika, jika x = 8 dan y = 2, apa hasil dari (x / y) + y?  \r\n', '6', 'Lakukan operasi pembagian terlebih dahulu, kemudian tambahkan hasilnya dengan nilai y'),
(76, 2, 'Dalam sebuah perulangan, kondisi berikut diberikan: \"Selama n < 5, ulangi proses\". Jika n dimulai dari 6, apa yang terjadi? ', 'Perulangan tidak berjalan sama sekali', 'Evaluasi kondisi awal. Apakah n memenuhi syarat untuk memulai perulangan?\r\n'),
(77, 2, 'Apa hasil dari operasi berikut jika x = 3 dan y = 5? (x > y) AND (x + y > 7)  \r\n', 'False', 'Operator AND memerlukan kedua kondisi bernilai true agar hasil akhir true'),
(78, 2, 'Jika nilai a = 7 dan b = 3, manakah pernyataan berikut yang menghasilkan nilai false?  \r\n\r\n', 'a + b == 9', 'Periksa hasil setiap pernyataan dengan memasukkan nilai a dan b'),
(79, 2, 'Manakah dari berikut ini yang merupakan pernyataan logika yang benar?  \r\n\r\n', '1 OR 0 menghasilkan 1  \r\n', 'Cek tabel kebenaran untuk setiap operator logika yang disebutkan dalam pilihan'),
(80, 2, 'Jika diberikan pernyataan berikut: \"Jika saya punya uang DAN waktu, saya akan menonton film.\" Jika Anda tidak memiliki uang tetapi memiliki waktu, apakah Anda akan menonton film?  \r\n\r\n', 'Tidak', 'Operator AND membutuhkan kedua kondisi terpenuhi untuk menghasilkan hasil true'),
(81, 2, 'Apa yang terjadi jika sebuah perulangan tidak memiliki kondisi berhenti?  \r\n', 'Perulangan berjalan terus tanpa henti', 'Pikirkan apa yang terjadi pada program jika tidak ada syarat untuk keluar dari perulangan\r\n'),
(82, 4, 'Dari 10 siswa, dipilih 3 siswa secara acak. Berapa banyak cara memilihnya?\r\n', '120', 'soal tersebut merupakan soal yang tidak memperhatikan urutan\r\n'),
(83, 4, 'Jika x : y = 3 : 5 dan x + y = 32, tentukan nilai x dan y\r\n', 'X=12 y=20\r\n', 'gunakan perbandingan lalu subtitusi kan ke jumlah nya\r\n'),
(84, 4, 'Sebuah dadu dilempar 2 kali. Berapa peluang muncul total angka 9 dan 12? \r\n\r\n', '5/36', 'pasangan dua mata dadu yang menghasilkan 9 & 12 lalu di jumlahkan\r\n'),
(85, 4, 'Berapakah hasil dari 4³.4⁴ ?\r\n\r\n', '4^7', ' gunakan sifat sifat pangkat eksponen\r\n'),
(86, 4, 'Berapakah hasil dari log 100 - log 4? \r\n', '25', ' gunakan sifat logaritma (log a-log b = Log a:b)\r\n'),
(87, 4, 'Jika 3^x+1 = 81 maka tentukan nilai x\r\n\r\n', 'X=3', 'samakan basis nya menjadi 81\r\n'),
(88, 4, ' Berapakah hasil dari √100 + √27 - √12\r\n\r\n', '13√3\r\n', 'Pecah bilangan menjadi faktor dari bilangan utama\r\n'),
(89, 4, 'Diketahui barisan aritmatika dengan suku pertama (a) = 5 dan beda (b) = 3. Hitunglah jumlah suku ke 10.\r\n', '285', 'Gunakan rumus Sn'),
(90, 4, 'Hitunglah luas permukaan tabung dengan r = 14 cm \r\n', '1078', 'rumus bola = 4πr²\r\n'),
(91, 4, 'F(x) = x²+3\r\nG(x) = x-1\r\nMaka (FoG) )(2) adalah.... \r\n', '4', 'subtitusi kan dua ke huruf g lalu subtitusi kan hasil nya ke f');

-- --------------------------------------------------------

--
-- Table structure for table `tim_developer`
--

CREATE TABLE `tim_developer` (
  `id_tim` int NOT NULL,
  `nama_anggota` varchar(255) NOT NULL
);

--
-- Dumping data for table `tim_developer`
--

INSERT INTO `tim_developer` (`id_tim`, `nama_anggota`) VALUES
(1, 'Husni Mubarak'),
(2, 'Naufal Raihan Ramadhan. Nur Said Syaban'),
(3, 'Muhammad Fachri Al Farizky. Romulus Pandapotan'),
(4, 'Felicia Giona Budiman. Artaresya Faragista Ramadhani'),
(5, 'Queenrine Messia Shireen Meray. Nabila Hajizah'),
(6, 'Cornel Firstio. Rachel Fayza Idris'),
(7, 'Naufal Raihan Ramadhan\r\n'),
(8, 'Nur Said Syaban\r\n'),
(9, 'Muhammad Fachri Al Farizky\r\n'),
(10, 'Romulus Pandapotan\r\n'),
(11, 'Felicia Giona Budiman\r\n'),
(12, 'Artaresya Faragista Ramadhani\r\n'),
(13, 'Queenrine Messia Shireen Meray\r\n'),
(14, 'Nabila Hajizah\r\n'),
(15, 'Cornel Firstio\r\n'),
(16, 'Rachel Fayza Idris');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `developer`
--
ALTER TABLE `developer`
  ADD PRIMARY KEY (`id_developer`);

--
-- Indexes for table `galery`
--
ALTER TABLE `galery`
  ADD PRIMARY KEY (`id_galery`);

--
-- Indexes for table `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`id_game`),
  ADD KEY `fid_developer` (`fid_timDeveloper`);

--
-- Indexes for table `jawaban_asal`
--
ALTER TABLE `jawaban_asal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `soal`
--
ALTER TABLE `soal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kategori` (`id_kategori`);

--
-- Indexes for table `tim_developer`
--
ALTER TABLE `tim_developer`
  ADD PRIMARY KEY (`id_tim`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `developer`
--
ALTER TABLE `developer`
  MODIFY `id_developer` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `galery`
--
ALTER TABLE `galery`
  MODIFY `id_galery` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `game`
--
ALTER TABLE `game`
  MODIFY `id_game` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `jawaban_asal`
--
ALTER TABLE `jawaban_asal`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `soal`
--
ALTER TABLE `soal`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `tim_developer`
--
ALTER TABLE `tim_developer`
  MODIFY `id_tim` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `game`
--
ALTER TABLE `game`
  ADD CONSTRAINT `game_ibfk_2` FOREIGN KEY (`fid_timDeveloper`) REFERENCES `tim_developer` (`id_tim`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jawaban_asal`
--
ALTER TABLE `jawaban_asal`
  ADD CONSTRAINT `jawaban_asal_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `soal`
--
ALTER TABLE `soal`
  ADD CONSTRAINT `soal_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;