-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 27, 2021 at 06:08 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dental`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `ID` int(5) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`ID`, `username`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `app_ID` int(11) NOT NULL,
  `user_ID` int(3) UNSIGNED NOT NULL,
  `treatment_ID` int(11) DEFAULT 1,
  `date` date NOT NULL,
  `time` varchar(20) NOT NULL,
  `deposit` int(11) NOT NULL DEFAULT 1,
  `receipt_number` varchar(50) DEFAULT NULL,
  `receipt_url` varchar(50) DEFAULT NULL,
  `deposit_amount` float(10,2) NOT NULL DEFAULT 0.00,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`app_ID`, `user_ID`, `treatment_ID`, `date`, `time`, `deposit`, `receipt_number`, `receipt_url`, `deposit_amount`, `status`) VALUES
(135, 48, 1, '2021-05-26', 'morning', 2, 'ca8hh9hx', 'https://dev.toyyibpay.com/ca8hh9hx', 50.00, 3),
(136, 48, 3, '2021-06-02', 'morning', 2, 'ebl3qgg9', 'https://dev.toyyibpay.com/ebl3qgg9', 50.00, 3),
(138, 35, 6, '2021-05-28', 'evening', 1, '5x74vvx7', 'https://dev.toyyibpay.com/5x74vvx7', 50.00, 3),
(140, 41, 1, '2021-05-27', 'morning', 2, '9bm6nmm7', 'https://dev.toyyibpay.com/9bm6nmm7', 50.00, 2),
(141, 36, 3, '2021-05-29', 'Morning', 2, 'ft53mofo', 'https://dev.toyyibpay.com/ft53mofo', 50.00, 1),
(142, 46, 3, '2021-05-27', 'morning', 2, '5zgr619g', 'https://dev.toyyibpay.com/5zgr619g', 50.00, 2),
(143, 40, 7, '2021-05-31', 'Morning', 1, '2v08ue0s', 'https://dev.toyyibpay.com/2v08ue0s', 50.00, 1),
(144, 40, 3, '2021-05-31', '9.00am', 2, '', 'https://dev.toyyibpay.com/', 50.00, 1),
(145, 40, 1, '2021-05-29', 'morning', 2, 'uhlp0jh1', 'https://dev.toyyibpay.com/uhlp0jh1', 50.00, 2),
(146, 48, 6, '2021-06-04', '11.00pm', 1, 'nqfsauq2', 'https://dev.toyyibpay.com/nqfsauq2', 50.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `bill_ID` int(11) NOT NULL,
  `app_ID` int(11) NOT NULL,
  `dr_name` varchar(50) NOT NULL,
  `medicine` text NOT NULL,
  `payment_ID` int(11) NOT NULL,
  `deposit` int(11) NOT NULL,
  `price` float NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dentist`
--

CREATE TABLE `dentist` (
  `dentist_ID` int(11) NOT NULL,
  `dr_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dentist`
--

INSERT INTO `dentist` (`dentist_ID`, `dr_name`) VALUES
(5, 'DR AUNI'),
(3, 'DR FAIRUZ'),
(2, 'DR FATIMAH'),
(4, 'DR HARIZ'),
(1, 'DR MANISAH');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `user_ID` int(3) UNSIGNED NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(60) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `IC` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `DOB` date DEFAULT NULL,
  `phoneNo` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`user_ID`, `username`, `password`, `fullname`, `IC`, `gender`, `DOB`, `phoneNo`, `email`, `address`) VALUES
