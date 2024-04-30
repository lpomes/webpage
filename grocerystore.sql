-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 30, 2024 at 10:16 PM
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
-- Database: `grocerystore`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cartID` int(11) NOT NULL,
  `customerID` int(11) DEFAULT NULL,
  `productID` int(11) DEFAULT NULL,
  `Qty` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cartID`, `customerID`, `productID`, `Qty`) VALUES
(6, 1, 3, 5),
(7, 1, 12, 5),
(8, 1, 18, 1),
(9, 1, 24, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryID` int(11) NOT NULL,
  `foodCategory` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryID`, `foodCategory`) VALUES
(1, 'Vegetable'),
(2, 'Fruit'),
(3, 'Meat'),
(4, 'Dairy'),
(5, 'Seafood');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customerID` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT 'NoName',
  `address` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customerID`, `username`, `user_password`, `name`, `address`) VALUES
(1, 'lgpomes', '123456789', 'Luke', '123 North Peoria'),
(2, 'lgpomes', 'LGP60423l', 'Lukas', 'Los Angeles Drive'),
(3, 'Rwestbrook', 'clipperS101', 'Russell', 'Los Angeles Drive'),
(4, 'Rwestbrook', 'clipperS101', 'Russell', 'Los Angeles Drive'),
(5, 'jacob2', '123456fkdslfjF', 'Jacob', '948 North Fredonia'),
(6, 'jacob2', '123456fkdslfjF', 'Jacob', '948 North Fredonia'),
(7, 'jacob2', '123456fkdslfjF', 'Jacob', '948 North Fredonia'),
(8, 'jacob2', '123456fkdslfjF', 'Jacob', '948 North Fredonia'),
(9, 'znelson', 'ChiBulls123', 'Zach', '543 Lincoln Drive'),
(10, 'znelson', 'ChiBulls123', 'Zach', '543 Lincoln Drive'),
(11, 'znelson', 'ChiBulls123', 'Zach', '543 Lincoln Drive'),
(12, 'Jmurphy', 'ChiCubsFan101', 'Jack', '239 Oak Park Lane'),
(13, 'adavis', 'Aa123456789', 'Anthony', '234 East View Drive'),
(14, 'bobsburgers', 'Superman101', 'Bob', '843 Oakland Street'),
(15, 'frybox', 'fryboxH123', 'Frybox', 'frybox street '),
(16, 'Pmahomes', 'Kstate2019', 'Patrick', '432 Kansas St'),
(17, 'Jbutler', 'MiamiHeat2014', 'Jimmy', '892 North Drive'),
(18, 'Bbonds', 'Giants2024', 'Barry', '326 Seashore Drive'),
(19, 'Fthomas', 'Bighurt2000', 'Frank', '295 South Side St');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `productID` int(11) NOT NULL,
  `categoryID` int(11) DEFAULT NULL,
  `productName` varchar(50) DEFAULT 'undefined',
  `price` decimal(7,2) NOT NULL,
  `productImage` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productID`, `categoryID`, `productName`, `price`, `productImage`) VALUES
(3, 2, 'Bananas', 1.30, 'foods/banana.jpg'),
(5, 2, 'Apple', 1.25, 'foods/apple.png'),
(6, 2, 'Watermelon', 7.00, 'foods/watermelon.jpeg'),
(7, 2, 'Orange', 1.05, 'foods/orange.jpg'),
(8, 2, 'Mango', 1.52, 'foods/mango.png'),
(9, 1, 'Carrot', 0.34, 'foods/carrot.jpg'),
(10, 1, 'Lettuce', 1.99, 'foods/lettuce.png'),
(11, 1, 'Onion', 0.86, 'foods/onion.jpg'),
(12, 1, 'Potato', 0.86, 'foods/potato.png'),
(13, 1, 'Tomato', 0.37, 'foods/tomato.png'),
(14, 3, 'Bacon Slices', 4.99, 'foods/bacon.png'),
(15, 3, 'Chicken Breast', 4.49, 'foods/chicken.jpg'),
(16, 3, 'undefined', 6.99, 'foods/groundbeef.jpg'),
(17, 3, 'Pork Loin', 2.99, 'foods/pork.png'),
(18, 3, 'Steak', 15.00, 'foods/steak.png'),
(19, 4, 'Slab of Butter', 2.49, 'foods/butter.jpg'),
(20, 4, 'Blocks of Cheese', 5.59, 'foods/cheese.png'),
(21, 4, 'Gallon of Milk', 2.57, 'foods/milk.jpg'),
(22, 4, 'Sour Cream', 1.35, 'foods/sourcream.png'),
(23, 4, 'Greek Yogurt Parfait', 1.24, 'foods/yogurt.png'),
(24, 5, 'Crab Legs', 17.42, 'foods/crableg.png'),
(25, 5, 'Fresh Salmon', 7.99, 'foods/salmon.jpg'),
(26, 5, 'Scallops', 8.21, 'foods/scallop.jpg'),
(27, 5, 'Raw Shrimp ', 6.73, 'foods/shrimp.jpg'),
(28, 5, 'Trout Fillet', 19.99, 'foods/trout.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cartID`),
  ADD KEY `customerID` (`customerID`),
  ADD KEY `productID` (`productID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productID`),
  ADD KEY `categoryID` (`categoryID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cartID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `categoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `productID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`categoryID`) REFERENCES `category` (`categoryID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
