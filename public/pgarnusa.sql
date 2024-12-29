-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table pagarnusa.akun
CREATE TABLE IF NOT EXISTS `akun` (
  `id_akun` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `level` enum('admin','wasit') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `hp` int NOT NULL,
  `aktif` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pin` int NOT NULL,
  PRIMARY KEY (`id_akun`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table pagarnusa.akun: ~0 rows (approximately)

-- Dumping structure for table pagarnusa.detailtgr
CREATE TABLE IF NOT EXISTS `detailtgr` (
  `id_detail` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_tanding` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_peserta` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mulai` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `selesai` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tutup` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `waktu` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_detail`),
  KEY `id_tanding` (`id_tanding`),
  KEY `id_peserta` (`id_peserta`),
  CONSTRAINT `FK_detailtgr_pesertatgr` FOREIGN KEY (`id_peserta`) REFERENCES `pesertatgr` (`id_peserta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_detailtgr_tandingtgr` FOREIGN KEY (`id_tanding`) REFERENCES `tandingtgr` (`id_tanding`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table pagarnusa.detailtgr: ~0 rows (approximately)

-- Dumping structure for table pagarnusa.hukuman
CREATE TABLE IF NOT EXISTS `hukuman` (
  `id_hukuman` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_tanding` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_peserta` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_user` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `babak` int NOT NULL,
  `skor` int NOT NULL,
  `ket` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `waktu` datetime NOT NULL,
  PRIMARY KEY (`id_hukuman`),
  KEY `id_peserta` (`id_peserta`),
  KEY `id_tanding` (`id_tanding`),
  CONSTRAINT `hukuman_ibfk_1` FOREIGN KEY (`id_peserta`) REFERENCES `peserta` (`id_peserta`),
  CONSTRAINT `hukuman_ibfk_2` FOREIGN KEY (`id_tanding`) REFERENCES `tanding` (`id_tanding`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table pagarnusa.hukuman: ~36 rows (approximately)

-- Dumping structure for table pagarnusa.jurus
CREATE TABLE IF NOT EXISTS `jurus` (
  `id_jurus` int NOT NULL AUTO_INCREMENT,
  `nomor` int DEFAULT '0',
  `nama` varchar(50) DEFAULT NULL,
  `jumlah` int DEFAULT NULL,
  `urut` int DEFAULT NULL,
  PRIMARY KEY (`id_jurus`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table pagarnusa.jurus: ~14 rows (approximately)
INSERT INTO `jurus` (`id_jurus`, `nomor`, `nama`, `jumlah`, `urut`) VALUES
	(1, 1, 'Tangan Kosong', 7, 1),
	(2, 2, 'Tangan Kosong', 6, 2),
	(3, 3, 'Tangan Kosong', 5, 3),
	(4, 4, 'Tangan Kosong', 7, 4),
	(5, 5, 'Tangan Kosong', 6, 5),
	(6, 6, 'Tangan Kosong', 8, 6),
	(7, 7, 'Tangan Kosong', 11, 7),
	(8, 1, 'Golok', 7, 8),
	(9, 2, 'Golok', 6, 9),
	(10, 3, 'Golok', 12, 10),
	(11, 1, 'Tongkat', 6, 11),
	(12, 2, 'Tongkat', 5, 12),
	(13, 3, 'Tongkat', 5, 13),
	(14, 4, 'Tongkat', 9, 14);

-- Dumping structure for table pagarnusa.jurus_pakai
CREATE TABLE IF NOT EXISTS `jurus_pakai` (
  `id_pakai` int NOT NULL AUTO_INCREMENT,
  `id_tanding` varchar(50) NOT NULL,
  `urut` int NOT NULL DEFAULT '0',
  `id_peserta` varchar(50) NOT NULL,
  `id_wasit` varchar(50) NOT NULL,
  PRIMARY KEY (`id_pakai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table pagarnusa.jurus_pakai: ~53 rows (approximately)

-- Dumping structure for table pagarnusa.nilai
CREATE TABLE IF NOT EXISTS `nilai` (
  `id_nilai` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_tanding` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_wasit` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_peserta` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `babak` int NOT NULL,
  `skor` int NOT NULL,
  `ket` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `waktu` time NOT NULL,
  `timer` bigint NOT NULL,
  `status` enum('proses','gagal','pakai') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_nilai`),
  KEY `id_peserta` (`id_peserta`),
  KEY `id_tanding` (`id_tanding`),
  KEY `id_wasit` (`id_wasit`),
  CONSTRAINT `nilai_ibfk_1` FOREIGN KEY (`id_peserta`) REFERENCES `peserta` (`id_peserta`),
  CONSTRAINT `nilai_ibfk_2` FOREIGN KEY (`id_tanding`) REFERENCES `tanding` (`id_tanding`),
  CONSTRAINT `nilai_ibfk_3` FOREIGN KEY (`id_wasit`) REFERENCES `wasit` (`id_wasit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table pagarnusa.nilai: ~82 rows (approximately)

-- Dumping structure for table pagarnusa.nilaitgr1
CREATE TABLE IF NOT EXISTS `nilaitgr1` (
  `id_nilai` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_tanding` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_wasit` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_peserta` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `skor` double NOT NULL DEFAULT '0',
  `ket` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `kode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_nilai`) USING BTREE,
  KEY `id_peserta` (`id_peserta`) USING BTREE,
  KEY `id_tanding` (`id_tanding`) USING BTREE,
  KEY `id_wasit` (`id_wasit`) USING BTREE,
  CONSTRAINT `FK_nilaittgr1_pesertatgr` FOREIGN KEY (`id_peserta`) REFERENCES `pesertatgr` (`id_peserta`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_nilaittgr1_tandingtgr` FOREIGN KEY (`id_tanding`) REFERENCES `tandingtgr` (`id_tanding`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table pagarnusa.nilaitgr1: ~0 rows (approximately)

-- Dumping structure for table pagarnusa.nilaitgr1_fix
CREATE TABLE IF NOT EXISTS `nilaitgr1_fix` (
  `id_nilai` int NOT NULL AUTO_INCREMENT,
  `id_tanding` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_wasit` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_peserta` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `skor` double NOT NULL DEFAULT '0',
  `juri` int NOT NULL DEFAULT '0',
  `ket` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_nilai`) USING BTREE,
  KEY `id_peserta` (`id_peserta`) USING BTREE,
  KEY `id_tanding` (`id_tanding`) USING BTREE,
  KEY `id_wasit` (`id_wasit`) USING BTREE,
  CONSTRAINT `nilaitgr1_fix_ibfk_1` FOREIGN KEY (`id_peserta`) REFERENCES `pesertatgr` (`id_peserta`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `nilaitgr1_fix_ibfk_2` FOREIGN KEY (`id_tanding`) REFERENCES `tandingtgr` (`id_tanding`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table pagarnusa.nilaitgr1_fix: ~114 rows (approximately)

-- Dumping structure for table pagarnusa.nilai_fix
CREATE TABLE IF NOT EXISTS `nilai_fix` (
  `id_nilai` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_tanding` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_peserta` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `babak` int NOT NULL,
  `skor` int NOT NULL,
  `ket` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `waktu` time NOT NULL,
  PRIMARY KEY (`id_nilai`),
  KEY `id_peserta` (`id_peserta`),
  KEY `id_tanding` (`id_tanding`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table pagarnusa.nilai_fix: ~2 rows (approximately)

-- Dumping structure for table pagarnusa.partai
CREATE TABLE IF NOT EXISTS `partai` (
  `id_partai` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `urut` int NOT NULL,
  `babak` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `merah` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `biru` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tanggal` date NOT NULL,
  PRIMARY KEY (`id_partai`),
  KEY `merah` (`merah`),
  KEY `biru` (`biru`),
  CONSTRAINT `partai_ibfk_1` FOREIGN KEY (`merah`) REFERENCES `peserta` (`id_peserta`),
  CONSTRAINT `partai_ibfk_2` FOREIGN KEY (`biru`) REFERENCES `peserta` (`id_peserta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table pagarnusa.partai: ~0 rows (approximately)

-- Dumping structure for table pagarnusa.partaitgr
CREATE TABLE IF NOT EXISTS `partaitgr` (
  `id_partai` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `urut` int NOT NULL,
  `babak` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `merah` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `biru` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tanggal` date NOT NULL,
  `jenis` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_partai`) USING BTREE,
  KEY `merah` (`merah`) USING BTREE,
  KEY `biru` (`biru`) USING BTREE,
  CONSTRAINT `FK_partaitgr_pesertatgr` FOREIGN KEY (`merah`) REFERENCES `pesertatgr` (`id_peserta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_partaitgr_pesertatgr_2` FOREIGN KEY (`biru`) REFERENCES `pesertatgr` (`id_peserta`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table pagarnusa.partaitgr: ~0 rows (approximately)

-- Dumping structure for table pagarnusa.peserta
CREATE TABLE IF NOT EXISTS `peserta` (
  `id_peserta` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `kategori` enum('USIA DINI','PRA REMAJA','REMAJA','DEWASA') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `kontingen` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tgl` date NOT NULL,
  `jkl` enum('Laki-laki','Perempuan') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `kelas` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `berat` int NOT NULL,
  `pelatih` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `hp` int NOT NULL,
  `foto` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_peserta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table pagarnusa.peserta: ~4 rows (approximately)
INSERT INTO `peserta` (`id_peserta`, `kategori`, `kontingen`, `nama`, `tgl`, `jkl`, `kelas`, `berat`, `pelatih`, `hp`, `foto`) VALUES
	('40f3feb3-2004-44dc-929e-ec4e2b835c21', 'REMAJA', 'Perguruan Macan Putih', 'Muhammad Maulana Akbar', '2024-12-10', 'Laki-laki', 'A', 32, 'sf', 78, ''),
	('58af0661-86ae-4622-82d8-c62be71288a5', 'DEWASA', 'Tapak Suci', 'Ahmad Albar', '2024-12-14', 'Laki-laki', 'A', 12, 'PL', 99, ''),
	('6d5ad855-2150-4eb2-81bf-8b7917d293d4', 'REMAJA', 'Tapak Suci', 'Hasim', '2024-12-10', 'Laki-laki', 'A', 20, 'Ok', 998, ''),
	('991182e9-aa1f-48b2-9739-9a9fd917aec7', 'DEWASA', 'Harimau Sumatra', 'Satria Amansyah', '2024-12-14', 'Laki-laki', 'A', 12, 'Ust', 9, '');

-- Dumping structure for table pagarnusa.pesertatgr
CREATE TABLE IF NOT EXISTS `pesertatgr` (
  `id_peserta` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `kategori` enum('USIA DINI','PRA REMAJA','REMAJA','DEWASA') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `kontingen` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tgl` date NOT NULL,
  `jkl` enum('Laki-laki','Perempuan') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `kelas` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `berat` int NOT NULL,
  `pelatih` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `hp` int NOT NULL,
  `foto` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_peserta`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table pagarnusa.pesertatgr: ~14 rows (approximately)
INSERT INTO `pesertatgr` (`id_peserta`, `kategori`, `kontingen`, `nama`, `tgl`, `jkl`, `kelas`, `berat`, `pelatih`, `hp`, `foto`) VALUES
	('106c1cb6-4c33-4ce5-a8a9-4a39338dad35', 'PRA REMAJA', 'Satria Muda', 'Andi Prasetyo', '2005-06-12', 'Laki-laki', 'Tunggal', 55, 'Budi Santoso', 2147483647, ''),
	('26e8f0e8-8d31-4b15-851b-b213390547c7', 'PRA REMAJA', 'Badai Biru', 'Indra Wijaya', '2004-09-09', 'Laki-laki', 'Tunggal', 64, 'Yoga Santoso', 2147483647, ''),
	('27a9d871-001b-42b6-84d5-ffbc99e7609f', 'PRA REMAJA', 'Tapak Suci', 'Faisal Ramdani', '2003-12-05', 'Laki-laki', 'Tunggal', 65, 'Joko Priyono', 2147483647, ''),
	('29a11dab-d052-4748-874a-b6fe0f1f5d18', 'PRA REMAJA', 'Naga Putih', 'Deni Kurniawan', '2005-02-18', 'Laki-laki', 'Tunggal', 62, 'Ahmad Fauzi', 2147483647, ''),
	('366481ac-adf1-4efb-b17c-2b184146b177', 'PRA REMAJA', 'Garuda Perkasa', 'Gilang Permana', '2004-03-22', 'Laki-laki', 'Tunggal', 57, 'Arif Kurniawan', 2147483647, ''),
	('3bd9a5f5-bdd3-463a-a5e0-8bd43ec0ac96', 'PRA REMAJA', 'Sapu jagat raya', 'Ahmd Aditya Ramadhan', '2024-12-04', 'Laki-laki', 'Tunggal', 43, 'dfsd', 445464, ''),
	('3ed1c9ae-b1f8-4912-b8f0-1addcb368868', 'PRA REMAJA', 'Harimau Hitam', 'Bayu Ramadhan', '2003-08-25', 'Laki-laki', 'Tunggal', 63, 'Agus Wijaya', 2147483647, ''),
	('71f304e7-7fc0-4d48-986f-d9251f98caa0', 'PRA REMAJA', 'Rajawali Emas', 'Heri Susanto', '2005-01-30', 'Laki-laki', 'Tunggal', 56, 'Wahyu Hidayat', 2147483647, ''),
	('8234d10f-c106-4ab8-9d03-442d40004e9b', 'PRA REMAJA', 'macan Putih', 'Adio Manasila Rinjaki', '2024-12-04', 'Laki-laki', 'Tunggal', 21, 'dfsd', 445464, ''),
	('922884a7-3ade-4627-8a79-5ad825d65fe4', 'PRA REMAJA', 'Elang Hitam', 'Joko Suryanto', '2003-05-16', 'Laki-laki', 'Tunggal', 61, 'Rudy Hartono', 2147483647, ''),
	('a50fc3cb-b060-4f93-bb8c-684e402b1680', 'PRA REMAJA', 'Mawar Merah', 'Candra Irawan', '2004-11-15', 'Laki-laki', 'Tunggal', 58, 'Eko Saputra', 2147483647, ''),
	('a77c4dae-28a2-4252-a1dc-052a65474d6e', 'USIA DINI', 'sdfgg', 'ABDULLAH MUNIR', '2024-12-04', 'Laki-laki', 'Tunggal', 443, 'dfsd', 44534, ''),
	('ed61ad3d-5892-4946-b1d1-e58720378c88', 'USIA DINI', 'sdfg', 'ABDUL WAFI', '2024-12-04', 'Laki-laki', 'Tunggal', 21, 'dfsd', 445464, ''),
	('f21b3fdc-0aa8-453f-b82c-d2940105e8c7', 'PRA REMAJA', 'Pendekar Nusantara', 'Eko Saputra', '2004-07-10', 'Laki-laki', 'Tunggal', 60, 'Herman Kusuma', 2147483647, '');

-- Dumping structure for table pagarnusa.settings
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `value` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table pagarnusa.settings: ~1 rows (approximately)
INSERT INTO `settings` (`id`, `name`, `value`) VALUES
	(1, 'socket', 'ws://192.168.1.5:8081');

-- Dumping structure for table pagarnusa.tanding
CREATE TABLE IF NOT EXISTS `tanding` (
  `id_tanding` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_partai` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `wasit` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `juri1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `juri2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `juri3` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `juri4` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `juri5` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` enum('belum','berjalan','dijeda','selesai') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `aktif` enum('N','Y') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `gel` int NOT NULL,
  `babak` int NOT NULL,
  PRIMARY KEY (`id_tanding`),
  KEY `id_partai` (`id_partai`),
  KEY `wasit` (`wasit`),
  KEY `juri5` (`juri5`),
  KEY `juri1` (`juri1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table pagarnusa.tanding: ~0 rows (approximately)

-- Dumping structure for table pagarnusa.tandingtgr
CREATE TABLE IF NOT EXISTS `tandingtgr` (
  `id_tanding` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_partai` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `wasit` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `juri1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `juri2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `juri3` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `juri4` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `juri5` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` enum('belum','berjalan','dijeda','selesai') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `aktif` enum('N','Y') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `gel` int NOT NULL,
  `babak` int NOT NULL,
  PRIMARY KEY (`id_tanding`) USING BTREE,
  KEY `id_partai` (`id_partai`) USING BTREE,
  KEY `wasit` (`wasit`) USING BTREE,
  KEY `juri5` (`juri5`) USING BTREE,
  KEY `juri1` (`juri1`) USING BTREE,
  KEY `juri2` (`juri2`),
  KEY `juri3` (`juri3`),
  KEY `juri4` (`juri4`),
  CONSTRAINT `FK_tandingtgr_partaitgr` FOREIGN KEY (`id_partai`) REFERENCES `partaitgr` (`id_partai`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_tandingtgr_wasit` FOREIGN KEY (`wasit`) REFERENCES `wasit` (`id_wasit`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table pagarnusa.tandingtgr: ~0 rows (approximately)

-- Dumping structure for table pagarnusa.user
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` varchar(100) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` enum('admin','dewan') NOT NULL,
  `aktif` enum('Y','T') NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table pagarnusa.user: ~2 rows (approximately)
INSERT INTO `user` (`id_user`, `nama`, `username`, `password`, `level`, `aktif`) VALUES
	('889sd8y98ygsf', 'Dewan Admin', 'dewan', '$2y$10$Hvt9.C62/W.i5F4RhfB7PuGu0FVgTPlRj1oY/bFWjS.iF8xPbkJ5C', 'dewan', 'Y'),
	('ksldhf979832h7adfiugd', 'Aminiadat', 'admin', '$2y$10$WWlhp6T2EuL5U4g9wOSpwOXNFnYXhotZq5o1dcrLoZce/oteBZI9m', 'admin', 'Y');

-- Dumping structure for table pagarnusa.verifikasi
CREATE TABLE IF NOT EXISTS `verifikasi` (
  `id_verifikasi` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_tanding` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `jenis` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` enum('proses','selesai') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_verifikasi`),
  KEY `id_tanding` (`id_tanding`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table pagarnusa.verifikasi: ~0 rows (approximately)

-- Dumping structure for table pagarnusa.verifikasi_detail
CREATE TABLE IF NOT EXISTS `verifikasi_detail` (
  `id_vd` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_verifikasi` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_wasit` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pilihan` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_vd`),
  KEY `id_verifikasi` (`id_verifikasi`),
  KEY `id_wasit` (`id_wasit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table pagarnusa.verifikasi_detail: ~0 rows (approximately)

-- Dumping structure for table pagarnusa.wasit
CREATE TABLE IF NOT EXISTS `wasit` (
  `id_wasit` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `hp` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `pin` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` enum('N','Y') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_wasit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table pagarnusa.wasit: ~5 rows (approximately)
INSERT INTO `wasit` (`id_wasit`, `nama`, `alamat`, `hp`, `pin`, `status`) VALUES
	('3a29b6f2-1a3d-4c0e-9f43-a62b3b47b7f6', 'Budi Prasetyo', 'Jl. Kenanga No. 10', '081345678901', '582431', 'N'),
	('7c1824d5-91e0-4bd7-8381-4c3edc9f8d56', 'Candra Wijaya', 'Jl. Melati No. 3', '081456789012', '126789', 'N'),
	('c9f9a2d1-3f0e-4e45-8a3b-9a8c3e01c4b7', 'Agus Setiawan', 'Jl. Merpati No. 5', '081234567890', '914563', 'N'),
	('d7b0c0b8-a3f2-4a8f-9e25-63e2ab1fbd2a', 'Dedi Susanto', 'Jl. Mawar No. 7', '081567890123', '358247', 'N'),
	('f34e1b74-33f1-41c7-baa9-8e4123f843ec', 'Eko Kurniawan', 'Jl. Anggrek No. 9', '081678901234', '674182', 'N');

-- Dumping structure for table pagarnusa.winner
CREATE TABLE IF NOT EXISTS `winner` (
  `id_winner` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_tanding` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_peserta` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_winner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table pagarnusa.winner: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