(35, 'farhan', '$2y$10$VyFzmnyuzm.K4tPYdpGoh.wSHpyoMu2OZTxBY4gB/.bvaqf7fQOdG', 'muhammad farhan bin ishak', '860102015033', 'male', '1986-01-02', '0132341287', 'farhan32@yahoo.com', 'negeri sembilan'),
(36, 'hairul', '$2y$10$i3anHpp9v/CDO2ciV2JdV.KjMwAWcD9fb8lKIMxFL5T3tGc/NDLrK', 'muhd hairul', '980505055063', 'male', '1998-05-05', '0162361527', 'hairul@gmail.com', 'perak'),
(40, 'amirah', '$2y$10$dIs8bUSZcySOZ6wEH5AQIuDpgSeKWr3.GWVBrTLi8RlC59vnEZKiy', 'nurul amirah binti hassan', '970701055002', 'female', '1999-11-09', '0198234817', 'amirah@gmail.com', 'melaka'),
(41, 'hanee', '$2y$10$XWtazbEymVjdbUYh6zIh9eSoGjLRZOcTC3V6NSgg7NZyBCT0fqaiu', 'nur hanee binti zainudin', '970601055032', 'female', '1997-10-02', '0176251782', 'hanee41@yahoo.com', 'selangor'),
(42, 'maisarah', '$2y$10$.yKrE/4g4G4HIVvdYqKT3.cmsKILOPb4b0o2xssFWDzoGEfgifGum', 'siti maisarah binti sulaiman', '970605055983', 'female', '1997-11-10', '01926718273', 'maisarah@gmail.com', ' No.5, Jalan Mutiara, Taman Mutiara,, Balai Panjang 75250 Melaka, Melaka, 75250 Melaka'),
(43, 'azzan', '$2y$10$6Oyeve/XIborQig4/gJ/HurbJAiuVZy8YgpaX0TkhJCaDp.HAOAEO', 'azzan adlina binti muhd razali', '980506025032', 'female', '1998-03-06', '0178624152', 'azzan@gmail.com', 'melaka'),
(44, 'hana', '$2y$10$UbDmckRv8PZDuQ/i.jJ4qeyMigwJR8xgaRfXKsC7Yy3fSLhHNwq2S', 'Hannah Delisha', '931203055002', 'female', '1993-12-03', '0176532819', 'hana@gmail.com', 'pahang'),
(45, 'intan', '$2y$10$JC59SthNC4ViTZjt9SkoLOODou68SnKescoao0xBzGp96TH6KDpay', 'nur intan syafinaz binti bazli', '970514045032', 'female', '1997-05-14', '0123456726', 'intan@gmail.com', 'LOT 148,. JALAN HAJI SUPI,. KG SALAK TINGGI. 43900 SEPANG. SELANGOR'),
(46, 'syahid', '$2y$10$tkmyOpnYiIumkNosEGTkuu9EHWfTVsCY6PWfEGfGxiCvrHOxMshve', 'Muhd Syahid Bin Nazri', '960606055060', 'male', '1996-12-24', '0172516279', 'syahid32@gmail.com', 'No 208, Blok 1, Jalan 1/9 Seksyen 1 43650 Bandar Baru Bangi, Selangor'),
(48, 'aishah', '$2y$10$/sIXlWXJGFfS7..3j1pFHuLWLBBaUe86VA0rT2O9UghHvM1Al7Lmy', 'nurul aishah binti rosli', '970701055002', 'female', '1997-07-01', '0135267182', 'aishah@gmail.com', 'no.468 jalan anggerik, felda palong 2, gemas, negeri sembilan');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_ID` int(11) NOT NULL,
  `app_ID` int(11) NOT NULL,
  `deposit` float NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `ID` int(5) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`ID`, `username`, `password`) VALUES
(1, 'staff', 'staff');

-- --------------------------------------------------------

--
-- Table structure for table `treatment`
--

CREATE TABLE `treatment` (
  `treatment_ID` int(11) UNSIGNED NOT NULL,
  `treatment_name` varchar(100) NOT NULL,
  `fees` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `treatment`
--

INSERT INTO `treatment` (`treatment_ID`, `treatment_name`, `fees`) VALUES
(1, 'crown and bridge              ', 800),
(2, 'denture ', 700),
(3, 'extraction ', 200),
(4, 'filling ', 150),
(5, 'orthodontics ', 5000),
(6, 'scalling ', 200),
(8, 'veneer ', 1500),
(7, 'whitening ', 1000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`app_ID`);

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`bill_ID`),
  ADD UNIQUE KEY `bill_ID` (`bill_ID`),
  ADD KEY `app_ID` (`app_ID`),
  ADD KEY `dr_name` (`dr_name`),
  ADD KEY `payment_ID` (`payment_ID`);

--
-- Indexes for table `dentist`
--
ALTER TABLE `dentist`
  ADD PRIMARY KEY (`dentist_ID`),
  ADD KEY `dr_name` (`dr_name`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`user_ID`),
  ADD KEY `user_ID` (`user_ID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_ID`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `treatment`
--
ALTER TABLE `treatment`
  ADD PRIMARY KEY (`treatment_name`),
  ADD KEY `treatment_ID` (`treatment_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `app_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `bill_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dentist`
--
ALTER TABLE `dentist`
  MODIFY `dentist_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `user_ID` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `treatment`
--
ALTER TABLE `treatment`
  MODIFY `treatment_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `appID_fk` FOREIGN KEY (`app_ID`) REFERENCES `appointment` (`app_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`dr_name`) REFERENCES `dentist` (`dr_name`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
