-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 13, 2018 at 11:06 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eshoper`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `name`, `description`, `url`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(7, 0, 'Shoes', 'Shoes Category', 'shoes', 1, NULL, '2018-09-08 03:38:12', '2018-09-08 03:38:12'),
(8, 6, 'Casual T-Shirts', 'casual T-shirts', 'casual-t-shirts', 1, NULL, '2018-09-08 04:05:47', '2018-09-08 04:05:47'),
(9, 7, 'Casual Shoes', 'casual shoes', 'casual shoes', 1, NULL, '2018-09-08 04:22:38', '2018-09-08 04:22:38'),
(11, 7, 'Sports Shoes', 'sports shoes', 'sports-shoes', 1, NULL, '2018-09-08 04:27:30', '2018-09-08 04:27:30'),
(15, 0, 'Women', 'women category', 'www.lotto.com', 1, NULL, '2018-09-13 03:58:06', '2018-09-13 03:58:06'),
(16, 0, 'Men', 'men category', 'www.lotto.com', 1, NULL, '2018-09-13 03:59:41', '2018-09-13 03:59:41'),
(17, 0, 'Boys', 'boys category', 'www.lotto.com', 1, NULL, '2018-09-13 04:01:16', '2018-09-13 04:01:16'),
(18, 0, 'Girls', 'girls category', 'www.lotto.com', 1, NULL, '2018-09-13 04:02:13', '2018-09-13 04:02:13'),
(19, 17, 'T-shirt', 'boys t-shirt', 'www.lotto.com', 1, NULL, '2018-09-13 04:05:08', '2018-09-13 04:05:08'),
(20, 18, 'T-shirt', 'girls t-shirt', 'www.lotto.com', 1, NULL, '2018-09-13 04:07:34', '2018-09-13 04:07:34'),
(21, 16, 'T-shirt', 'men t-shirt category', 'www.lotto.com', 1, NULL, '2018-09-13 04:11:58', '2018-09-13 04:11:58'),
(22, 15, 'T-shirt', 'women t-shirt', 'www.lotto.com', 1, NULL, '2018-09-13 04:12:52', '2018-09-13 04:12:52');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_09_07_184112_create_category_table', 1),
(4, '2018_09_08_111959_create_products_table', 2),
(5, '2018_09_09_090924_create_products_attributes_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_color` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `product_name`, `product_code`, `product_color`, `description`, `price`, `image`, `created_at`, `updated_at`) VALUES
(16, 13, 'Easy Polo Black Edition', 'B0202-L', 'Black, Green, White', 'new', 399.00, '49824.jpg', '2018-09-12 16:18:02', '2018-09-12 16:18:02'),
(17, 14, 'Easy Polo Black Edition', 'B0202-L', 'Black, Green, White', 'new', 499.00, '80606.jpg', '2018-09-12 16:19:06', '2018-09-12 16:19:06'),
(18, 13, 'Easy Polo Black Edition', 'B0202-L', 'Black, Green, White', 'new', 299.00, '9266.jpg', '2018-09-12 16:20:10', '2018-09-12 16:20:10'),
(19, 13, 'Easy Polo Black Edition', 'Z0202-L', 'Black, Green, White', 'new', 599.00, '17497.jpg', '2018-09-12 16:20:56', '2018-09-12 16:20:56'),
(20, 13, 'Easy Polo Black Edition', 'B0202-L', 'Black, Green, White', 'new', 699.00, '92659.jpg', '2018-09-12 16:21:54', '2018-09-12 16:21:54'),
(21, 13, 'Easy Polo Black Edition', 'B0202-L', 'Black, Green', 'Easy Polo Black Edition', 199.00, '28487.jpg', '2018-09-12 16:22:29', '2018-09-13 00:45:09'),
(22, 22, 'Easy Polo Black Edition', 'B0202-L', 'Black, Green', 'new', 399.00, '79198.jpg', '2018-09-13 07:04:38', '2018-09-13 07:04:38'),
(23, 7, 'Easy Polo Black Edition', 'B0202-L', 'Black, Green', 'new', 399.00, '30627.jpg', '2018-09-13 08:12:23', '2018-09-13 08:12:23');

