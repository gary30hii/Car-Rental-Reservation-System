-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 25, 2023 at 11:37 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `COMP1044_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `StaffID` int(10) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `StaffName` varchar(255) NOT NULL,
  `Position` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`StaffID`, `Username`, `Password`, `StaffName`, `Position`) VALUES
(2, 'gary30hii', '1234asdf', 'Gary', 'Boss'),
(8, 'calebb', 'asdf1234', 'Caleb', 'Supervisor'),
(9, 'kingth000', 'asdf1234', 'King Teck Huai', 'Supervisor'),
(10, 'junhao', 'asdf1234', 'Jun Hao', 'Supervisor'),
(11, 'admin1', 'asdf1234', 'staff a', 'Staff');

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `CarID` int(10) NOT NULL,
  `CarModel` varchar(255) NOT NULL,
  `CarType` int(10) NOT NULL,
  `RentalPrice` decimal(10,2) NOT NULL,
  `Color` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`CarID`, `CarModel`, `CarType`, `RentalPrice`, `Color`) VALUES
(1, 'Rolls Royce Phantom', 1, '9800.00', 'Blue'),
(2, 'Bentley Continental Flying Spur', 1, '4800.00', 'White'),
(3, 'Mercedes Benz CLS 350', 1, '1350.00', 'Silver'),
(4, 'Jaguar S Type', 1, '1350.00', 'Champagne'),
(5, 'Ferrari F430 Scuderia', 2, '6000.00', 'Red'),
(6, 'Lamborghini Murcielago LP640', 2, '7000.00', 'Matte Black'),
(7, 'Porsche Boxster', 2, '2800.00', 'White'),
(8, 'Lexus SC430', 2, '1600.00', 'Black'),
(9, 'Jaguar MK 2', 3, '2200.00', 'White'),
(10, 'Rolls Royce Silver Spirit Limousine', 3, '3200.00', 'Georgian Silver'),
(11, 'MG TD', 3, '2500.00', 'Red');

-- --------------------------------------------------------

--
-- Table structure for table `car_types`
--

CREATE TABLE `car_types` (
  `TypeID` int(10) NOT NULL,
  `CarTypes` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `car_types`
--

INSERT INTO `car_types` (`TypeID`, `CarTypes`) VALUES
(1, 'Luxurious Car'),
(2, 'Sports Car'),
(3, 'Classics Car');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `CustomerID` int(10) NOT NULL,
  `CustomerName` varchar(255) NOT NULL,
  `CustomerEmail` varchar(255) NOT NULL,
  `CustomerPhoneNumber` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`CustomerID`, `CustomerName`, `CustomerEmail`, `CustomerPhoneNumber`) VALUES
(42, 'User 1', 'user1@email.com', '1234567890'),
(43, 'User 2', 'user2@email.com', '0987654321'),
(44, 'User 3', 'user3@email.com', '1234509876'),
(45, 'User 4', 'user4@email.com', '0987612345');

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `ReservationID` int(10) NOT NULL,
  `StaffID` int(10) NOT NULL,
  `CustomerID` int(10) NOT NULL,
  `CarID` int(10) NOT NULL,
  `ReservationDate` date NOT NULL,
  `RentalDays` int(10) NOT NULL,
  `TotalPrice` decimal(10,2) NOT NULL,
  `PickUpDate` date NOT NULL,
  `DropOffDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`ReservationID`, `StaffID`, `CustomerID`, `CarID`, `ReservationDate`, `RentalDays`, `TotalPrice`, `PickUpDate`, `DropOffDate`) VALUES
(32, 2, 42, 2, '2023-04-25', 2, '9600.00', '2023-04-29', '2023-04-30'),
(33, 2, 43, 3, '2023-04-25', 15, '20250.00', '2023-05-05', '2023-05-19'),
(34, 2, 44, 4, '2023-04-25', 4, '5400.00', '2023-05-11', '2023-05-14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`StaffID`);

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`CarID`),
  ADD KEY `CarType` (`CarType`);

--
-- Indexes for table `car_types`
--
ALTER TABLE `car_types`
  ADD PRIMARY KEY (`TypeID`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`ReservationID`),
  ADD KEY `CustomerID` (`CustomerID`),
  ADD KEY `CarID` (`CarID`),
  ADD KEY `StaffID` (`StaffID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `StaffID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `CarID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `car_types`
--
ALTER TABLE `car_types`
  MODIFY `TypeID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `CustomerID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `ReservationID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `cars_ibfk_1` FOREIGN KEY (`CarType`) REFERENCES `car_types` (`TypeID`);

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`),
  ADD CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`CarID`) REFERENCES `cars` (`CarID`),
  ADD CONSTRAINT `reservations_ibfk_3` FOREIGN KEY (`StaffID`) REFERENCES `admins` (`StaffID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
