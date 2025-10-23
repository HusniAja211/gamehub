-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 23, 2025 at 06:12 PM
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
-- Database: `gamehub`
--

-- --------------------------------------------------------

--
-- Table structure for table `developer`
--

CREATE TABLE `developer` (
  `id_developer` int NOT NULL,
  `nama_developer` varchar(100) NOT NULL,
  `instagram` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `linkedin` varchar(100) DEFAULT NULL,
  `github` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `deskripsi` varchar(200) NOT NULL,
  `gambar_developer` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `nama_galery` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `gambar_game` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tautan` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `jawaban_asal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_kategori` int NOT NULL,
  `id_soal` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jawaban_asal`
--

INSERT INTO `jawaban_asal` (`id`, `jawaban_asal`, `id_kategori`, `id_soal`) VALUES
(1, '(2,2)', 1, 1),
(2, '(1,3)', 1, 1),
(3, '(3,3)', 1, 1),
(4, '(2,1)', 1, 1),
(5, '(4,6)', 1, 2),
(6, '(5,5)', 1, 2),
(7, '(3,7)', 1, 2),
(8, '(7,3)', 1, 2),
(9, '4', 1, 3),
(10, '2', 1, 3),
(11, '5', 1, 3),
(12, '1', 1, 3),
(13, '2', 1, 4),
(14, '8', 1, 4),
(15, '16', 1, 4),
(16, '1', 1, 4),
(17, '150', 1, 5),
(18, '160', 1, 5),
(19, '165', 1, 5),
(20, '158', 1, 5),
(21, 'y = 3x +1', 1, 6),
(22, 'y = 2x +3', 1, 6),
(23, 'y = x +2', 1, 6),
(24, 'y = 3x +2', 1, 6),
(25, '50 km/jam', 1, 7),
(26, '55 km/jam', 1, 7),
(27, '70 km/jam', 1, 7),
(28, '65 km/jam', 1, 7),
(29, '1/2', 1, 8),
(30, '√3/2', 1, 8),
(31, '1', 1, 8),
(32, '0', 1, 8),
(33, 'x ≥ 5', 1, 9),
(34, 'x ≤ 15', 1, 9),
(35, 'x ≥ 15', 1, 9),
(36, 'x = 5', 1, 9),
(37, '13 cm²', 1, 10),
(38, '15 cm²', 1, 10),
(39, '25 cm²', 1, 10),
(40, '40 cm²', 1, 10),
(41, 'Mars', 2, 11),
(42, 'Jupiter', 2, 11),
(43, 'Saturnus', 2, 11),
(44, 'Neptunus', 2, 11),
(45, 'Planet raksasa yang memantulkan cahaya sangat kuat', 2, 12),
(46, 'Lubang hitam yang memancarkan sinar gamma', 2, 12),
(47, 'Satelit alami yang memancarkan cahaya ultraviolet', 2, 12),
(48, 'Meteor yang terbakar di atmosfer', 2, 12),
(49, 'Planet berbatu yang sangat dekat dengan bintang induknya', 2, 13),
(50, 'Planet es yang berada di zona layak huni', 2, 13),
(51, 'Planet dengan cincin seperti Saturnus', 2, 13),
(52, 'Planet mini di sabuk asteroid', 2, 13),
(53, 'Gelombang gravitasi dari bulan', 2, 14),
(54, 'Refleksi sinar bintang jauh oleh atmosfer', 2, 14),
(55, 'Aktivitas vulkanik di kutub', 2, 14),
(56, 'Pasang surut laut', 2, 14),
(57, 'Io', 2, 15),
(58, 'Europa', 2, 15),
(59, 'Ganymede', 2, 15),
(60, 'Callisto', 2, 15),
(61, '100 juta tahun', 2, 16),
(62, '1 miliar tahun', 2, 16),
(63, '10 miliar tahun', 2, 16),
(64, '12 miliar tahun', 2, 16),
(65, 'Bintang neutron tunggal', 2, 17),
(66, 'Bintang super raksasa merah', 2, 17),
(67, 'Bintang biru raksasa', 2, 17),
(68, 'Planet raksasa', 2, 17),
(69, 'Spiral', 2, 18),
(70, 'Elips', 2, 18),
(71, 'Lentikular', 2, 18),
(72, 'Irregular', 2, 18),
(73, 'Gerak rotasi bintang', 2, 19),
(74, 'Mekanisme pembentukan galaksi', 2, 19),
(75, 'Pembentukan lubang hitam', 2, 19),
(76, 'Evolusi nebula', 2, 19),
(77, 'Orbit planet', 2, 20),
(78, 'Sabuk asteroid', 2, 20),
(79, 'Atmosfer Bumi', 2, 20),
(80, 'Nebula', 2, 20),
(81, 'Teknik komputer', 3, 21),
(82, 'Teknik informatika', 3, 21),
(83, 'Hubungan internasional', 3, 21),
(84, 'Manajemen bisnis', 3, 21),
(85, 'Developer', 3, 22),
(86, 'Programmer', 3, 22),
(87, 'Mobile developer', 3, 22),
(88, 'System analyst', 3, 22),
(89, 'Baik programmer maupun developer memiliki tugas yang berhubungan dengan coding', 3, 23),
(90, 'Seorang developer adalah seorang programmer', 3, 23),
(91, 'Developer memiliki salah satu tugasnya adalah mendesain perangkat lunak', 3, 23),
(92, 'Developer memiliki salah satu tugasnya adalah melakukan pengembangan sistem', 3, 23),
(93, 'Programming, brainware, dan system operasi', 3, 24),
(94, 'Brainware, hardware, dan programming', 3, 24),
(95, 'Sistem operasi, hardware, dan brainware', 3, 24),
(96, 'Hardware, brainware, dan system operasi', 3, 24),
(97, 'Multipartite virus', 3, 25),
(98, 'File virus', 3, 25),
(99, 'Macro virus', 3, 25),
(100, 'Trojan horse', 3, 25),
(101, 'Keyboard', 3, 26),
(102, 'Mic', 3, 26),
(103, 'Scanner', 3, 26),
(104, 'Mouse', 3, 26),
(105, 'Menghubungkan komputer dengan perangkat keras lainnya', 3, 27),
(106, 'Menyimpan data dalam jaringan', 3, 27),
(107, 'Mengontrol akses pengguna ke jaringan', 3, 27),
(108, 'Menyediakan antarmuka pengguna grafis', 3, 27),
(109, 'Topologi bintang', 3, 28),
(110, 'Topologi cincin', 3, 28),
(111, 'Topologi mesh', 3, 28),
(112, 'Topologi pohon', 3, 28),
(113, 'Multitalent', 3, 29),
(114, 'Multimedia', 3, 29),
(115, 'Collaboration', 3, 29),
(116, 'System tax', 3, 29),
(117, 'Mempercepat arus informasi', 3, 30),
(118, 'Memudahkan komunikasi antar divisi', 3, 30),
(119, 'Penghematan biaya', 3, 30),
(120, 'Mempermudah koordinasi', 3, 30),
(121, 'Berakhirnya monopoli rempah-rempah di Batavia', 4, 31),
(122, 'Pembentukan VOC sebagai perusahaan dagang', 4, 31),
(123, 'Penyerahan Maluku kepada Belanda', 4, 31),
(124, 'Perjanjian dagang bebas dengan Inggris', 4, 31),
(125, 'Menyusun UUD 1945 secara diam-diam', 4, 32),
(126, 'Membentuk kabinet pemerintahan pertama', 4, 32),
(127, 'Mengamankan harta VOC yang tersisa', 4, 32),
(128, 'Menyepakati pembagian wilayah pasca-kemerdekaan', 4, 32),
(129, 'Mohammad Hatta', 4, 33),
(130, 'Soekarno', 4, 33),
(131, 'Tan Malaka', 4, 33),
(132, 'Agus Salim', 4, 33),
(133, 'Program pendidikan Jepang untuk pemuda Indonesia', 4, 34),
(134, 'Program distribusi makanan Jepang', 4, 34),
(135, 'Aliansi militer Indonesia-Jepang', 4, 34),
(136, 'Sistem perpajakan baru', 4, 34),
(137, 'Mengusir penjajah Belanda dengan kekerasan', 4, 35),
(138, 'Membentuk partai politik pertama di Indonesia', 4, 35),
(139, 'Menjadi lembaga pendidikan pemuda', 4, 35),
(140, 'Memperoleh kemerdekaan dari Jepang', 4, 35),
(141, 'Transportasi laut', 4, 36),
(142, 'Pertanian', 4, 36),
(143, 'Pertambangan emas saja', 4, 36),
(144, 'Telekomunikasi', 4, 36),
(145, 'Penentangan terhadap monopoli rempah-rempah', 4, 37),
(146, 'Persaingan antara Kerajaan Mataram dan VOC', 4, 37),
(147, 'Pembagian wilayah pasca-perjanjian Giyanti', 4, 37),
(148, 'Ketidakpuasan rakyat terhadap sistem pendidikan', 4, 37),
(149, 'Ki Hajar Dewantara', 4, 38),
(150, 'Soekarno', 4, 38),
(151, 'Mohammad Hatta', 4, 38),
(152, 'Tan Malaka', 4, 38),
(153, 'Memperketat pajak rakyat', 4, 39),
(154, 'Memonopoli perdagangan rempah', 4, 39),
(155, 'Menghapus sistem kerajaan lokal', 4, 39),
(156, 'Mengusir pedagang asing', 4, 39),
(157, 'Invasi Jerman ke Polandia', 4, 40),
(158, 'Krisis ekonomi global', 4, 40),
(159, 'Revolusi Bolshevik', 4, 40),
(160, 'Pertempuran di Normandia', 4, 40),
(161, 'Nitrogen', 5, 41),
(162, 'Oksigen', 5, 41),
(163, 'Argon', 5, 41),
(164, 'Helium', 5, 41),
(165, '2 m/s²', 5, 42),
(166, '6 m/s²', 5, 42),
(167, '1 m/s²', 5, 42),
(168, '3 m/s²', 5, 42),
(169, 'Nukleus', 5, 43),
(170, 'Mitokondria', 5, 43),
(171, 'Lisosom', 5, 43),
(172, 'Kloroplas', 5, 43),
(173, 'Gas bereaksi menghasilkan larutan', 5, 44),
(174, 'Suatu larutan dipanaskan hingga menguap', 5, 44),
(175, 'Elektrolit dilarutkan dalam air', 5, 44),
(176, 'Protein dihidrolisis', 5, 44),
(177, 'Konsentrasi protein', 5, 45),
(178, 'Jumlah ribosom', 5, 45),
(179, 'Kadar lipid', 5, 45),
(180, 'Suhu ekstrem 0°C', 5, 45),
(181, 'Hanya terion sebagian', 5, 46),
(182, 'Tidak bereaksi dengan indikator', 5, 46),
(183, 'Menghasilkan basa', 5, 46),
(184, 'Menghasilkan gas oksigen', 5, 46),
(185, 'Fusi membelah inti berat, fisi menggabungkan inti ringan', 5, 47),
(186, 'Fusi terjadi di bumi, fisi di matahari', 5, 47),
(187, 'Fusi menghasilkan energi kecil, fisi energi besar', 5, 47),
(188, 'Fusi sama dengan fisi', 5, 47),
(189, 'Tumbuhan hijau', 5, 48),
(190, 'Karnivora', 5, 48),
(191, 'Omnivora', 5, 48),
(192, 'Dekomposer', 5, 48),
(193, 'F = m × a', 5, 49),
(194, 'Aksi dan reaksi selalu sama', 5, 49),
(195, 'Energi tidak bisa diciptakan', 5, 49),
(196, 'Percepatan berbanding terbalik dengan massa', 5, 49),
(197, '1:1', 5, 50),
(198, '3:1', 5, 50),
(199, '2:2', 5, 50),
(200, '4:0', 5, 50),
(201, 'Menentukan harga jual produk saja', 6, 51),
(202, 'Membuat desain logo perusahaan', 6, 51),
(203, 'Menghitung modal awal', 6, 51),
(204, 'Menentukan lokasi toko', 6, 51),
(205, 'Harganya mahal', 6, 52),
(206, 'Mengikuti tren terbaru', 6, 52),
(207, 'Menggunakan bahan impor', 6, 52),
(208, 'Diproduksi secara massal tanpa uji pasar', 6, 52),
(209, 'Mengandalkan keberuntungan', 6, 53),
(210, 'Tidak peduli kebutuhan pasar', 6, 53),
(211, 'Mengikuti orang lain', 6, 53),
(212, 'Menghindari risiko', 6, 53),
(213, 'Koperasi hanya menjual makanan, perusahaan menjual barang lain', 6, 54),
(214, 'Koperasi beranggotakan pemilik modal, perusahaan beranggotakan konsumen', 6, 54),
(215, 'Koperasi tidak memiliki keuntungan', 6, 54),
(216, 'Perusahaan tidak boleh rugi', 6, 54),
(217, 'Produk, Proses, Promosi, Pembayaran', 6, 55),
(218, 'Produk, Pelanggan, Proses, Promosi', 6, 55),
(219, 'Produk, Paket, Harga, Pelayanan', 6, 55),
(220, 'Produk, Persediaan, Penjualan, Promosi', 6, 55),
(221, 'Bank saja', 6, 56),
(222, 'Investor asing', 6, 56),
(223, 'Pinjaman pemerintah saja', 6, 56),
(224, 'Koperasi internasional', 6, 56),
(225, 'Warung kelontong', 6, 57),
(226, 'Peternakan ayam', 6, 57),
(227, 'Pertanian konvensional', 6, 57),
(228, 'Bengkel motor', 6, 57),
(229, 'Paten', 6, 58),
(230, 'Merek', 6, 58),
(231, 'Hak Cipta', 6, 58),
(232, 'Lisensi', 6, 58),
(233, 'Hanya meniru pesaing', 6, 59),
(234, 'Produksi banyak tanpa penjualan', 6, 59),
(235, 'Menghindari inovasi', 6, 59),
(236, 'Mengutamakan biaya rendah saja', 6, 59),
(237, 'Harga pesaing saja', 6, 60),
(238, 'Harga yang mahal agar terlihat eksklusif', 6, 60),
(239, 'Hanya biaya promosi', 6, 60),
(240, 'Biaya transportasi saja', 6, 60),
(241, 'Hiperbola', 7, 61),
(242, 'Metafora', 7, 61),
(243, 'Simile', 7, 61),
(244, 'Ironi', 7, 61),
(245, 'Kata penghubung logika', 7, 62),
(246, 'Kata ganti subjek', 7, 62),
(247, 'Menyatakan tempat', 7, 62),
(248, 'Menyatakan waktu', 7, 62),
(249, 'Selalu memuat argumen dan fakta', 7, 63),
(250, 'Mengajak pembaca bertindak', 7, 63),
(251, 'Menggunakan data statistik', 7, 63),
(252, 'Memiliki pola sebab-akibat', 7, 63),
(253, 'Aliterasi', 7, 64),
(254, 'Personifikasi', 7, 64),
(255, 'Hiperbola', 7, 64),
(256, 'Simile', 7, 64),
(257, 'Pendidikan karakter', 7, 65),
(258, 'Pentingnya teknologi', 7, 65),
(259, 'Kebijakan pemerintah', 7, 65),
(260, 'Hubungan keluarga', 7, 65),
(261, 'Memperkenalkan topik', 7, 66),
(262, 'Memberikan contoh tambahan', 7, 66),
(263, 'Memperluas isu baru', 7, 66),
(264, 'Mengutip literatur', 7, 66),
(265, 'Simile', 7, 67),
(266, 'Personifikasi', 7, 67),
(267, 'Hiperbola', 7, 67),
(268, 'Litotes', 7, 67),
(269, 'Orientasi, Komplikasi, Resolusi', 7, 68),
(270, 'Pendahuluan, Latar, Penutup', 7, 68),
(271, 'Abstrak, Bab, Kesimpulan', 7, 68),
(272, 'Pendahuluan, Dialog, Epilog', 7, 68),
(273, 'Narasi', 7, 69),
(274, 'Deskripsi', 7, 69),
(275, 'Persuasi', 7, 69),
(276, 'Cerita fiksi', 7, 69),
(277, 'Tokoh utama dan sifatnya', 7, 70),
(278, 'Tema dan amanat', 7, 70),
(279, 'Alur cerita', 7, 70),
(280, 'Gaya bahasa dan majas', 7, 70),
(281, 'Governments ignore climate change', 8, 71),
(282, 'Renewable energy is harmful', 8, 71),
(283, 'Carbon emissions have no effect', 8, 71),
(284, 'Climate change only affects animals', 8, 71),
(285, 'complicated', 8, 72),
(286, 'confusing', 8, 72),
(287, 'ambiguous', 8, 72),
(288, 'obscure', 8, 72),
(289, 'Neither', 8, 73),
(290, 'of the students', 8, 73),
(291, 'able to answer', 8, 73),
(292, 'the difficult question', 8, 73),
(293, 'Electric buses help reduce pollution', 8, 74),
(294, 'Bike-sharing programs are part of sustainable transport', 8, 74),
(295, 'Cities aim to reduce traffic congestion', 8, 74),
(296, 'Sustainable transport is being adopted by many cities', 8, 74),
(297, 'hand out', 8, 75),
(298, 'hand over', 8, 75),
(299, 'hand up', 8, 75),
(300, 'hand back', 8, 75),
(301, 'Closed', 8, 76),
(302, 'Renovated', 8, 76),
(303, 'Cancelled', 8, 76),
(304, 'Sold', 8, 76),
(305, 'Lisa said she will finish the project tomorrow', 8, 77),
(306, 'Lisa said she finishes the project tomorrow', 8, 77),
(307, 'Lisa said she finished the project tomorrow', 8, 77),
(308, 'Lisa said she finish the project tomorrow', 8, 77),
(309, 'Ordinary', 8, 78),
(310, 'Traditional', 8, 78),
(311, 'Conventional', 8, 78),
(312, 'Common', 8, 78),
(313, 'Using technology safely', 8, 79),
(314, 'Evaluating online sources', 8, 79),
(315, 'Creating digital content responsibly', 8, 79),
(316, 'Critical thinking online', 8, 79),
(317, 'starts', 8, 80),
(318, 'started', 8, 80),
(319, 'start', 8, 80),
(320, 'starting', 8, 80);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int NOT NULL,
  `kategori` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `kategori`) VALUES
