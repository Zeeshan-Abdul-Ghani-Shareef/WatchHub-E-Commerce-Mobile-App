-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2024 at 02:01 PM
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
-- Database: `watchhub`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `BrandID` int(10) UNSIGNED NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Description` varchar(100) NOT NULL,
  `Image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`BrandID`, `Name`, `Description`, `Image`) VALUES
(1, 'Rolex', 'High-end Swiss luxury watches.', 'assets\\icons\\brands\\rolex.jpg'),
(2, 'Casio', 'Affordable and durable watches.', 'assets\\icons\\brands\\Casio.png'),
(3, 'Omega', 'Luxury watches with timeless designs.', 'assets\\icons\\brands\\Omega.png'),
(4, 'Fossil', 'Trendy and stylish watches.', 'assets\\icons\\brands\\Fossil.jpg'),
(5, 'Seiko', 'Precision-engineered Japanese watches.', 'assets\\icons\\brands\\Seiko.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `CatID` int(10) UNSIGNED NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Description` varchar(100) NOT NULL,
  `Image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`CatID`, `Name`, `Description`, `Image`) VALUES
(1, 'Men', 'Watches designed for men', 'assets\\images\\categories\\men-watch.jpg'),
(2, 'Women', 'Watches designed for women', 'assets\\images\\categories\\women-watch.png'),
(3, 'Boy', 'Watches designed for boys', 'assets\\images\\categories\\boy-watch.jpg'),
(4, 'Girl', 'Watches designed for Boys', 'assets\\images\\categories\\girl-watch.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `checkout`
--

CREATE TABLE `checkout` (
  `CheckoutID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `CartID` int(11) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `Address` text NOT NULL,
  `City` varchar(100) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `TotalAmount` decimal(10,2) NOT NULL,
  `PaymentStatus` enum('Pending','Completed','Failed') NOT NULL DEFAULT 'Pending',
  `CheckoutTimestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_log`
--

CREATE TABLE `inventory_log` (
  `LogID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Action` varchar(50) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ProductID` int(11) NOT NULL,
  `Title` varchar(100) NOT NULL,
  `Description` text NOT NULL,
  `Image` varchar(255) DEFAULT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Quantity` int(11) NOT NULL CHECK (`Quantity` >= 0),
  `CategoryID` int(10) UNSIGNED NOT NULL,
  `BrandID` int(10) UNSIGNED NOT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ProductID`, `Title`, `Description`, `Image`, `Price`, `Quantity`, `CategoryID`, `BrandID`, `CreatedAt`) VALUES
(1, 'Rolex Submariner', 'Iconic luxury diving watch for men.', 'rolex_men1.jpg', 800000.00, 5, 1, 1, '2024-11-16 23:19:53'),
(2, 'Rolex Daytona', 'Chronograph luxury watch.', 'rolex_men2.jpg', 850000.00, 5, 1, 1, '2024-11-16 23:19:53'),
(3, 'Casio G-Shock', 'Durable and rugged digital watch.', 'casio_men1.jpg', 20000.00, 10, 1, 2, '2024-11-16 23:19:53'),
(4, 'Casio Edifice', 'Sophisticated analog-digital watch.', 'casio_men2.jpg', 25000.00, 10, 1, 2, '2024-11-16 23:19:53'),
(5, 'Omega Seamaster', 'Luxury diving watch.', 'omega_men1.jpg', 700000.00, 5, 1, 3, '2024-11-16 23:19:53'),
(6, 'Omega Speedmaster', 'Iconic chronograph watch.', 'omega_men2.jpg', 750000.00, 5, 1, 3, '2024-11-16 23:19:53'),
(7, 'Fossil Gen 5', 'Trendy smartwatch for men.', 'fossil_men1.jpg', 30000.00, 25, 1, 4, '2024-11-16 23:19:53'),
(8, 'Fossil Nate', 'Rugged men’s watch.', 'fossil_men2.jpg', 35000.00, 20, 1, 4, '2024-11-16 23:19:53'),
(9, 'Seiko 5', 'Automatic watch for men.', 'seiko_men1.jpg', 40000.00, 15, 1, 5, '2024-11-16 23:19:53'),
(10, 'Seiko Presage', 'Elegant men’s watch.', 'seiko_men2.jpg', 50000.00, 12, 1, 5, '2024-11-16 23:19:53'),
(11, 'Rolex Lady-Datejust', 'Elegant luxury watch for women.', 'rolex_women1.jpg', 700000.00, 5, 2, 1, '2024-11-16 23:21:23'),
(12, 'Rolex Pearlmaster', 'High-end luxury watch for women.', 'rolex_women2.jpg', 900000.00, 4, 2, 1, '2024-11-16 23:21:23'),
(13, 'Casio Baby-G', 'Stylish and durable watch for active women.', 'casio_women1.jpg', 15000.00, 12, 2, 2, '2024-11-16 23:21:23'),
(14, 'Casio Sheen', 'Sophisticated analog watch for women.', 'casio_women2.jpg', 25000.00, 8, 2, 2, '2024-11-16 23:21:23'),
(15, 'Omega De Ville', 'Luxury watch with a classic look for women.', 'omega_women1.jpg', 750000.00, 6, 2, 3, '2024-11-16 23:21:23'),
(16, 'Omega Constellation', 'Luxury ladies watch with diamond accents.', 'omega_women2.jpg', 800000.00, 5, 2, 3, '2024-11-16 23:21:23'),
(17, 'Fossil Jacqueline', 'Chic and elegant leather strap watch for women.', 'fossil_women1.jpg', 15000.00, 20, 2, 4, '2024-11-16 23:21:23'),
(18, 'Fossil Riley', 'Stylish women’s watch with a polished look.', 'fossil_women2.jpg', 18000.00, 18, 2, 4, '2024-11-16 23:21:23'),
(19, 'Seiko Presage Cocktail Time', 'Elegant women’s watch with a cocktail-inspired design.', 'seiko_women1.jpg', 55000.00, 10, 2, 5, '2024-11-16 23:21:23'),
(20, 'Seiko Solar', 'Eco-friendly solar-powered women’s watch.', 'seiko_women2.jpg', 35000.00, 14, 2, 5, '2024-11-16 23:21:23'),
(21, 'Rolex Girl Datejust', 'Elegant luxury watch for girls.', 'rolex_girls1.jpg', 650000.00, 5, 3, 1, '2024-11-16 23:21:54'),
(22, 'Rolex Girl Oyster Perpetual', 'High-end luxury watch for girls.', 'rolex_girls2.jpg', 700000.00, 4, 3, 1, '2024-11-16 23:21:54'),
(23, 'Casio F91W-1', 'Simple and durable watch for girls.', 'casio_girls1.jpg', 5000.00, 15, 3, 2, '2024-11-16 23:21:54'),
(24, 'Casio Baby-G BG169R', 'Sporty and durable watch for girls.', 'casio_girls2.jpg', 8000.00, 10, 3, 2, '2024-11-16 23:21:54'),
(25, 'Omega Swatch x Omega MoonSwatch', 'Luxury watch with a playful design for girls.', 'omega_girls1.jpg', 800000.00, 6, 3, 3, '2024-11-16 23:21:54'),
(26, 'Omega De Ville Prestige', 'Sophisticated design for young girls.', 'omega_girls2.jpg', 750000.00, 5, 3, 3, '2024-11-16 23:21:54'),
(27, 'Fossil Minimalist', 'Stylish and minimalist watch for girls.', 'fossil_girls1.jpg', 12000.00, 18, 3, 4, '2024-11-16 23:21:54'),
(28, 'Fossil Vintage Glam', 'Vintage glam watch with a chic look for girls.', 'fossil_girls2.jpg', 15000.00, 20, 3, 4, '2024-11-16 23:21:54'),
(29, 'Seiko 5 Women’s', 'Classic automatic watch for girls.', 'seiko_girls1.jpg', 25000.00, 10, 3, 5, '2024-11-16 23:21:54'),
(30, 'Seiko Solar Femme', 'Eco-friendly solar-powered watch for girls.', 'seiko_girls2.jpg', 30000.00, 8, 3, 5, '2024-11-16 23:21:54'),
(31, 'Rolex Oyster Perpetual Boys', 'Classic luxury watch for boys.', 'rolex_boys1.jpg', 650000.00, 6, 4, 1, '2024-11-16 23:22:18'),
(32, 'Rolex Explorer Boys', 'Adventure-ready luxury watch for boys.', 'rolex_boys2.jpg', 700000.00, 5, 4, 1, '2024-11-16 23:22:18'),
(33, 'Casio G-Shock Boys', 'Rugged and durable watch for boys.', 'casio_boys1.jpg', 8000.00, 18, 4, 2, '2024-11-16 23:22:18'),
(34, 'Casio F91W Boys', 'Simple and durable watch for boys.', 'casio_boys2.jpg', 6000.00, 15, 4, 2, '2024-11-16 23:22:18'),
(35, 'Omega Seamaster Boys', 'Luxury diving watch for boys.', 'omega_boys1.jpg', 750000.00, 5, 4, 3, '2024-11-16 23:22:18'),
(36, 'Omega Speedmaster Boys', 'Iconic chronograph watch for boys.', 'omega_boys2.jpg', 800000.00, 4, 4, 3, '2024-11-16 23:22:18'),
(37, 'Fossil Boys Gen 5', 'Stylish smartwatch for boys.', 'fossil_boys1.jpg', 25000.00, 20, 4, 4, '2024-11-16 23:22:18'),
(38, 'Fossil Boys Nate', 'Rugged watch with leather strap for boys.', 'fossil_boys2.jpg', 18000.00, 25, 4, 4, '2024-11-16 23:22:18'),
(39, 'Seiko 5 Boys', 'Reliable and durable automatic watch for boys.', 'seiko_boys1.jpg', 25000.00, 12, 4, 5, '2024-11-16 23:22:18'),
(40, 'Seiko Presage Boys', 'Elegant boys’ watch with a refined design.', 'seiko_boys2.jpg', 35000.00, 10, 4, 5, '2024-11-16 23:22:18');

--
-- Triggers `products`
--
DELIMITER $$
CREATE TRIGGER `after_inventory_update` AFTER UPDATE ON `products` FOR EACH ROW BEGIN
    -- Check if the quantity has changed
    IF OLD.Quantity != NEW.Quantity THEN
        -- If quantity has increased (restocked), log the restocking event
        IF NEW.Quantity > OLD.Quantity THEN
            INSERT INTO inventory_log (ProductID, Action, Quantity)
            VALUES (NEW.ProductID, 'Restocked', NEW.Quantity - OLD.Quantity);
        -- If quantity has decreased, log the sold event
        ELSE
            INSERT INTO inventory_log (ProductID, Action, Quantity)
            VALUES (NEW.ProductID, 'Sold', OLD.Quantity - NEW.Quantity);
        END IF;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `ReviewID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Rating` decimal(3,2) DEFAULT NULL CHECK (`Rating` between 0 and 5),
  `Comment` text DEFAULT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shopping_cart`
--

CREATE TABLE `shopping_cart` (
  `CartID` int(11) NOT NULL,
  `UserID` int(11) UNSIGNED NOT NULL,
  `ProductID` int(11) UNSIGNED NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Total` decimal(10,2) NOT NULL,
  `Status` varchar(50) DEFAULT 'Pending',
  `OrderDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `PaymentStatus` varchar(50) DEFAULT 'Unpaid',
  `DateAdded` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `shopping_cart`
--
DELIMITER $$
CREATE TRIGGER `after_checkout` AFTER UPDATE ON `shopping_cart` FOR EACH ROW BEGIN
    -- Check if the status of the cart item has been updated to 'Ordered'
    IF NEW.Status = 'Ordered' AND OLD.Status != 'Ordered' THEN
        -- Log the purchase in the inventory_log table
        INSERT INTO inventory_log (ProductID, Action, Quantity)
        VALUES (NEW.ProductID, 'Purchased', NEW.Quantity);
        
        -- Update the product quantity in the Products table by reducing it from stock
        UPDATE Products
        SET Quantity = Quantity - NEW.Quantity
        WHERE ProductID = NEW.ProductID;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_add_to_cart` BEFORE INSERT ON `shopping_cart` FOR EACH ROW BEGIN
    -- Declare a variable to store available quantity in stock
    DECLARE available_quantity INT;
    
    -- Retrieve the current quantity of the product from the Products table
    SELECT Quantity INTO available_quantity
    FROM Products
    WHERE ProductID = NEW.ProductID;
    
    -- Check if the quantity being added to the cart exceeds the available stock
    IF available_quantity < NEW.Quantity THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Not enough stock available for this product.';
    END IF;
    
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) UNSIGNED NOT NULL,
  `Username` varchar(100) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Role` varchar(12) NOT NULL DEFAULT 'user',
  `Image` varchar(255) DEFAULT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `reset_token` varchar(255) DEFAULT NULL,
  `reset_token_expires` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `Username`, `Password`, `Email`, `Role`, `Image`, `CreatedAt`, `reset_token`, `reset_token_expires`) VALUES
(1, 'zeeshan', 'password123', 'Zeeahmed2001@gmail.com', 'user', NULL, '2024-11-17 22:43:42', NULL, NULL),
(2, 'user2', 'password123', 'user2@example.com', 'user', NULL, '2024-11-17 22:43:42', NULL, NULL),
(3, 'user3', 'password123', 'user3@example.com', 'user', NULL, '2024-11-17 22:43:42', NULL, NULL),
(4, 'user4', 'password123', 'user4@example.com', 'user', NULL, '2024-11-17 22:43:42', NULL, NULL),
(5, 'user5', 'password123', 'user5@example.com', 'user', NULL, '2024-11-17 22:43:42', NULL, NULL),
(6, 'user6', 'password123', 'user6@example.com', 'user', NULL, '2024-11-17 22:43:42', NULL, NULL),
(7, 'user7', 'password123', 'user7@example.com', 'user', NULL, '2024-11-17 22:43:42', NULL, NULL),
(8, 'user8', 'password123', 'user8@example.com', 'user', NULL, '2024-11-17 22:43:42', NULL, NULL),
(9, 'user9', 'password123', 'user9@example.com', 'user', NULL, '2024-11-17 22:43:42', NULL, NULL),
(10, 'user10', 'password123', 'user10@example.com', 'user', NULL, '2024-11-17 22:43:42', NULL, NULL),
(11, 'Zeeshan', 'password123', 'wangahmed01@gmail.com', 'admin', NULL, '2024-11-17 22:43:42', NULL, NULL),
(12, 'admin2', 'password123', 'admin2@example.com', 'admin', NULL, '2024-11-17 22:43:42', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `WishlistID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `DateAdded` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `wishlist`
--
DELIMITER $$
CREATE TRIGGER `after_add_to_wishlist` AFTER INSERT ON `wishlist` FOR EACH ROW BEGIN
    -- Count how many times the product has been added to the wishlist by the user
    DECLARE wishlist_count INT;
    
    -- Get the count of this product in the wishlist for the current user
    SELECT COUNT(*) INTO wishlist_count
    FROM wishlist
    WHERE UserID = NEW.UserID AND ProductID = NEW.ProductID;
    
    -- Log the addition to the inventory_log table with the count of wishlist additions
    INSERT INTO inventory_log (ProductID, Action, Quantity)
    VALUES (NEW.ProductID, CONCAT('Wishlist Add - ', wishlist_count, ' times'), 1);
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`BrandID`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`CatID`);

--
-- Indexes for table `checkout`
--
ALTER TABLE `checkout`
  ADD PRIMARY KEY (`CheckoutID`);

--
-- Indexes for table `inventory_log`
--
ALTER TABLE `inventory_log`
  ADD PRIMARY KEY (`LogID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProductID`),
  ADD KEY `CategoryID` (`CategoryID`),
  ADD KEY `BrandID` (`BrandID`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`ReviewID`),
  ADD KEY `ProductID` (`ProductID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `shopping_cart`
--
ALTER TABLE `shopping_cart`
  ADD PRIMARY KEY (`CartID`),
  ADD KEY `shopping_cart_ibfk_2` (`ProductID`),
  ADD KEY `shopping_cart_ibfk_1` (`UserID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`WishlistID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `BrandID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `CatID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `checkout`
--
ALTER TABLE `checkout`
  MODIFY `CheckoutID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory_log`
--
ALTER TABLE `inventory_log`
  MODIFY `LogID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `ReviewID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shopping_cart`
--
ALTER TABLE `shopping_cart`
  MODIFY `CartID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `WishlistID` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
