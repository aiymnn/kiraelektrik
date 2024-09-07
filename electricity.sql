-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 07, 2024 at 11:50 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `electricity`
--

-- --------------------------------------------------------

--
-- Table structure for table `electricity_calculation`
--

CREATE TABLE `electricity_calculation` (
  `id` int(11) NOT NULL,
  `hours` int(11) DEFAULT NULL,
  `energy` decimal(10,5) DEFAULT NULL,
  `total_charge` float(5,2) DEFAULT NULL,
  `calculation_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `electricity_calculation`
--

INSERT INTO `electricity_calculation` (`id`, `hours`, `energy`, `total_charge`, `calculation_time`) VALUES
(1, 1, 0.06156, 0.10, '2024-09-07 08:41:57'),
(2, 2, 0.12312, 0.03, '2024-09-07 08:42:33'),
(3, 3, 0.18468, 0.04, '2024-09-07 08:46:59'),
(4, 4, 0.24624, 0.05, '2024-09-07 08:47:18'),
(5, 5, 0.30780, 0.07, '2024-09-07 08:47:23'),
(6, 6, 0.36936, 0.08, '2024-09-07 08:47:32'),
(7, 7, 0.43092, 0.09, '2024-09-07 08:47:35'),
(8, 8, 0.49248, 0.11, '2024-09-07 08:47:38'),
(9, 9, 0.55404, 0.12, '2024-09-07 08:47:41'),
(10, 10, 0.61560, 0.13, '2024-09-07 08:47:53'),
(11, 11, 0.67716, 0.15, '2024-09-07 08:50:08'),
(12, 12, 0.73872, 0.16, '2024-09-07 08:50:32'),
(13, 13, 0.80028, 0.17, '2024-09-07 08:50:36'),
(14, 14, 0.86184, 0.19, '2024-09-07 08:50:39'),
(15, 15, 0.92340, 0.20, '2024-09-07 08:50:42'),
(16, 16, 0.98496, 0.21, '2024-09-07 08:50:51'),
(17, 17, 1.04652, 0.23, '2024-09-07 08:50:54'),
(18, 18, 1.10808, 0.24, '2024-09-07 08:50:57'),
(19, 19, 1.16964, 0.25, '2024-09-07 08:51:00'),
(20, 20, 1.23120, 0.27, '2024-09-07 08:51:05'),
(21, 21, 1.29276, 0.28, '2024-09-07 08:51:07'),
(22, 22, 1.35432, 0.30, '2024-09-07 08:51:14'),
(23, 23, 1.41588, 0.31, '2024-09-07 08:51:18'),
(24, 24, 1.47744, 0.32, '2024-09-07 08:51:24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `electricity_calculation`
--
ALTER TABLE `electricity_calculation`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `electricity_calculation`
--
ALTER TABLE `electricity_calculation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
