-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 07, 2024 at 04:18 PM
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
-- Database: `travel`
--

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

CREATE TABLE `bus` (
  `bus_id` int(11) NOT NULL,
  `bus_name` varchar(100) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bus`
--

INSERT INTO `bus` (`bus_id`, `bus_name`, `model`, `company_id`) VALUES
(1, 'Hafiv', 'volvo', 3),
(2, 'Nabil', 'Scania', 1),
(3, 'Alam', 'volvo', 1),
(4, 'SR', 'sarkar', 1),
(5, 'Hanif Scania', 'Scania', 3);

-- --------------------------------------------------------

--
-- Table structure for table `bus_ticket`
--

CREATE TABLE `bus_ticket` (
  `t_id` int(11) NOT NULL,
  `passenger_id` int(11) DEFAULT NULL,
  `bus_id` int(11) DEFAULT NULL,
  `journey_date` date DEFAULT NULL,
  `seat_no` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bus_ticket`
--

INSERT INTO `bus_ticket` (`t_id`, `passenger_id`, `bus_id`, `journey_date`, `seat_no`) VALUES
(1, 1, 3, '0000-00-00', 'A3'),
(2, 2, 3, '0000-00-00', 'A4'),
(3, 3, 3, '0000-00-00', 'A8'),
(4, 4, 3, '0000-00-00', 'B4');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `contact` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `name`, `city`, `contact`) VALUES
(1, 'SR Group', 'Dhaka', '809347939'),
(2, 'Karim Group', 'Faridpur', '5783938393'),
(3, 'Hanif Travel', 'Dhaka', '57933038303');

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `d_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `license_no` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `bus_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`d_id`, `name`, `phone`, `license_no`, `city`, `bus_id`) VALUES
(1, 'Habib', '739383930', 'A13839338', 'Dhaka', 1),
(2, 'Kamal', '13930303933', 'A2292002', 'Barishal', 2),
(3, 'Nabab', '3839383023', 'A2384343', 'Rajshahi', 5),
(4, 'Jamal', '284932002', 'BA383929', 'Dhaka', 4);

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE `passenger` (
  `p_id` int(11) NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `gender` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `passenger`
--

INSERT INTO `passenger` (`p_id`, `first_name`, `last_name`, `gender`, `email`, `phone`) VALUES
(1, 'nasir', 'Hossain', 'male', 'nasir@gamil.com', '383933383'),
(2, 'azim', 'Uddin', 'male', 'azim@gamail.com', '3439930334930'),
(3, 'bina', 'Kabir', 'female', 'bina@gamil.com', '38393030339'),
(4, 'aslam', 'Khan', 'male', 'aslam@gamil.com', '379330024839');

-- --------------------------------------------------------

--
-- Stand-in structure for view `passenger_view`
-- (See below for the actual view)
--
CREATE TABLE `passenger_view` (
`Name` varchar(201)
,`email` varchar(50)
,`phone` varchar(15)
);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `passenger_id` int(11) DEFAULT NULL,
  `bus_id` int(11) DEFAULT NULL,
  `amount` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `passenger_id`, `bus_id`, `amount`) VALUES
(1, 4, 2, 500.00),
(2, 2, 1, 500.00);

-- --------------------------------------------------------

--
-- Structure for view `passenger_view`
--
DROP TABLE IF EXISTS `passenger_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `passenger_view`  AS SELECT concat(`passenger`.`first_name`,' ',`passenger`.`last_name`) AS `Name`, `passenger`.`email` AS `email`, `passenger`.`phone` AS `phone` FROM `passenger` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`bus_id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `bus_ticket`
--
ALTER TABLE `bus_ticket`
  ADD PRIMARY KEY (`t_id`),
  ADD KEY `bus_id` (`bus_id`),
  ADD KEY `passenger_id` (`passenger_id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`d_id`),
  ADD KEY `bus_id` (`bus_id`);

--
-- Indexes for table `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `passenger_id` (`passenger_id`),
  ADD KEY `bus_id` (`bus_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bus`
--
ALTER TABLE `bus`
  MODIFY `bus_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `bus_ticket`
--
ALTER TABLE `bus_ticket`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `driver`
--
ALTER TABLE `driver`
  MODIFY `d_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `passenger`
--
ALTER TABLE `passenger`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bus`
--
ALTER TABLE `bus`
  ADD CONSTRAINT `bus_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`);

--
-- Constraints for table `bus_ticket`
--
ALTER TABLE `bus_ticket`
  ADD CONSTRAINT `bus_ticket_ibfk_1` FOREIGN KEY (`bus_id`) REFERENCES `bus` (`bus_id`),
  ADD CONSTRAINT `bus_ticket_ibfk_2` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`p_id`);

--
-- Constraints for table `driver`
--
ALTER TABLE `driver`
  ADD CONSTRAINT `driver_ibfk_1` FOREIGN KEY (`bus_id`) REFERENCES `bus` (`bus_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`p_id`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`bus_id`) REFERENCES `bus` (`bus_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
