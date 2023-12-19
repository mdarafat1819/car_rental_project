SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

-- Create Database
CREATE DATABASE IF NOT EXISTS car_rental;
USE car_rental;

-- To store car information
CREATE TABLE IF NOT EXISTS `cars` (
`car_id` int(20) NOT NULL,
  `car_name` varchar(50) NOT NULL,
  `car_nameplate` varchar(50) NOT NULL,
  `car_img` varchar(50) DEFAULT 'NA',
  `ac_price` float NOT NULL,
  `non_ac_price` float NOT NULL,
  `ac_price_per_day` float NOT NULL,
  `non_ac_price_per_day` float NOT NULL,
  `car_availability` varchar(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- Dumping data for table `cars`
INSERT INTO `cars` (`car_id`, `car_name`, `car_nameplate`, `car_img`, `ac_price`, `non_ac_price`, `ac_price_per_day`, `non_ac_price_per_day`, `car_availability`) VALUES
(1, 'Audi A4', 'GA3KA6969', 'assets/img/cars/audi-a4.jpg', 36, 26, 5200, 2600, 'yes'),
(2, 'Hyundai Creta', 'BA2CH2020', 'assets/img/cars/creta.jpg', 22, 12, 2900, 1400, 'yes'),
(3, 'BMW 6-Series', 'BA10PA5555', 'assets/img/cars/bmw6.jpg', 39, 30, 6950, 5999, 'yes'),
(4, 'Mercedes-Benz E-Class', 'BA10CH6009', 'assets/img/cars/mcec.jpg', 45, 30, 7200, 5200, 'yes'),
(5, 'Ford EcoSport', 'GA4PA2587', 'assets/img/cars/ecosport.png', 21, 13, 3890, 2600, 'yes');
-- Table structure for table `clientcars`
CREATE TABLE IF NOT EXISTS `clientcars` (
  `car_id` int(20) NOT NULL,
  `client_username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table `clientcars`
INSERT INTO `clientcars` (`car_id`, `client_username`) VALUES
(1, 'mdarafat1819'),
(2, 'mdarafat1819'),
(3, 'mdarafat1819'),
(4, 'mdarafat1819'),
(5, 'mdarafat1819');

-- Table structure for table `clients`
CREATE TABLE IF NOT EXISTS `clients` (
  `client_username` varchar(50) NOT NULL,
  `client_name` varchar(50) NOT NULL,
  `client_phone` varchar(15) NOT NULL,
  `client_email` varchar(25) NOT NULL,
  `client_address` varchar(50) NOT NULL,
  `client_password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table `clients`
INSERT INTO `clients` (`client_username`, `client_name`, `client_phone`, `client_email`, `client_address`, `client_password`) 
VALUES
('mdarafat1819','Yeasin Arafat','01795100243','mdarafat1819@gmail.com','Hatia, Noakhali, Bangladesh','1234');

-- Table structure for table `customers`
CREATE TABLE IF NOT EXISTS `customers` (
  `customer_username` varchar(50) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `customer_phone` varchar(15) NOT NULL,
  `customer_email` varchar(25) NOT NULL,
  `customer_address` varchar(50) NOT NULL,
  `customer_password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table `customers`

INSERT INTO `customers` (`customer_username`, `customer_name`, `customer_phone`, `customer_email`, `customer_address`, `customer_password`) 
VALUES
('mridul16','Mizanur Rahaman','01795100243','mridul16@gmail.com','Eswardi,Mymensingh,Bangladesh','1234');

-- Table structure for table `driver`
CREATE TABLE IF NOT EXISTS `driver` (
`driver_id` int(20) NOT NULL,
  `driver_name` varchar(50) NOT NULL,
  `dl_number` varchar(50) NOT NULL,
  `driver_phone` varchar(15) NOT NULL,
  `driver_address` varchar(50) NOT NULL,
  `driver_gender` varchar(10) NOT NULL,
  `client_username` varchar(50) NOT NULL,
  `driver_availability` varchar(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Dumping data for table `driver`
INSERT INTO `driver` (`driver_id`, `driver_name`, `dl_number`, `driver_phone`, `driver_address`, `driver_gender`, `client_username`, `driver_availability`) VALUES
(1, 'Mamlot Ali','27840218658','01795100243','Chapai Nawabganj,Bangladesh','Male','mdarafat1819','yes'),
(2,'Rabita Islam','03191563155','01518752623','Abainagar, Jessore, Bangladesh','Female','mdarafat1819','yes');

-- Table structure for table `feedback`
CREATE TABLE IF NOT EXISTS `feedback` (
  `name` varchar(20) NOT NULL,
  `e_mail` varchar(30) NOT NULL,
  `message` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table `feedback`
INSERT INTO `feedback` (`name`, `e_mail`, `message`) VALUES
('mridul16', 'mridul16@gmail.com', 'Hope this works.');


-- Table structure for table `rentedcars`
CREATE TABLE IF NOT EXISTS `rentedcars` (
`id` int(100) NOT NULL,
  `customer_username` varchar(50) NOT NULL,
  `car_id` int(20) NOT NULL,
  `driver_id` int(20) NOT NULL,
  `booking_date` date NOT NULL,
  `rent_start_date` date NOT NULL,
  `rent_end_date` date NOT NULL,
  `car_return_date` date DEFAULT NULL,
  `fare` double NOT NULL,
  `charge_type` varchar(25) NOT NULL DEFAULT 'days',
  `distance` double DEFAULT NULL,
  `no_of_days` int(50) DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `return_status` varchar(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=574681260 DEFAULT CHARSET=utf8;

-- Dumping data for table `rentedcars`

INSERT INTO `rentedcars` (`id`, `customer_username`, `car_id`, `driver_id`, `booking_date`, `rent_start_date`, `rent_end_date`, `car_return_date`, `fare`, `charge_type`, `distance`, `no_of_days`, `total_amount`, `return_status`) VALUES
(1, 'mridul16', 1, 2, '2023-07-18', '2023-07-01', '2023-07-02', '2023-07-18', 11, 'km', 244, 1, 5884, 'R');

-- Indexes for dumped tables
-- Indexes for table `cars`
ALTER TABLE `cars`
 ADD PRIMARY KEY (`car_id`), ADD UNIQUE KEY `car_nameplate` (`car_nameplate`);

-- Indexes for table `clientcars`
ALTER TABLE `clientcars`
 ADD PRIMARY KEY (`car_id`), ADD KEY `client_username` (`client_username`);
-- Indexes for table `clients`
ALTER TABLE `clients`
 ADD PRIMARY KEY (`client_username`);
-- Indexes for table `customers`
ALTER TABLE `customers`
 ADD PRIMARY KEY (`customer_username`);
-- Indexes for table `driver`
ALTER TABLE `driver`
 ADD PRIMARY KEY (`driver_id`), ADD UNIQUE KEY `dl_number` (`dl_number`), ADD KEY `client_username` (`client_username`);
-- Indexes for table `rentedcars`
ALTER TABLE `rentedcars`
 ADD PRIMARY KEY (`id`), ADD KEY `customer_username` (`customer_username`), ADD KEY `car_id` (`car_id`), ADD KEY `driver_id` (`driver_id`);

-- AUTO_INCREMENT for dumped tables
-- AUTO_INCREMENT for table `cars`
ALTER TABLE `cars`
MODIFY `car_id` int(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;

-- AUTO_INCREMENT for table `driver`
ALTER TABLE `driver`
MODIFY `driver_id` int(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;

-- AUTO_INCREMENT for table `rentedcars`
ALTER TABLE `rentedcars`
MODIFY `id` int(100) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=574681260;

-- Constraints for dumped tables
-- Constraints for table `clientcars`
--
ALTER TABLE `clientcars`
ADD CONSTRAINT `clientcars_ibfk_1` FOREIGN KEY (`client_username`) REFERENCES `clients` (`client_username`),
ADD CONSTRAINT `clientcars_ibfk_2` FOREIGN KEY (`car_id`) REFERENCES `cars` (`car_id`);

-- Constraints for table `driver`
ALTER TABLE `driver`
ADD CONSTRAINT `driver_ibfk_1` FOREIGN KEY (`client_username`) REFERENCES `clients` (`client_username`);

-- Constraints for table `rentedcars`
ALTER TABLE `rentedcars`
ADD CONSTRAINT `rentedcars_ibfk_1` FOREIGN KEY (`customer_username`) REFERENCES `customers` (`customer_username`),
ADD CONSTRAINT `rentedcars_ibfk_2` FOREIGN KEY (`car_id`) REFERENCES `cars` (`car_id`),
ADD CONSTRAINT `rentedcars_ibfk_3` FOREIGN KEY (`driver_id`) REFERENCES `driver` (`driver_id`);