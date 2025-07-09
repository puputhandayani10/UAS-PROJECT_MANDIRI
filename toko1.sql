-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 09 Jul 2025 pada 20.56
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko1`
--

DELIMITER $$
--
-- Prosedur
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertBarang` (IN `kd` CHAR(10), IN `nm` NVARCHAR(50), IN `hrg` INT, IN `stk` INT)  BEGIN
  INSERT INTO barang (kode, nama, harga, stok) 
  VALUES (kd, nm, hrg, stk);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `kode` char(10) NOT NULL,
  `nama` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`kode`, `nama`, `harga`, `stok`) VALUES
('1990', 'Indomie', 10000, 90);

--
-- Trigger `barang`
--
DELIMITER $$
CREATE TRIGGER `logInsertBarang` AFTER INSERT ON `barang` FOR EACH ROW BEGIN
  INSERT INTO log_insert_barang (kode, waktu)
  VALUES (NEW.kode, DATE_FORMAT(NOW(), '%Y-%m-%d %H:%i:%s'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_insert_barang`
--

CREATE TABLE `log_insert_barang` (
  `kode` char(10) DEFAULT NULL,
  `waktu` char(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `log_insert_barang`
--

INSERT INTO `log_insert_barang` (`kode`, `waktu`) VALUES
('1990', '2025-07-10 01:38:17');

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_barang`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_barang` (
`kode` char(10)
,`nama` varchar(50)
,`harga` int(11)
,`stok` int(11)
,`total_nilai` bigint(21)
);

-- --------------------------------------------------------

--
-- Struktur untuk view `view_barang`
--
DROP TABLE IF EXISTS `view_barang`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_barang`  AS  select `barang`.`kode` AS `kode`,`barang`.`nama` AS `nama`,`barang`.`harga` AS `harga`,`barang`.`stok` AS `stok`,(`barang`.`harga` * `barang`.`stok`) AS `total_nilai` from `barang` ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`kode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