(1, 'Matematika'),
(2, 'Astronomi'),
(3, 'Informatika'),
(4, 'Sejarah'),
(5, 'Ilmu Pengetahuan Alam (IPA)'),
(6, 'Prakarya dan Kewirausahaan (PKWU)'),
(7, 'Bahasa Indonesia'),
(8, 'Bahasa Inggris'),
(9, 'Bahasa Inggris');

-- --------------------------------------------------------

--
-- Table structure for table `soal`
--

CREATE TABLE `soal` (
  `id` int NOT NULL,
  `id_kategori` int NOT NULL,
  `soal` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `jawaban` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `petunjuk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `soal`
--

INSERT INTO `soal` (`id`, `id_kategori`, `soal`, `jawaban`, `petunjuk`) VALUES
(1, 1, 'Perhatikan fungsi kuadrat berikut. Fungsi ini memiliki titik maksimum yang menentukan nilai tertinggi fungsi. Titik maksimum fungsi adalah…', '(3,1)', 'Gunakan rumus titik puncak fungsi kuadrat'),
(2, 1, 'Sistem persamaan linear berikut: x + y = 10 dan x - y = 2. Nilai x dan y yang benar adalah…', '(6,4)', 'Gunakan metode eliminasi atau substitusi'),
(3, 1, 'Jika 2^(x+2) = 32, maka nilai x adalah…', '3', 'Ubahlah 32 menjadi 2^5 untuk mempermudah'),
(4, 1, 'Jika log₂16 = x, maka nilai x adalah…', '4', 'Ubah 16 menjadi 2^4'),
(5, 1, 'Data tinggi badan siswa: 150, 155, 160, 155, 165, 155. Modus dari data tersebut adalah…', '155', 'Cari nilai yang paling sering muncul'),
(6, 1, 'Sebuah garis melalui titik (1,2) dengan gradien 3. Persamaan garis tersebut adalah…', 'y = 3x -1', 'Gunakan rumus y - y1 = m(x - x1)'),
(7, 1, 'Sebuah mobil menempuh jarak 120 km dalam 2 jam. Kecepatan rata-rata mobil adalah…', '60 km/jam', 'Gunakan rumus kecepatan = jarak / waktu'),
(8, 1, 'Nilai Sin 45° adalah…', '√2/2', 'Gunakan nilai trigonometri sudut istimewa'),
(9, 1, 'Jika 3x - 5 ≤ 10, maka nilai x yang memenuhi adalah…', 'x ≤ 5', 'Pindahkan -5 ke kanan dan bagi dengan 3'),
(10, 1, 'Sebuah segitiga memiliki alas 8 cm dan tinggi 5 cm. Luas segitiga adalah…', '20 cm²', 'Gunakan rumus ½ × alas × tinggi'),
(11, 2, 'Planet mana yang memiliki rotasi terbalik dibanding mayoritas planet di Tata Surya?', 'Venus', 'Ingat bahwa arah rotasi planet sebagian besar dari barat ke timur'),
(12, 2, 'Fenomena “pulsar” merupakan…', 'Bintang neutron yang berputar dan memancarkan gelombang radio secara periodik', 'Pulsar berputar sangat cepat dan mengirimkan sinyal teratur'),
(13, 2, 'Ciri khas exoplanet “hot Jupiter” adalah…', 'Planet gas raksasa dengan orbit sangat dekat ke bintang induknya', 'Disebut “hot” karena sangat dekat dengan bintangnya'),
(14, 2, 'Apa penyebab utama terjadinya aurora di Bumi?', 'Interaksi medan magnet Bumi dengan partikel bermuatan dari Matahari', 'Aurora terjadi di dekat kutub akibat interaksi partikel matahari'),
(15, 2, 'Di antara berikut, mana yang merupakan satelit alami planet terluar di Tata Surya?', 'Triton', 'Triton adalah satelit Neptunus, planet terluar di Tata Surya'),
(16, 2, 'Galaksi “Andromeda” diperkirakan akan bertabrakan dengan Bima Sakti dalam kira-kira…', '4 miliar tahun', 'Tumbukan ini akan membentuk galaksi elips raksasa'),
(17, 2, 'Bintang yang mengalami ledakan supernova tipe Ia biasanya berasal dari…', 'Katai putih yang menarik materi dari bintang pendamping', 'Tipe Ia terjadi pada sistem bintang ganda'),
(18, 2, 'Mana yang bukan merupakan jenis galaksi menurut klasifikasi Hubble?', 'Kubik', 'Jenis utama galaksi adalah spiral, elips, lentikular, dan irregular'),
(19, 2, '“Kepler’s Laws” terutama digunakan untuk menjelaskan…', 'Orbit planet mengelilingi bintang', 'Tiga hukum Kepler menggambarkan gerak planet mengelilingi Matahari'),
(20, 2, 'Lubang hitam supermasif biasanya ditemukan di…', 'Inti galaksi', 'Lubang hitam supermasif terdapat di pusat galaksi besar seperti Bima Sakti'),
(21, 3, 'Jurusan informatika yang direkomendasikan bagi yang suka kegiatan sosial tapi juga menikmati ilmu komputer adalah…', 'Sistem informasi', 'Jurusan ini memadukan teknologi dan manajemen organisasi.'),
(22, 3, 'Google-IT Support adalah sertifikasi IT bagi seseorang yang ingin berprofesi sebagai…', 'Helpdesk', 'Profesi ini berhubungan dengan dukungan teknis untuk pengguna.'),
(23, 3, 'Pernyataan yang kurang tepat tentang programmer dan developer adalah…', 'Setiap programmer yang hebat sudah dipastikan bisa menjadi seorang developer', 'Ingat: programmer dan developer berbeda dalam tanggung jawab dan ruang lingkup.'),
(24, 3, 'Sistem komputer terbagi menjadi 3 elemen, yaitu…', 'Hardware, software, dan brainware', 'Ketiganya saling berhubungan membentuk sistem komputer utuh.'),
(25, 3, 'Virus yang berada di boot sector disebut…', 'Boot virus', 'Boot virus menyerang bagian awal media penyimpanan.'),
(26, 3, 'Yang bukan merupakan perangkat masukan (input device) adalah…', 'Monitor', 'Monitor termasuk perangkat keluaran, bukan masukan.'),
(27, 3, 'Fungsi utama protokol TCP/IP dalam jaringan komputer adalah…', 'Mengatur dan mengelola pengiriman data antarkomputer', 'TCP/IP adalah dasar komunikasi antar komputer di jaringan.'),
(28, 3, 'Topologi jaringan yang semua perangkat terhubung ke satu kabel utama disebut…', 'Topologi bus', 'Topologi bus menggunakan satu jalur utama untuk komunikasi.'),
(29, 3, 'Kemampuan komputer dalam melakukan berbagai pekerjaan secara bersamaan disebut…', 'Multitasking', 'Sistem operasi modern mendukung multitasking untuk efisiensi.'),
(30, 3, 'Pilih yang bukan merupakan keuntungan pemanfaatan jaringan komputer…', 'Mengurangi risiko kerusakan perangkat', 'Jaringan mempercepat komunikasi, tapi tidak mengurangi risiko kerusakan fisik.'),
(31, 4, 'Perjanjian Bongaya (1667) antara Kerajaan Gowa dan VOC menandai:', 'Awal kolonialisasi Belanda di Sulawesi Selatan', 'Terjadi setelah VOC menang atas Kerajaan Gowa di bawah Sultan Hasanuddin.'),
(32, 4, 'Dalam konteks perjuangan kemerdekaan Indonesia, peristiwa Rengasdengklok (1945) bertujuan untuk:', 'Memaksa Sukarno-Hatta segera memproklamasikan kemerdekaan', 'Pemuda mendesak Sukarno-Hatta agar tidak menunda proklamasi.'),
(33, 4, 'Tokoh yang memprakarsai Perjanjian Linggarjati (1947) adalah:', 'Sutan Sjahrir', 'Sjahrir menjadi tokoh diplomasi dalam perundingan awal dengan Belanda.'),
(34, 4, 'Masa pendudukan Jepang di Indonesia ditandai oleh kebijakan “Romusha”. Apa itu Romusha?', 'Kerja paksa rakyat Indonesia untuk proyek militer Jepang', 'Banyak rakyat dipaksa bekerja membangun infrastruktur militer.'),
(35, 4, 'Tujuan dibentuknya Organisasi Sumpah Pemuda pada 28 Oktober 1928 adalah:', 'Menyatukan pemuda Indonesia dalam satu tanah air, satu bangsa, dan satu bahasa', 'Sumpah Pemuda menjadi tonggak persatuan bangsa.'),
(36, 4, 'Dalam Revolusi Industri, mesin uap pertama kali diterapkan secara luas di bidang:', 'Tekstil dan pabrik manufaktur', 'Revolusi industri dimulai di Inggris di sektor tekstil.'),
(37, 4, 'Pemberontakan Diponegoro (1825–1830) terutama dipicu oleh:', 'Pajak yang tinggi dan campur tangan Belanda dalam urusan kerajaan', 'Konflik muncul karena tanah leluhur Pangeran Diponegoro diganggu.'),
(38, 4, 'Siapakah penulis Risalah “Indonesia Menggugat” yang mengkritik kolonial Belanda?', 'Douwes Dekker / Multatuli', 'Karya tersebut membuka mata dunia terhadap penderitaan rakyat Indonesia.'),
(39, 4, 'Trik diplomasi yang dilakukan Belanda melalui “Politik Etis” antara lain:', 'Pemberian pendidikan, irigasi, dan transmigrasi', 'Politik Etis dikenal juga sebagai “balas budi” bagi rakyat Hindia Belanda.'),
(40, 4, 'Dalam sejarah internasional, Perang Dunia I (1914–1918) dipicu oleh:', 'Pembunuhan Archduke Franz Ferdinand', 'Peristiwa pembunuhan di Sarajevo menjadi pemicu utama perang besar.'),
(41, 5, 'Gas rumah kaca utama yang menyebabkan pemanasan global adalah…', 'Karbon dioksida', 'Gas CO₂ meningkatkan efek rumah kaca di atmosfer.'),
(42, 5, 'Sebuah benda bermassa 3 kg diberi gaya 12 N. Percepatan benda tersebut adalah…', '4 m/s²', 'Gunakan hukum Newton II: F = m × a.'),
(43, 5, 'Organel sel yang berperan dalam sintesis protein adalah…', 'Ribosom', 'Ribosom berfungsi untuk menyusun asam amino menjadi protein.'),
(44, 5, 'Reaksi pengendapan dapat diamati ketika…', 'Dua larutan menghasilkan zat padat', 'Terjadi pembentukan endapan (precipitate).'),
(45, 5, 'Fotosintesis berlangsung di kloroplas. Salah satu faktor yang mempengaruhi laju fotosintesis adalah…', 'Intensitas cahaya', 'Semakin tinggi cahaya, semakin cepat reaksi fotosintesis hingga batas tertentu.'),
(46, 5, 'Jika larutan bersifat asam kuat, maka…', 'Terion seluruhnya', 'Asam kuat seperti HCl terurai sempurna dalam air.'),
(47, 5, 'Perbedaan utama fusi nuklir dan fisi nuklir adalah…', 'Fusi menggabungkan inti ringan, fisi membelah inti berat', 'Fusi terjadi di bintang; fisi digunakan pada PLTN.'),
(48, 5, 'Dalam ekosistem, konsumen tingkat pertama umumnya…', 'Herbivora', 'Herbivora memakan produsen seperti tumbuhan.'),
(49, 5, 'Hukum Newton pertama menyatakan…', 'Benda yang diam tetap diam, benda yang bergerak tetap bergerak lurus beraturan kecuali ada gaya luar', 'Disebut hukum kelembaman atau inersia.'),
(50, 5, 'Dalam percobaan Mendel, persilangan antara dua tanaman heterozigot (Aa × Aa) menghasilkan perbandingan genotipe…', '1:2:1', 'Genotipe: AA, Aa, Aa, aa.'),
(51, 6, 'Tujuan utama analisis SWOT dalam kewirausahaan adalah…', 'Mengidentifikasi kekuatan, kelemahan, peluang, dan ancaman', 'SWOT digunakan untuk menganalisis kondisi internal dan eksternal.'),
(52, 6, 'Produk kreatif dianggap layak dijual bila…', 'Memiliki nilai tambah dan diminati konsumen', 'Produk harus memiliki daya tarik pasar dan keunikan.'),
(53, 6, 'Salah satu ciri kewirausahaan adalah…', 'Inovatif dan kreatif', 'Ciri utama wirausaha adalah menciptakan hal baru yang bermanfaat.'),
(54, 6, 'Perbedaan utama antara koperasi dan perusahaan dagang adalah…', 'Koperasi dikelola untuk kepentingan anggota, perusahaan untuk mencari keuntungan', 'Koperasi berbasis keanggotaan, bukan semata laba.'),
(55, 6, 'Strategi pemasaran 4P terdiri dari…', 'Produk, Harga, Promosi, Tempat', 'Empat unsur dasar pemasaran: Product, Price, Promotion, Place.'),
(56, 6, 'Sumber modal internal bagi usaha kecil biasanya berasal dari…', 'Tabungan atau keuntungan sendiri', 'Modal internal berasal dari dana pribadi atau hasil usaha.'),
(57, 6, 'Contoh usaha kreatif berbasis ekonomi digital adalah…', 'Jasa titip online', 'Digitalisasi membuat model bisnis baru berbasis platform online.'),
(58, 6, 'Hak kekayaan intelektual yang melindungi desain produk disebut…', 'Desain Industri', 'Desain industri melindungi bentuk atau tampilan luar produk.'),
(59, 6, 'Salah satu indikator keberhasilan kewirausahaan adalah…', 'Memiliki inovasi, laba meningkat, dan kepuasan pelanggan', 'Indikator keberhasilan tidak hanya laba, tetapi juga kepuasan konsumen.'),
(60, 6, 'Penentuan harga jual suatu produk harus memperhatikan…', 'Harga bahan baku, biaya produksi, dan keuntungan', 'Harga jual harus menutup biaya dan memberi margin laba.'),
(61, 7, 'Bacalah cuplikan berikut:\n\"Hujan turun tanpa henti, membasahi bumi yang dahaga. Pepohonan menunduk, seolah menyambut air kehidupan.\"\nMajas yang dominan digunakan dalam cuplikan di atas adalah…', 'Personifikasi', 'Personifikasi memberikan sifat manusia pada benda mati.'),
(62, 7, 'Bacalah kalimat berikut:\n\"Dalam pidatonya, gubernur menekankan pentingnya pendidikan karakter sebagai fondasi kemajuan bangsa.\"\nFungsi kata “sebagai” dalam kalimat tersebut adalah…', 'Menyatakan peran / fungsi', 'Kata “sebagai” menjelaskan fungsi atau peran sesuatu.'),
(63, 7, 'Dari teks narasi, ciri penting yang membedakannya dengan teks eksposisi adalah…', 'Bersifat fiksi atau menceritakan peristiwa', 'Narasi menonjolkan unsur cerita, berbeda dengan eksposisi yang bersifat informatif.'),
(64, 7, 'Dalam puisi, penggunaan kata “pergi” diulang dalam beberapa bait untuk menekankan kesan kehilangan. Teknik ini disebut…', 'Repetisi', 'Repetisi adalah pengulangan kata atau frasa untuk penegasan makna.'),
(65, 7, 'Bacalah kutipan berikut:\n\"Setiap generasi memiliki tantangan sendiri, dan keberanian untuk menghadapi tantangan itu menentukan masa depan.\"\nTema utama yang bisa ditarik dari kutipan ini adalah…', 'Tantangan hidup dan keberanian', 'Kutipan menekankan pentingnya keberanian menghadapi tantangan.'),
(66, 7, 'Fungsi utama paragraf kesimpulan dalam teks argumentatif adalah…', 'Menyimpulkan argumen dan menegaskan posisi penulis', 'Paragraf kesimpulan menutup tulisan dengan penegasan posisi penulis.'),
(67, 7, 'Majas yang menekankan perbandingan tanpa menggunakan kata “seperti” atau “bagai” disebut…', 'Metafora', 'Metafora adalah perbandingan langsung tanpa kata pembanding.'),
(68, 7, 'Dalam teks eksposisi yang baik, struktur yang wajib ada adalah…', 'Pernyataan Tesis, Argumentasi, Penegasan', 'Struktur eksposisi terdiri dari tesis, argumentasi, dan penegasan ulang.'),
(69, 7, 'Seorang penulis menulis kalimat:\n\"Teknologi dapat menjadi pedang bermata dua; mempermudah hidup sekaligus menimbulkan kecanduan.\"\nJenis kalimat ini termasuk…', 'Eksposisi', 'Eksposisi menjelaskan ide atau fenomena secara informatif.'),
(70, 7, 'Dalam analisis teks sastra, “latar” mencakup…', 'Tempat, waktu, dan suasana terjadinya peristiwa', 'Latar menunjukkan di mana, kapan, dan dalam suasana apa peristiwa terjadi.'),
(71, 8, 'Read the passage and answer the question:\n\"Climate change is one of the most pressing issues of our time. Rising global temperatures affect ecosystems, agriculture, and human health. Governments worldwide are implementing policies to reduce carbon emissions and promote renewable energy sources.\"\n\nWhat is the main idea of the passage?', 'Climate change affects ecosystems, agriculture, and human health', 'The passage emphasizes the wide impact of climate change on life and environment.'),
(72, 8, 'Choose the best word to complete the sentence:\nThe scientist explained the experiment in a very _______ manner, so that everyone could understand.', 'comprehensible', '“Comprehensible” means easy to understand.'),
(73, 8, 'Identify the error in the sentence:\n\"Neither of the students were able to answer the difficult question.\"', 'were', 'The subject “Neither” is singular, so the correct verb is “was”.'),
(74, 8, 'Read the passage:\n\"Many cities are now adopting sustainable transportation systems, such as electric buses and bike-sharing programs, to reduce air pollution and traffic congestion.\"\n\nWhich statement is NOT true based on the passage?', 'Sustainable transport increases pollution', 'The passage explains that sustainable transport reduces pollution, not increases it.'),
(75, 8, 'Choose the correct phrasal verb to complete the sentence:\nThe manager asked me to _______ the report by Friday.', 'hand in', '“Hand in” means to submit something, like a report.'),
(76, 8, 'Read the dialogue:\nA: \"I heard the new library opens next week.\"\nB: \"Yes, it will be inaugurated by the mayor on Monday.\"\n\nThe word “inaugurated” most likely means…', 'Opened officially', '“Inaugurated” means formally opened or introduced.'),
(77, 8, 'Choose the correct sentence with reported speech:\nA: \"I will finish the project tomorrow,\" said Lisa.', 'Lisa said she would finish the project tomorrow', 'In reported speech, “will” changes to “would”.'),
(78, 8, 'Choose the word closest in meaning to “innovative”:', 'Creative', '“Innovative” means introducing new ideas; similar to “creative”.'),
(79, 8, 'Read the passage:\n\"Digital literacy is essential in the 21st century. Students must learn how to use technology safely, evaluate online sources critically, and create digital content responsibly.\"\n\nWhich skill is NOT mentioned as part of digital literacy?', 'Ignoring digital security', 'The passage emphasizes safety and responsibility, not ignoring them.'),
(80, 8, 'Choose the correct sentence with proper tense:\nBy the time she arrived, the meeting _______.', 'had started', 'Past perfect (“had started”) is used to show an earlier past event.');

-- --------------------------------------------------------

--
-- Table structure for table `tim_developer`
--

CREATE TABLE `tim_developer` (
  `id_tim` int NOT NULL,
  `nama_anggota` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  ADD KEY `id_kategori` (`id_kategori`),
  ADD KEY `id_soal` (`id_soal`);

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=521;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `soal`
--
ALTER TABLE `soal`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

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
  ADD CONSTRAINT `jawaban_asal_ibfk_1` FOREIGN KEY (`id_soal`) REFERENCES `soal` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `jawaban_asal_ibfk_2` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `soal`
--
ALTER TABLE `soal`
  ADD CONSTRAINT `soal_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
