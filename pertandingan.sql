-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 05, 2022 at 03:26 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pertandingan`
--

-- --------------------------------------------------------

--
-- Table structure for table `hakim`
--

CREATE TABLE `hakim` (
  `idhakim` varchar(4) NOT NULL,
  `namahakim` varchar(30) NOT NULL,
  `password` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hakim`
--

INSERT INTO `hakim` (`idhakim`, `namahakim`, `password`) VALUES
('H001', 'Jimmy', '12345678'),
('H002', 'Toh', '12345678');

-- --------------------------------------------------------

--
-- Table structure for table `murid`
--

CREATE TABLE `murid` (
  `idmurid` varchar(4) NOT NULL,
  `namamurid` varchar(30) NOT NULL,
  `password` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `murid`
--

INSERT INTO `murid` (`idmurid`, `namamurid`, `password`) VALUES
('M001', 'Abu', '12345678'),
('M002', 'Chong', '12345678');

-- --------------------------------------------------------

--
-- Table structure for table `pasukan`
--

CREATE TABLE `pasukan` (
  `idpasukan` varchar(5) NOT NULL,
  `namapasukan` varchar(30) NOT NULL,
  `ketuapasukan` varchar(30) NOT NULL,
  `kelas` varchar(2) NOT NULL,
  `idhakim` varchar(4) NOT NULL,
  `idurusetia` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pasukan`
--

INSERT INTO `pasukan` (`idpasukan`, `namapasukan`, `ketuapasukan`, `kelas`, `idhakim`, `idurusetia`) VALUES
('PA001', 'Buaya', 'Lee', '5W', 'H001', 'U001'),
('PA002', 'Harimau', 'Jim', '4B', 'H001', 'U002'),
('PA003', 'Singa', 'Alex', '3P', 'H002', 'U001'),
('PA004', 'Serigala', 'Bryant', '2C', 'H002', 'U002');

-- --------------------------------------------------------

--
-- Table structure for table `pemarkahan`
--

CREATE TABLE `pemarkahan` (
  `idpemarkahan` varchar(6) NOT NULL,
  `bilanganperlawanan` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pemarkahan`
--

INSERT INTO `pemarkahan` (`idpemarkahan`, `bilanganperlawanan`) VALUES
('PEM001', 1),
('PEM002', 2),
('PEM003', 3);

-- --------------------------------------------------------

--
-- Table structure for table `pencapaian`
--

CREATE TABLE `pencapaian` (
  `idpemarkahan` varchar(6) NOT NULL,
  `idpasukan` varchar(5) NOT NULL,
  `kedudukan` int(2) NOT NULL,
  `kemenangan` varchar(10) NOT NULL,
  `jumlahmata` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pencapaian`
--

INSERT INTO `pencapaian` (`idpemarkahan`, `idpasukan`, `kedudukan`, `kemenangan`, `jumlahmata`) VALUES
('PEM001', 'PA001', 1, 'Menang', 3),
('PEM001', 'PA002', 2, 'Kalah', 2),
('PEM001', 'PA003', 3, 'Menang', 1),
('PEM001', 'PA004', 4, 'Kalah', 0),
('PEM002', 'PA001', 1, 'Menang', 3),
('PEM002', 'PA002', 2, 'Menang', 2),
('PEM002', 'PA003', 3, 'Kalah', 1),
('PEM002', 'PA004', 4, 'Kalah', 0),
('PEM003', 'PA001', 1, 'Menang', 3),
('PEM003', 'PA002', 2, 'Menang', 2),
('PEM003', 'PA003', 3, 'Kalah', 1),
('PEM003', 'PA004', 4, 'Kalah', 0);

-- --------------------------------------------------------

--
-- Table structure for table `urusetia`
--

CREATE TABLE `urusetia` (
  `idurusetia` varchar(4) NOT NULL,
  `namaurusetia` varchar(30) DEFAULT NULL,
  `password` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `urusetia`
--

INSERT INTO `urusetia` (`idurusetia`, `namaurusetia`, `password`) VALUES
('U001', 'Jacky', '12345678'),
('U002', 'Goh', '12345678');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hakim`
--
ALTER TABLE `hakim`
  ADD PRIMARY KEY (`idhakim`);

--
-- Indexes for table `murid`
--
ALTER TABLE `murid`
  ADD PRIMARY KEY (`idmurid`);

--
-- Indexes for table `pasukan`
--
ALTER TABLE `pasukan`
  ADD PRIMARY KEY (`idpasukan`),
  ADD KEY `idhakim` (`idhakim`),
  ADD KEY `idurusetia` (`idurusetia`);

--
-- Indexes for table `pemarkahan`
--
ALTER TABLE `pemarkahan`
  ADD PRIMARY KEY (`idpemarkahan`);

--
-- Indexes for table `pencapaian`
--
ALTER TABLE `pencapaian`
  ADD PRIMARY KEY (`idpemarkahan`,`idpasukan`),
  ADD KEY `idpasukan` (`idpasukan`),
  ADD KEY `idpemarkahan` (`idpemarkahan`);

--
-- Indexes for table `urusetia`
--
ALTER TABLE `urusetia`
  ADD PRIMARY KEY (`idurusetia`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pasukan`
--
ALTER TABLE `pasukan`
  ADD CONSTRAINT `pasukan_ibfk_1` FOREIGN KEY (`idurusetia`) REFERENCES `urusetia` (`idurusetia`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pasukan_ibfk_2` FOREIGN KEY (`idhakim`) REFERENCES `hakim` (`idhakim`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pencapaian`
--
ALTER TABLE `pencapaian`
  ADD CONSTRAINT `pencapaian_ibfk_1` FOREIGN KEY (`idpasukan`) REFERENCES `pasukan` (`idpasukan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pencapaian_ibfk_2` FOREIGN KEY (`idpemarkahan`) REFERENCES `pemarkahan` (`idpemarkahan`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