-- --------------------------------------------------------

--
-- Table structure for table `products_attributes`
--

CREATE TABLE `products_attributes` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `sku` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `size` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `stock` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products_attributes`
--

INSERT INTO `products_attributes` (`id`, `product_id`, `sku`, `size`, `price`, `stock`, `created_at`, `updated_at`) VALUES
(2, 4, 'B00223M', 'Medium', 399.00, '50', '2018-09-09 17:12:36', '2018-09-09 17:12:36'),
(3, 4, 'C01293L', 'Large', 399.00, '20', '2018-09-09 17:12:36', '2018-09-09 17:12:36'),
(4, 4, 'B-338-S', 'small', 399.00, '10', '2018-09-10 05:07:19', '2018-09-10 05:07:19'),
(5, 4, 'A-8585-L', 'Large', 399.00, '20', '2018-09-10 05:07:19', '2018-09-10 05:07:19'),
(6, 4, 'C-8667-X', 'XL', 499.00, '30', '2018-09-10 05:07:19', '2018-09-10 05:07:19'),
(7, 6, 'A-8585-L', 'Small', 399.00, '20', '2018-09-12 03:16:06', '2018-09-12 03:16:06'),
(8, 6, 'A-8585-W', 'Medium', 399.00, '20', '2018-09-12 03:16:06', '2018-09-12 03:16:06'),
(9, 6, 'A-8585-Y', 'Large', 399.00, '30', '2018-09-12 03:16:07', '2018-09-12 03:16:07'),
(10, 7, 'A-8585-L', 'Small', 499.00, '50', '2018-09-12 03:18:53', '2018-09-12 03:18:53'),
(11, 7, 'B-8585-M', 'Medium', 499.00, '20', '2018-09-12 03:18:54', '2018-09-12 03:18:54'),
(12, 7, 'C-8585-L', 'Large', 399.00, '20', '2018-09-12 03:18:54', '2018-09-12 03:18:54'),
(13, 8, 'A-8585-S', 'Small', 399.00, '20', '2018-09-12 03:20:14', '2018-09-12 03:20:14'),
(14, 8, 'A-8585-M', 'Medium', 399.00, '20', '2018-09-12 03:20:14', '2018-09-12 03:20:14'),
(15, 8, 'A-8585-L', 'Large', 399.00, '20', '2018-09-12 03:20:14', '2018-09-12 03:20:14'),
(16, 9, 'A-8585-S', 'Small', 399.00, '20', '2018-09-12 03:21:49', '2018-09-12 03:21:49'),
(17, 9, 'A-8585-M', 'Meduim', 399.00, '20', '2018-09-12 03:21:49', '2018-09-12 03:21:49'),
(18, 9, 'A-8585-L', 'Large', 399.00, '20', '2018-09-12 03:21:50', '2018-09-12 03:21:50'),
(19, 12, 'A-8585-L', 'Large', 399.00, '20', '2018-09-12 14:48:11', '2018-09-12 14:48:11'),
(20, 12, 'B-8585-M', 'Medium', 399.00, '20', '2018-09-12 14:48:11', '2018-09-12 14:48:11'),
(21, 12, 'C-8585-S', 'Small', 399.00, '20', '2018-09-12 14:48:11', '2018-09-12 14:48:11');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `admin` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `admin`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 1, 'Ajay Kumar Yadav', 'ajaykucse@outlook.com', '2018-09-07 18:00:00', '$2y$12$o8AW8BHaLEvqkcR414rHtOM2GK8w9/ARJJjfvfE0upTtpQjgRixqO', NULL, '2018-09-07 18:00:00', '2018-09-07 18:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products_attributes`
--
ALTER TABLE `products_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `products_attributes`
--
ALTER TABLE `products_attributes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
