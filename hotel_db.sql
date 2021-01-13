-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 13, 2021 at 03:26 PM
-- Server version: 5.7.24
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `ospiti`
--

CREATE TABLE `ospiti` (
  `osp_id` int(11) NOT NULL,
  `osp_nome` varchar(30) NOT NULL,
  `osp_cognome` varchar(50) NOT NULL,
  `osp_data_nascita` date NOT NULL,
  `osp_doc_identità` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospiti`
--

INSERT INTO `ospiti` (`osp_id`, `osp_nome`, `osp_cognome`, `osp_data_nascita`, `osp_doc_identità`) VALUES
(1, 'John', 'Doe', '1975-01-12', 'Carta d\'Identità'),
(2, 'Jane', 'Doe', '1980-03-11', 'Patente');

-- --------------------------------------------------------

--
-- Table structure for table `prenotazioni`
--

CREATE TABLE `prenotazioni` (
  `st_id` int(11) NOT NULL,
  `osp_id` int(11) NOT NULL,
  `pren_check_in` datetime NOT NULL,
  `pren_check_out` datetime NOT NULL,
  `pren_mod_pagamento` varchar(50) NOT NULL,
  `pren_codice` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `prenotazioni`
--

INSERT INTO `prenotazioni` (`st_id`, `osp_id`, `pren_check_in`, `pren_check_out`, `pren_mod_pagamento`, `pren_codice`) VALUES
(1, 2, '2021-01-01 16:10:42', '2021-01-14 16:10:42', 'Carta di Credito', 'XB589677'),
(2, 1, '2021-01-02 16:11:35', '2021-01-18 16:11:35', 'Contanti', 'XS896532');

-- --------------------------------------------------------

--
-- Table structure for table `stanze`
--

CREATE TABLE `stanze` (
  `st_id` int(11) NOT NULL,
  `st_numero_camera` smallint(6) NOT NULL,
  `st_num_letti` smallint(6) NOT NULL,
  `st_climatizzatore` tinyint(4) DEFAULT NULL,
  `st_vista` varchar(30) DEFAULT NULL,
  `st_tv` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stanze`
--

INSERT INTO `stanze` (`st_id`, `st_numero_camera`, `st_num_letti`, `st_climatizzatore`, `st_vista`, `st_tv`) VALUES
(1, 101, 2, 0, 'Lago', 0),
(2, 102, 3, 1, 'Interna', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ospiti`
--
ALTER TABLE `ospiti`
  ADD PRIMARY KEY (`osp_id`);

--
-- Indexes for table `prenotazioni`
--
ALTER TABLE `prenotazioni`
  ADD PRIMARY KEY (`st_id`,`osp_id`),
  ADD UNIQUE KEY `pren_codice` (`pren_codice`),
  ADD KEY `osp_id` (`osp_id`),
  ADD KEY `st_id` (`st_id`);

--
-- Indexes for table `stanze`
--
ALTER TABLE `stanze`
  ADD PRIMARY KEY (`st_id`),
  ADD UNIQUE KEY `st_numero_camera` (`st_numero_camera`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ospiti`
--
ALTER TABLE `ospiti`
  MODIFY `osp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stanze`
--
ALTER TABLE `stanze`
  MODIFY `st_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `prenotazioni`
--
ALTER TABLE `prenotazioni`
  ADD CONSTRAINT `prenotazioni_ibfk_1` FOREIGN KEY (`st_id`) REFERENCES `stanze` (`st_id`),
  ADD CONSTRAINT `prenotazioni_ibfk_2` FOREIGN KEY (`osp_id`) REFERENCES `ospiti` (`osp_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
