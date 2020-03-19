-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.38-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for pbps
CREATE DATABASE IF NOT EXISTS `pbps` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `pbps`;

-- Dumping structure for table pbps.absensi
CREATE TABLE IF NOT EXISTS `absensi` (
  `Absensi` varchar(20) NOT NULL,
  `Mapel` varchar(50) NOT NULL,
  `Siswa` varchar(50) NOT NULL,
  `Tanggal` date NOT NULL,
  `Jam` time NOT NULL,
  KEY `FK_absensi_mapel` (`Mapel`),
  KEY `FK_absensi_siswa` (`Siswa`),
  CONSTRAINT `FK_absensi_mapel` FOREIGN KEY (`Mapel`) REFERENCES `mapel` (`Nama`) ON UPDATE NO ACTION,
  CONSTRAINT `FK_absensi_siswa` FOREIGN KEY (`Siswa`) REFERENCES `siswa` (`Nama`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table pbps.absensi: ~4 rows (approximately)
/*!40000 ALTER TABLE `absensi` DISABLE KEYS */;
INSERT INTO `absensi` (`Absensi`, `Mapel`, `Siswa`, `Tanggal`, `Jam`) VALUES
	('Ada', 'Matematika', 'Ilman M. Difa', '2020-03-19', '10:10:44'),
	('Tidak Ada', 'Matematika', 'Wildan Kusnaedi', '2020-03-20', '12:30:59'),
	('Ada', 'Pancasila', 'Rizki Maulana', '2020-01-19', '07:00:00'),
	('Tidak Ada', 'Bahasa', 'Fadil Fauzi S.', '2020-03-21', '09:00:00');
/*!40000 ALTER TABLE `absensi` ENABLE KEYS */;

-- Dumping structure for table pbps.guruajar
CREATE TABLE IF NOT EXISTS `guruajar` (
  `No. Induk` int(11) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `Wali` varchar(30) NOT NULL,
  PRIMARY KEY (`No. Induk`),
  KEY `Nama` (`Nama`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table pbps.guruajar: ~4 rows (approximately)
/*!40000 ALTER TABLE `guruajar` DISABLE KEYS */;
INSERT INTO `guruajar` (`No. Induk`, `Nama`, `Wali`) VALUES
	(1, 'danliw', 'A1'),
	(2, 'Nadliw', 'A2'),
	(3, 'Mega', 'B1'),
	(4, 'Doni', 'A3');
/*!40000 ALTER TABLE `guruajar` ENABLE KEYS */;

-- Dumping structure for table pbps.mapel
CREATE TABLE IF NOT EXISTS `mapel` (
  `Kode` int(5) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `Guru` varchar(50) NOT NULL,
  PRIMARY KEY (`Kode`),
  KEY `Nama` (`Nama`),
  KEY `FK_mapel_guruajar` (`Guru`),
  CONSTRAINT `FK_mapel_guruajar` FOREIGN KEY (`Guru`) REFERENCES `guruajar` (`Nama`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table pbps.mapel: ~4 rows (approximately)
/*!40000 ALTER TABLE `mapel` DISABLE KEYS */;
INSERT INTO `mapel` (`Kode`, `Nama`, `Guru`) VALUES
	(101, 'Matematika', 'danliw'),
	(503, 'Ekonomi', 'Nadliw'),
	(661, 'Bahasa', 'Mega'),
	(901, 'Pancasila', 'Doni');
/*!40000 ALTER TABLE `mapel` ENABLE KEYS */;

-- Dumping structure for table pbps.siswa
CREATE TABLE IF NOT EXISTS `siswa` (
  `NIS` int(11) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `Alamat` varchar(50) NOT NULL,
  `Kelas` varchar(30) NOT NULL,
  `Jenis Kelamin` varchar(50) NOT NULL,
  PRIMARY KEY (`NIS`),
  KEY `Nama` (`Nama`),
  KEY `Kelas` (`Kelas`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table pbps.siswa: ~4 rows (approximately)
/*!40000 ALTER TABLE `siswa` DISABLE KEYS */;
INSERT INTO `siswa` (`NIS`, `Nama`, `Alamat`, `Kelas`, `Jenis Kelamin`) VALUES
	(61, 'Wildan Kusnaedi', 'Bandung', 'A2', 'Laki'),
	(67, 'Rizki Maulana', 'Bandung', 'A2', 'Laki'),
	(72, 'Fadil Fauzi S.', 'Bandung', 'A2', 'Laki'),
	(100, 'Ilman M. Difa', 'Bandung', 'A2', 'Laki');
/*!40000 ALTER TABLE `siswa` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
