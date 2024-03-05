-- phpMyAdmin SQL Dump
-- version 5.2.1-1.el9
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 05, 2024 at 05:03 AM
-- Server version: 10.5.22-MariaDB
-- PHP Version: 8.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `igcdoc`
--

-- --------------------------------------------------------

--
-- Table structure for table `sd_helper`
--

CREATE TABLE `sd_helper` (
  `ID` int(5) NOT NULL,
  `title` varchar(255) NOT NULL,
  `doc_loc` text DEFAULT NULL,
  `created_by` int(5) NOT NULL,
  `created_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sd_helper`
--

INSERT INTO `sd_helper` (`ID`, `title`, `doc_loc`, `created_by`, `created_time`) VALUES
(4, 'Login', 'file.pdf', 1, '2024-03-05 04:01:47');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sd_helper`
--
ALTER TABLE `sd_helper`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sd_helper`
--
ALTER TABLE `sd_helper`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
