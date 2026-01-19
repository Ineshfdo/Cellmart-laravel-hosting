-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 07, 2026 at 04:58 PM
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
-- Database: `cellmart-laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `accepted_orders`
--

CREATE TABLE `accepted_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_phone` varchar(255) NOT NULL,
  `delivery_address` text NOT NULL,
  `products` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`products`)),
  `total_amount` decimal(10,2) NOT NULL,
  `currency` varchar(10) NOT NULL DEFAULT 'LKR',
  `status` varchar(255) NOT NULL DEFAULT 'accepted',
  `accepted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accepted_orders`
--

INSERT INTO `accepted_orders` (`id`, `user_id`, `customer_name`, `customer_email`, `customer_phone`, `delivery_address`, `products`, `total_amount`, `currency`, `status`, `accepted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Inesh Fernando', 'ineshfernando643@gmail.com', '+94758690018', '123 Galle Road\r\n54 Colombo Road', '[{\"product_id\":14,\"name\":\"Google Pixel 8 Pro\",\"price\":\"250000.00\",\"quantity\":\"1\",\"color\":\"Black\",\"warranty\":\"1 Year Company Warranty\",\"subtotal\":250000,\"image\":\"Images\\/8-pro.jpg\",\"currency\":\"LKR\"}]', 250000.00, 'LKR', 'accepted', '2025-12-12 01:04:31', '2025-12-11 23:48:15', '2025-12-12 01:04:31'),
(2, 2, 'Inesh Fernando', 'ineshfernando@gmail.com', '+94758690018', '123 Galle Road\r\n54 Colombo Road', '[{\"product_id\":37,\"name\":\"OnePlus 12\",\"price\":\"135000.00\",\"quantity\":\"1\",\"color\":\"Black\",\"warranty\":\"1 Year Company Warranty\",\"subtotal\":135000,\"image\":\"Images\\/o-12.jpg\",\"currency\":\"LKR\"},{\"product_id\":3,\"name\":\"Anker Wireless Powerbank\",\"price\":\"12000.00\",\"quantity\":\"3\",\"color\":\"Black\",\"warranty\":\"1 Year Company Warranty\",\"subtotal\":36000,\"image\":\"Images\\/anker.webp\",\"currency\":\"LKR\"},{\"product_id\":10,\"name\":\"Sony XM5\",\"price\":\"50000.00\",\"quantity\":\"3\",\"color\":\"Black\",\"warranty\":\"1 Year Company Warranty\",\"subtotal\":150000,\"image\":\"Images\\/xm5.webp\",\"currency\":\"LKR\"},{\"product_id\":15,\"name\":\"Google Pixel 9\",\"price\":\"310000.00\",\"quantity\":\"1\",\"color\":\"Green\",\"warranty\":\"1 Year Company Warranty\",\"subtotal\":310000,\"image\":\"Images\\/9.jpg\",\"currency\":\"LKR\"}]', 631000.00, 'LKR', 'accepted', '2025-12-15 00:26:37', '2025-12-15 00:24:57', '2025-12-15 00:26:37');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-356a192b7913b04c54574d18c28d46e6395428ab', 'i:2;', 1767525384),
('laravel-cache-356a192b7913b04c54574d18c28d46e6395428ab:timer', 'i:1767525384;', 1767525384),
('laravel-cache-4cd555cc3cdff73bf0182122b6ef40ed', 'i:1;', 1767797378),
('laravel-cache-4cd555cc3cdff73bf0182122b6ef40ed:timer', 'i:1767797378;', 1767797378),
('laravel-cache-c0bf54f057c168992b895785852a0b03', 'i:1;', 1767791335),
('laravel-cache-c0bf54f057c168992b895785852a0b03:timer', 'i:1767791335;', 1767791335);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `name`, `email`, `phone`, `subject`, `message`, `created_at`, `updated_at`) VALUES
(2, 'Inesh Fernando', 'ineshfernando643@gmail.com', '0758690018', 'Testing', 'This is a testing', '2025-12-12 23:32:02', '2025-12-12 23:32:02'),
(3, 'Inesh', 'ineshfernando643@gmail.com', '0758690018', 'About Mobile Phones', 'NOthing', '2025-12-12 23:35:49', '2025-12-12 23:35:49'),
(4, 'Inesh Fernando', 'ineshfernando643@gmail.com', '0758690018', 'fre', 'frerfefrerfer', '2025-12-19 00:33:05', '2025-12-19 00:33:05'),
(5, 'Inesh Fernando', 'ineshyhjrju@gmail.com', '0758690018', 'hytyh', 'tyhtyhtyhthy', '2025-12-19 00:34:51', '2025-12-19 00:34:51'),
(6, 'Inesh ', 'ineed4@gmail.com', '075864', 'ew4re', 'fq4rfere4q3f4q3e4r3feq', '2025-12-19 00:37:04', '2025-12-19 00:37:04'),
(7, 'e32', 'ineshfernand3@gmail.com', '0758690018', '3e2e', '23e23e2e32e32', '2025-12-19 00:38:34', '2025-12-19 00:38:34'),
(8, 'lalallaa', 'ineshfernando643@gmail.com', '0758690018', 'dewed', 'wdewedwdewe', '2025-12-19 00:39:15', '2025-12-19 00:39:15'),
(9, 'Inesh Fernando', 'ineshfernando643@gmail.com', '0758690018', '3e2', '3e2e32e323e2', '2025-12-19 00:39:30', '2025-12-19 00:39:30'),
(10, '3e2e323e23', 'ineshfernando643@gmail.com', '0758690018', '3e23e23e', '23e23e2e323e23e', '2025-12-19 00:39:46', '2025-12-19 00:39:46'),
(11, 'Kavinda', 'kavinda@gmail.com', '0758690018', 'Hellow', 'Inesh Kavinda 134', '2025-12-19 00:43:02', '2025-12-19 00:43:02');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_12_12_034530_add_two_factor_columns_to_users_table', 1),
(5, '2025_12_12_034611_create_personal_access_tokens_table', 1),
(6, '2025_12_03_043842_create_products_table', 2),
(7, '2025_12_03_134346_create_orders_table', 2),
(8, '2025_12_04_043715_create_feedback_table', 2),
(9, '2025_12_04_173554_create_accepted_orders_table', 2),
(10, '2025_12_12_051630_add_user_id_to_orders_table', 3),
(11, '2025_12_12_052557_add_type_column_to_users_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `customer_email` varchar(255) DEFAULT NULL,
  `customer_phone` varchar(255) DEFAULT NULL,
  `delivery_address` text NOT NULL,
  `products` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`products`)),
  `total_amount` decimal(10,2) NOT NULL,
  `currency` varchar(10) NOT NULL DEFAULT 'LKR',
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `customer_name`, `customer_email`, `customer_phone`, `delivery_address`, `products`, `total_amount`, `currency`, `status`, `created_at`, `updated_at`) VALUES
(4, 1, 'Inesh Fernando', 'ineshfernando643@gmail.com', '4', 'f4', '[{\"product_id\":16,\"name\":\"Google Pixel 9 Pro\",\"price\":\"360000.00\",\"quantity\":\"1\",\"color\":\"Black\",\"warranty\":\"1 Year Company Warranty\",\"subtotal\":360000,\"image\":\"Images\\/9-pro.jpg\",\"currency\":\"LKR\"},{\"product_id\":22,\"name\":\"iPhone 15 Pro\",\"price\":\"300000.00\",\"quantity\":\"1\",\"color\":\"Black\",\"warranty\":\"1 Year Company Warranty\",\"subtotal\":300000,\"image\":\"Images\\/15pro.webp\",\"currency\":\"LKR\"},{\"product_id\":25,\"name\":\"iPhone 16 Pro\",\"price\":\"440000.00\",\"quantity\":\"1\",\"color\":\"Black\",\"warranty\":\"1 Year Company Warranty\",\"subtotal\":440000,\"image\":\"Images\\/16pro.webp\",\"currency\":\"LKR\"},{\"product_id\":4,\"name\":\"Car Baseus Charger\",\"price\":\"2000.00\",\"quantity\":\"1\",\"color\":\"Black\",\"warranty\":\"1 Year Company Warranty\",\"subtotal\":2000,\"image\":\"Images\\/bcarcharger.jpg\",\"currency\":\"LKR\"},{\"product_id\":15,\"name\":\"Google Pixel 9\",\"price\":\"310000.00\",\"quantity\":\"1\",\"color\":\"Black\",\"warranty\":\"1 Year Company Warranty\",\"subtotal\":310000,\"image\":\"Images\\/9.jpg\",\"currency\":\"LKR\"}]', 1412000.00, 'LKR', 'pending', '2025-12-12 03:14:22', '2025-12-12 03:14:22'),
(6, 1, 'Inesh Fernando', 'ineshfernando643@gmail.com', '+94758690018', '123 Galle Road\r\n54 Colombo Road', '[{\"product_id\":32,\"name\":\"Samsung Galaxy A25\",\"price\":\"130000.00\",\"quantity\":\"1\",\"color\":\"Black\",\"warranty\":\"1 Year Company Warranty\",\"subtotal\":130000,\"image\":\"Images\\/a25.jpg\",\"currency\":\"LKR\"}]', 130000.00, 'LKR', 'pending', '2025-12-17 10:03:44', '2025-12-17 10:03:44'),
(8, 1, 'Inesh Fernando', 'ineshfernando643@gmail.com', '+94758690018', '123 Galle Road\r\n54 Colombo Road', '[{\"product_id\":13,\"name\":\"Google Pixel 8\",\"price\":\"170000.00\",\"quantity\":6,\"color\":\"Black\",\"warranty\":\"2 Years Extended Warranty\",\"subtotal\":1020000,\"image\":\"Images\\/8.jpg\",\"currency\":\"LKR\"}]', 1020000.00, 'LKR', 'pending', '2025-12-19 00:51:27', '2025-12-19 00:51:27'),
(11, 2, 'Inesh Fernando', 'ineshfernando@gmail.com', '26158690018', 'oup123 Galle Road\r\nj;ilj54 Colombo Road', '[{\"product_id\":14,\"name\":\"Google Pixel 8 Pro\",\"price\":\"250000.00\",\"quantity\":1,\"color\":\"Black\",\"warranty\":\"1 Year Company Warranty\",\"subtotal\":250000,\"image\":\"Images\\/8-pro.jpg\",\"currency\":\"LKR\"}]', 250000.00, 'LKR', 'pending', '2025-12-27 02:26:06', '2025-12-27 02:26:06'),
(12, 2, 'Inesh Fernando', 'ineshfernando@gmail.com', '+94758690018', '123 Galle Road\r\n54 Colombo Road', '[{\"product_id\":21,\"name\":\"iPhone 15\",\"price\":\"200000.00\",\"quantity\":1,\"color\":\"Black\",\"warranty\":\"1 Year Company Warranty\",\"subtotal\":200000,\"image\":\"Images\\/15.jpg\",\"currency\":\"LKR\"},{\"product_id\":10,\"name\":\"Sony XM5\",\"price\":\"50000.00\",\"quantity\":1,\"color\":\"White\",\"warranty\":\"2 Years Extended Warranty\",\"subtotal\":50000,\"image\":\"Images\\/xm5.webp\",\"currency\":\"LKR\"}]', 250000.00, 'LKR', 'pending', '2025-12-28 08:55:35', '2025-12-28 08:55:35'),
(13, 2, 'Inesh Fernando', 'ineshfernando@gmail.com', '+94758690018', '123 Galle Road\r\n54 Colombo Road', '[{\"product_id\":14,\"name\":\"Google Pixel 8 Pro\",\"price\":\"250000.00\",\"quantity\":1,\"color\":\"Black\",\"warranty\":\"1 Year Company Warranty\",\"subtotal\":250000,\"image\":\"Images\\/8-pro.jpg\",\"currency\":\"LKR\"}]', 250000.00, 'LKR', 'pending', '2025-12-28 22:21:08', '2025-12-28 22:21:08'),
(14, 2, 'Inesh Fernando', 'ineshfernando@gmail.com', '+94758690018', '123 Galle Road\r\n54 Colombo Road', '[{\"product_id\":32,\"name\":\"Samsung Galaxy A25\",\"price\":\"130000.00\",\"quantity\":1,\"color\":\"Black\",\"warranty\":\"1 Year Company Warranty\",\"subtotal\":130000,\"image\":\"Images\\/a25.jpg\",\"currency\":\"LKR\"}]', 130000.00, 'LKR', 'completed', '2025-12-28 22:27:46', '2025-12-28 22:28:24'),
(15, 2, 'Inesh Fernando', 'ineshfernando@gmail.com', '0774477168', 'No 456 Nelum Katuneriya', '[{\"product_id\":18,\"name\":\"iPhone 12\",\"price\":\"120000.00\",\"quantity\":1,\"color\":\"Red\",\"warranty\":\"2 Years Extended Warranty\",\"subtotal\":120000,\"image\":\"Images\\/12.jpg\",\"currency\":\"LKR\"},{\"product_id\":24,\"name\":\"iPhone 16\",\"price\":\"400000.00\",\"quantity\":1,\"color\":\"White\",\"warranty\":\"1 Year Company Warranty\",\"subtotal\":400000,\"image\":\"Images\\/16.jpg\",\"currency\":\"LKR\"},{\"product_id\":7,\"name\":\"AirPods 3\",\"price\":\"45000.00\",\"quantity\":1,\"color\":\"White\",\"warranty\":\"1 Year Company Warranty\",\"subtotal\":45000,\"image\":\"Images\\/airpods3.png\",\"currency\":\"LKR\"},{\"product_id\":2,\"name\":\"iPhone Charger 20W\",\"price\":\"10000.00\",\"quantity\":3,\"color\":\"White\",\"warranty\":\"1 Year Company Warranty\",\"subtotal\":30000,\"image\":\"Images\\/acharger.webp\",\"currency\":\"LKR\"}]', 595000.00, 'LKR', 'completed', '2025-12-28 22:32:21', '2025-12-28 22:33:07'),
(16, 1, 'Inesh Fernando', 'ineshfernando643@gmail.com', '+94758690018', '123 Galle Road\r\n54 Colombo Road', '[{\"product_id\":14,\"name\":\"Google Pixel 8 Pro\",\"price\":\"250000.00\",\"quantity\":1,\"color\":\"Black\",\"warranty\":\"1 Year Company Warranty\",\"subtotal\":250000,\"image\":\"Images\\/8-pro.jpg\",\"currency\":\"LKR\"}]', 250000.00, 'LKR', 'pending', '2025-12-28 22:49:05', '2025-12-28 22:49:05'),
(19, 2, 'Inesh Fernando', 'ineshfernando@gmail.com', '0312250777', 'No 456 \"Nelum Katuneriya\"', '[{\"product_id\":36,\"name\":\"OnePlus 11\",\"price\":\"110000.00\",\"quantity\":2,\"color\":\"Green\",\"warranty\":\"1 Year Company Warranty\",\"subtotal\":220000,\"image\":\"Images\\/o-11.jpg\",\"currency\":\"LKR\"},{\"product_id\":11,\"name\":\"Nothing Ear 2\",\"price\":\"30000.00\",\"quantity\":1,\"color\":\"Black\",\"warranty\":\"1 Year Company Warranty\",\"subtotal\":30000,\"image\":\"Images\\/nothingear2.jpg\",\"currency\":\"LKR\"}]', 250000.00, 'LKR', 'completed', '2025-12-29 22:40:44', '2025-12-29 22:41:05'),
(20, 2, 'Inesh Fernando', 'ineshfernando@gmail.com', '+94758690018', '123 Galle Road\r\n54 Colombo Road', '[{\"product_id\":14,\"name\":\"Google Pixel 8 Pro\",\"price\":\"250000.00\",\"quantity\":1,\"color\":\"Blue\",\"warranty\":\"2 Years Extended Warranty\",\"subtotal\":250000,\"image\":\"Images\\/8-pro.jpg\",\"currency\":\"LKR\"}]', 250000.00, 'LKR', 'completed', '2026-01-05 22:35:33', '2026-01-05 22:36:05'),
(21, 2, 'Inesh Fernando', 'ineshfernando@gmail.com', '+94758690018', '123 Galle Road\r\n54 Colombo Road', '[{\"product_id\":9,\"name\":\"Samsung Buds Pro 2\",\"price\":\"25000.00\",\"quantity\":1,\"color\":\"Black\",\"warranty\":\"2 Years Extended Warranty\",\"subtotal\":25000,\"image\":\"Images\\/buds2pro.png\",\"currency\":\"LKR\"}]', 25000.00, 'LKR', 'completed', '2026-01-06 00:34:29', '2026-01-06 00:34:59'),
(22, 2, 'Inesh Fernando', 'ineshfernando@gmail.com', '+94758690018', '123 Galle Road\r\n54 Colombo Road', '[{\"product_id\":34,\"name\":\"Samsung Galaxy A55\",\"price\":\"190000.00\",\"quantity\":1,\"color\":\"Black\",\"warranty\":\"1 Year Company Warranty\",\"subtotal\":190000,\"image\":\"Images\\/a55.jpg\",\"currency\":\"LKR\"},{\"product_id\":34,\"name\":\"Samsung Galaxy A55\",\"price\":\"190000.00\",\"quantity\":2,\"color\":\"White\",\"warranty\":\"2 Years Extended Warranty\",\"subtotal\":380000,\"image\":\"Images\\/a55.jpg\",\"currency\":\"LKR\"}]', 570000.00, 'LKR', 'pending', '2026-01-07 02:11:48', '2026-01-07 02:11:48');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'api-token', 'c337e8cb418479ec3285b317fcfbe63ff9dd51d940d8c7e3a01875e090029f0c', '[\"products:manage\"]', NULL, NULL, '2025-12-27 00:19:36', '2025-12-27 00:19:36'),
(2, 'App\\Models\\User', 1, 'api-token', 'f5ca180f161a049878b4c3475818dd21dcb1ec1ed2c67894c4b319b0c9d13241', '[\"products:manage\"]', NULL, NULL, '2025-12-27 00:25:26', '2025-12-27 00:25:26'),
(3, 'App\\Models\\User', 1, 'api-token', '645b5322b3f24ab741c68030864c9108b72f1e91080c6739a556e4c8b2a742af', '[\"products:manage\"]', '2025-12-27 01:15:59', NULL, '2025-12-27 00:37:05', '2025-12-27 01:15:59'),
(4, 'App\\Models\\User', 2, 'api-token', '90eedc2fffc0ed46420e383307f67b076d644a4af63c9439d6d315005e9f07ef', '[\"products:view\"]', '2025-12-27 01:22:52', NULL, '2025-12-27 01:21:43', '2025-12-27 01:22:52'),
(5, 'App\\Models\\User', 1, 'api-token', 'cd1503a8795b7d8778360f9483f7f2e056b5d37c2f5bbd5d68f9c2114e7fe756', '[\"products:manage\"]', '2025-12-27 01:26:29', NULL, '2025-12-27 01:24:14', '2025-12-27 01:26:29'),
(6, 'App\\Models\\User', 4, 'api-token', 'f8fa212dce17c6fb2783c0034606b57ca41875a4ee53b529aea81a5c94778e72', '[\"products:manage\"]', '2025-12-27 01:48:08', NULL, '2025-12-27 01:46:53', '2025-12-27 01:48:08'),
(7, 'App\\Models\\User', 5, 'api-token', 'd05258cf4d7cf418b5e10566336ee976b631bf657fa7f79371fc1d1b6a588c57', '[\"products:view\"]', '2025-12-27 01:49:42', NULL, '2025-12-27 01:48:55', '2025-12-27 01:49:42'),
(8, 'App\\Models\\User', 1, 'api-token', '9cdccc488bd04b83c9994a9ee2e681cb186dbdd67aad1f92158f2e94f95ced89', '[\"products:manage\"]', '2025-12-27 02:16:57', NULL, '2025-12-27 02:11:47', '2025-12-27 02:16:57'),
(9, 'App\\Models\\User', 6, 'api-token', '940343d4229ee74732b5aaffe8c72416ca61199184e2a898c21b1df19eca9d51', '[\"products:manage\",\"users:manage\",\"orders:manage\"]', '2025-12-28 22:44:36', NULL, '2025-12-28 22:38:14', '2025-12-28 22:44:36'),
(10, 'App\\Models\\User', 7, 'api-token', '211d15fda324e524f1ee318a58fdaf87bf27ac976ef7dcd9a19307616b37f251', '[\"products:view\"]', NULL, NULL, '2025-12-28 22:42:11', '2025-12-28 22:42:11'),
(11, 'App\\Models\\User', 1, 'api-token', '3e0207d22a576899d3d1ce3e67fc5ca9d499f6d2b6492acf7a8596de58635923', '[\"products:manage\"]', NULL, NULL, '2025-12-28 22:42:38', '2025-12-28 22:42:38'),
(12, 'App\\Models\\User', 1, 'api-token', '5c31d32e9045e841c1dd6681e362aad002a05ebf7ef182ce33ae4903a1c031b6', '[\"products:manage\"]', '2025-12-28 22:46:07', NULL, '2025-12-28 22:45:12', '2025-12-28 22:46:07'),
(13, 'App\\Models\\User', 8, 'api-token', '44fc753d85cfacc2ce67f1793642c22d0ae0350684e9344e5b76bf04528e1cf2', '[\"products:manage\",\"users:manage\",\"orders:manage\"]', NULL, NULL, '2025-12-29 22:45:14', '2025-12-29 22:45:14'),
(14, 'App\\Models\\User', 9, 'api-token', 'a3ed64c997e3ffb25448649fd7dbe63c94afc64da9e02f278925d4638af547ac', '[\"products:manage\",\"users:manage\",\"orders:manage\"]', NULL, NULL, '2025-12-29 22:45:32', '2025-12-29 22:45:32'),
(15, 'App\\Models\\User', 10, 'api-token', 'ac718e5b31a73b2814d8cb6fd7cfaa1ec3d8c50ab7bb74a08bedb085347f3a06', '[\"products:manage\",\"users:manage\",\"orders:manage\"]', '2025-12-29 22:50:28', NULL, '2025-12-29 22:45:55', '2025-12-29 22:50:28'),
(16, 'App\\Models\\User', 11, 'api-token', 'f1d1df98e690b8e4ebbd58ff518640fbdbef24429e066a87eb82e1ed3fd1f54c', '[\"products:view\"]', NULL, NULL, '2025-12-29 22:49:43', '2025-12-29 22:49:43'),
(17, 'App\\Models\\User', 11, 'api-token', '68771525912e2dab409c0cb8bf3b4d56166c3e10db40652a45f499d73224a88a', '[\"products:view\"]', '2025-12-29 22:52:13', NULL, '2025-12-29 22:51:41', '2025-12-29 22:52:13'),
(18, 'App\\Models\\User', 1, 'api-token', 'e295638ce765e2e0d450da85f8181d52d93a38b29200128555ec75bbaec53eb1', '[\"products:manage\"]', '2025-12-29 22:54:55', NULL, '2025-12-29 22:52:38', '2025-12-29 22:54:55'),
(19, 'App\\Models\\User', 12, 'api-token', 'e7fbddc33970528c4287e84364649da3cc034f70e24777a02625d8dc9258536d', '[\"products:view\"]', NULL, NULL, '2025-12-30 22:21:31', '2025-12-30 22:21:31'),
(20, 'App\\Models\\User', 13, 'api-token', 'fe2ca0b5841add435df8681677d9aef5e59ab38cc1374e0a9b28be54af793a8b', '[\"products:view\"]', NULL, NULL, '2025-12-30 22:22:03', '2025-12-30 22:22:03'),
(21, 'App\\Models\\User', 1, 'api-token', '5b81fb88f8cff99be257a249d40027b0c731061002b99ea3ba37fa466984d7e7', '[\"products:manage\"]', '2025-12-30 22:23:16', NULL, '2025-12-30 22:22:30', '2025-12-30 22:23:16'),
(22, 'App\\Models\\User', 1, 'api-token', '019abc5cddf9fffc3d1098e053391abd699569fe900c9cf41e560af2e1866f95', '[\"products:manage\"]', NULL, NULL, '2026-01-05 04:35:35', '2026-01-05 04:35:35'),
(23, 'App\\Models\\User', 14, 'api-token', '2107aa6e448a30327d877d717a9d6209e1320551f64fda6a7fa0cfc09bac55a7', '[\"products:view\"]', NULL, NULL, '2026-01-05 04:37:02', '2026-01-05 04:37:02'),
(24, 'App\\Models\\User', 1, 'api-token', 'fbef33657aff7be70297315f927c8f53e509438c38ddb6ed41d7990eea61ba4d', '[\"products:manage\"]', NULL, NULL, '2026-01-05 04:42:45', '2026-01-05 04:42:45'),
(25, 'App\\Models\\User', 1, 'api-token', '54e76c407ed6469002d109372ed7d2152db95ab94f9970b3b366ba6c5efe5279', '[\"products:manage\"]', NULL, NULL, '2026-01-05 04:53:17', '2026-01-05 04:53:17'),
(26, 'App\\Models\\User', 1, 'api-token', '26f0b9278dc27a8c8a6de34a1d788ef9a57e2f304394baf60000b6db4b56b015', '[\"products:manage\"]', NULL, NULL, '2026-01-05 04:58:46', '2026-01-05 04:58:46'),
(27, 'App\\Models\\User', 1, 'api-token', '86d8ad5b6dd1a30ee666fb1adcb71f22db80e9a76bf14f59fd14a53432a7b53a', '[\"products:manage\"]', NULL, NULL, '2026-01-05 05:00:51', '2026-01-05 05:00:51'),
(28, 'App\\Models\\User', 1, 'api-token', 'e2401255a117866ea0eeb8725ed46279c15867309207a7a11b1c6ed9877bff50', '[\"products:manage\"]', NULL, NULL, '2026-01-05 05:01:59', '2026-01-05 05:01:59'),
(29, 'App\\Models\\User', 2, 'api-token', 'c373924f5da91d727cd1506740b3c5238b689e0a397d606ef17ace38b33aa7bf', '[\"products:view\"]', NULL, NULL, '2026-01-06 01:02:21', '2026-01-06 01:02:21'),
(30, 'App\\Models\\User', 1, 'api-token', '6ddded7b384499aa32d0079a1346296f8ba3b437fb62bda675e483154a7862ef', '[\"products:manage\"]', NULL, NULL, '2026-01-06 01:18:04', '2026-01-06 01:18:04'),
(31, 'App\\Models\\User', 2, 'api-token', '6efd4eda6159379de2a8b3c14a7bed3d55b7dccaf393b1fa3ecfc8cd017f5a59', '[\"products:view\"]', NULL, NULL, '2026-01-06 01:21:03', '2026-01-06 01:21:03'),
(32, 'App\\Models\\User', 2, 'api-token', '39c80a1f8b1a2821f7f1bdc7f08c03db4853781e368e5a0f5adbbb6719ca4316', '[\"products:view\"]', NULL, NULL, '2026-01-06 01:22:15', '2026-01-06 01:22:15'),
(33, 'App\\Models\\User', 15, 'api-token', 'e7b3540038ae6c01111cf96420f8f828daedfed16c8d84a7d3ba858e7b69bbd8', '[\"products:manage\",\"users:manage\",\"orders:manage\"]', NULL, NULL, '2026-01-07 07:42:06', '2026-01-07 07:42:06'),
(34, 'App\\Models\\User', 16, 'api-token', 'e776343bcd0f563c1c420470c3ec0a644ec22a33d9ab6c76a4c85e6a31d6bb8c', '[\"products:view\"]', NULL, NULL, '2026-01-07 07:42:46', '2026-01-07 07:42:46'),
(35, 'App\\Models\\User', 1, 'api-token', '4a5ae4701e9dafa192d5c5d705e8ed471402f1cefff7f7eddf7151532016b0c5', '[\"products:manage\"]', '2026-01-07 07:47:40', NULL, '2026-01-07 07:43:23', '2026-01-07 07:47:40'),
(36, 'App\\Models\\User', 1, 'api-token', 'a648bd1258ec8c133f526fb7ff0b087aef06bb930dd75925953a3eeba64e9b34', '[\"products:manage\"]', '2026-01-07 07:49:53', NULL, '2026-01-07 07:48:08', '2026-01-07 07:49:53'),
(37, 'App\\Models\\User', 2, 'api-token', '821793888482506a829904f5930a6eceac041c41caf4f9dcbc114aeb460eed63', '[\"products:view\"]', '2026-01-07 07:53:12', NULL, '2026-01-07 07:50:15', '2026-01-07 07:53:12');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `currency` varchar(10) NOT NULL DEFAULT 'LKR',
  `ram` varchar(255) DEFAULT NULL,
  `storage` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `category`, `subcategory`, `price`, `currency`, `ram`, `storage`, `image`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Belkin 3-in-1 Wireless Charger', 'Accessories', 'Wireless Chargers', 5000.00, 'LKR', '', '', 'images/3in1.webp', 'A fast wireless charging dock supporting simultaneous charging for iPhone, Apple Watch, and AirPods. Built with optimized magnetic alignment, heat-control protection, and efficient power delivery for stable charging performance. Ideal for maintaining consistent output while minimizing temperature rise during extended charging sessions.', NULL, NULL),
(2, 'iPhone Charger 20W', 'Accessories', 'Chargers', 10000.00, 'LKR', NULL, NULL, 'images/acharger.webp', 'A reliable 20W USB-C power adapter providing fast charging optimized for iPhone models. Supports efficient thermal management and stable current output. Designed for safe voltage regulation and long-term durability while maintaining minimized energy loss and high-speed charging performance.', NULL, NULL),
(3, 'Anker Wireless Powerbank', 'Accessories', 'Powerbanks', 4200.00, 'LKR', NULL, NULL, 'images/anker.webp', 'Updated price – genuine Samsung 45W fast charger.', NULL, '2025-12-27 01:13:40'),
(4, 'Car Baseus Charger', 'Accessories', 'Car Chargers', 2000.00, 'LKR', NULL, NULL, 'images/bcarcharger.jpg', 'A fast dual-port car charger featuring intelligent voltage management, heat-resistant construction, and adaptive power delivery. Designed for stable charging during long drives, maintaining consistent current even under fluctuating vehicle power conditions.', NULL, NULL),
(5, 'Samsung 15W Charger', 'Accessories', 'Chargers', 2500.00, 'LKR', NULL, NULL, 'images/scharger.jpg', 'A Samsung-optimized 15W adaptive charger built with safe power regulation and efficient thermal control. Delivers reliable current for compatible devices, ensuring stable charging cycles and extended battery lifespan under standard daily use.', NULL, NULL),
(6, 'Ugreen 35W Charger', 'Accessories', 'Chargers', 13000.00, 'LKR', NULL, NULL, 'images/ugreen.jpg', 'A 35W dual-port fast charger using advanced GaN technology for higher efficiency and lower heat generation. Provides stable voltage output ideal for smartphones and tablets requiring fast charging performance.', NULL, NULL),
(7, 'AirPods 3', 'Accessories', 'Earbuds', 45000.00, 'LKR', NULL, NULL, 'images/airpods3.png', 'Lightweight wireless earbuds with Adaptive EQ, optimized audio drivers, and low-latency wireless performance. Engineered for efficient battery consumption and stable Bluetooth connectivity, suitable for extended listening with minimal power drain.', NULL, NULL),
(8, 'AirPods Pro 2', 'Accessories', 'Earbuds', 65000.00, 'LKR', NULL, NULL, 'images/airpodspro.png', 'Advanced earbuds with active noise cancellation, improved audio drivers, and upgraded H2 chip for faster processing and connectivity. Designed for consistent acoustic performance, low distortion, and more efficient battery use during extended sessions.', NULL, NULL),
(9, 'Samsung Buds Pro 2', 'Accessories', 'Earbuds', 25000.00, 'LKR', NULL, NULL, 'images/buds2pro.png', 'High-performance earbuds with optimized ANC processing, advanced two-way drivers, and efficient wireless transmission. Offers stable battery performance and enhanced environmental noise control suitable for daily usage.', NULL, NULL),
(10, 'Sony XM5', 'Accessories', 'Headphones', 50000.00, 'LKR', NULL, NULL, 'images/xm5.webp', 'Premium over-ear headphones featuring advanced noise-cancellation processors, large dynamic drivers, and highly efficient battery usage. Built for immersive audio clarity, reduced distortion, and stable wireless operation under varying signal environments.', NULL, NULL),
(11, 'Nothing Ear 2', 'Accessories', 'Earbuds', 30000.00, 'LKR', NULL, NULL, 'images/nothingear2.jpg', 'Lightweight earbuds featuring LHDC support, dual-chamber sound architecture, and adaptive ANC. Engineered for low-latency wireless audio, stable processing efficiency, and extended playback under consistent load.', NULL, NULL),
(12, 'Nothing Headphones', 'Accessories', 'Headphones', 29000.00, 'LKR', NULL, NULL, 'images/nothingheadphones.jpg', 'High-fidelity headphones designed with large custom drivers, multi-mode ANC, and optimized battery efficiency. Supports stable wireless audio and low-latency data transmission ideal for multimedia usage.', NULL, NULL),
(13, 'Google Pixel 8', 'Mobile Phones', 'Google Pixel', 170000.00, 'LKR', '8GB', '128GB', 'images/8.jpg', 'Powered by the Google Tensor G3 chipset offering efficient AI-driven performance, the Pixel 8 features a 6.2-inch OLED display, optimized thermal output, and excellent image processing. Designed for power efficiency and strong battery endurance under daily workloads.', NULL, NULL),
(14, 'Google Pixel 8 Pro', 'Mobile Phones', 'Google Pixel', 250000.00, 'LKR', '12GB', '128GB', 'images/8-pro.jpg', 'Featuring Google’s Tensor G3 with enhanced machine learning acceleration, the Pixel 8 Pro delivers smooth multitasking, advanced computational photography, and strong battery optimization. The LTPO display ensures higher power efficiency during adaptive refresh rate usage.', NULL, NULL),
(15, 'Google Pixel 9', 'Mobile Phones', 'Google Pixel', 310000.00, 'LKR', '12GB', '128GB', 'images/9.jpg', 'Built with next-generation Tensor processing for improved thermal control and AI performance, the Pixel 9 offers smoother graphics handling, efficient energy distribution, and durable battery performance for heavy everyday use.', NULL, NULL),
(16, 'Google Pixel 9 Pro', 'Mobile Phones', 'Google Pixel', 360000.00, 'LKR', '16GB', '256GB', 'images/9-pro.jpg', 'Equipped with upgraded Tensor architecture, the Pixel 9 Pro enhances multi-core performance, display responsiveness, and image processing. Optimized for sustained workloads and strong power efficiency under continuous data operations.', NULL, NULL),
(17, 'Google Pixel 10 Pro', 'Mobile Phones', 'Google Pixel', 310000.00, 'LKR', '16GB', '256GB', 'images/10-pro.jpg', 'Designed around Google’s advanced AI chipset, the Pixel 10 Pro offers improved heat dissipation, superior display accuracy, and efficient battery control. Suitable for intensive camera processing and extended high-performance tasks.', NULL, NULL),
(18, 'iPhone 12', 'Mobile Phones', 'Apple iPhone', 120000.00, 'LKR', '4GB', '128GB', 'images/12.jpg', 'Powered by the A14 Bionic chip, the iPhone 12 offers efficient performance, strong battery optimization, and a durable OLED display. Designed for consistent thermal management and reliable daily usage.', NULL, NULL),
(21, 'iPhone 15', 'Mobile Phones', 'Apple iPhone', 200000.00, 'LKR', '12GB', '128GB', 'images/15.jpg', 'Equipped with the A16 Bionic chip, the iPhone 15 offers efficient battery use, strong graphics output, and improved power management suitable for modern apps and daily multitasking.', NULL, NULL),
(22, 'iPhone 15 Pro', 'Mobile Phones', 'Apple iPhone', 300000.00, 'LKR', '16GB', '256GB', 'images/15pro.webp', 'The A17 Pro chip delivers extreme performance, efficient heat management, and faster rendering. Ideal for extended gaming, multitasking, and high-resolution photography workflows with optimized battery longevity.', NULL, NULL),
(23, 'iPhone 15 Pro Max', 'Mobile Phones', 'Apple iPhone', 350000.00, 'LKR', '16GB', '256GB', 'images/15promax.jpg', 'Featuring the A17 Pro architecture with superior GPU enhancements, the iPhone 15 Pro Max ensures powerful performance, excellent energy optimization, and advanced camera processing under heavy usage.', NULL, NULL),
(24, 'iPhone 16', 'Mobile Phones', 'Apple iPhone', 400000.00, 'LKR', '8GB', '128GB', 'images/16.jpg', 'The latest A18 chip provides improved power efficiency, refined thermal distribution, and enhanced display rendering. Suitable for sustained high-performance environments and balanced battery life.', NULL, NULL),
(25, 'iPhone 16 Pro', 'Mobile Phones', 'Apple iPhone', 440000.00, 'LKR', '16GB', '256GB', 'images/16pro.webp', 'Powered by the A18 Pro chipset with upgraded ML accelerators, the iPhone 16 Pro offers efficient workload handling, improved graphics rendering, and advanced energy control for demanding applications.', NULL, NULL),
(26, 'iPhone 16 Pro Max', 'Mobile Phones', 'Apple iPhone', 510000.00, 'LKR', '16GB', '256GB', 'images/16-pro-max.jpg', 'Designed with top-tier A18 Pro silicon, this model provides extreme performance, stable thermal output, and higher battery-efficiency improvements for long-duration tasks and high-detail content processing.', NULL, NULL),
(27, 'iPhone 17 Air', 'Mobile Phones', 'Apple iPhone', 330000.00, 'LKR', '8GB', '128GB', 'images/17-air.jpg', 'A lightweight design offering optimized performance through advanced A-series processing, power-efficient display technology, and extended battery control. Ideal for balanced daily operation.', NULL, NULL),
(28, 'iPhone 17 Pro', 'Mobile Phones', 'Apple iPhone', 600000.00, 'LKR', '16GB', '256GB', 'images/17-pro.jpg', 'Featuring latest-generation silicon with enhanced neural engines, the iPhone 17 Pro delivers powerful task performance, refined thermal efficiency, and optimized battery endurance during intensive workflows.', NULL, NULL),
(29, 'iPhone 17 Pro Max', 'Mobile Phones', 'Apple iPhone', 630000.00, 'LKR', '16GB', '256GB', 'images/17-pro-max.jpg', 'A performance-focused device offering extreme processing speeds, adaptive display technologies, and significant battery efficiency improvements for high-demand applications and multimedia processing.', NULL, NULL),
(30, 'Samsung Galaxy A04s', 'Mobile Phones', 'Samsung A Series', 60000.00, 'LKR', '4GB', '64GB', 'images/a04s.png', 'Powered by an energy-efficient chipset and a 5000mAh battery, the A04s offers reliable performance for daily tasks. The display provides good clarity while maintaining low power consumption.', NULL, NULL),
(32, 'Samsung Galaxy A25', 'Mobile Phones', 'Samsung A Series', 130000.00, 'LKR', '8GB', '128GB', 'images/a25.jpg', 'Powered by a capable mid-range chipset, the A25 delivers stable graphics performance, smooth display operation, and long battery endurance for routine workloads.', NULL, NULL),
(33, 'Samsung Galaxy A35', 'Mobile Phones', 'Samsung A Series', 150000.00, 'LKR', '8GB', '128GB', 'images/a35.jpg', 'A balanced mid-range device featuring a power-efficient processor, strong battery backup, and stable thermal output ideal for extended usage.', NULL, NULL),
(34, 'Samsung Galaxy A55', 'Mobile Phones', 'Samsung A Series', 190000.00, 'LKR', '8GB', '128GB', 'images/a55.jpg', 'Featuring a high-efficiency chipset, the A55 provides smooth performance, improved display responsiveness, and extended battery life suitable for everyday multitasking.', NULL, NULL),
(35, 'Samsung Galaxy A75', 'Mobile Phones', 'Samsung A Series', 250000.00, 'LKR', '8GB', '256GB', 'images/a75.webp', 'A premium A-series model delivering strong performance, optimized display efficiency, and enhanced battery management designed for long active use.', NULL, NULL),
(36, 'OnePlus 11', 'Mobile Phones', 'OnePlus', 110000.00, 'LKR', '12GB', '256GB', 'images/o-11.jpg', 'Powered by the Snapdragon 8 Gen 2, the OnePlus 11 ensures high-level multitasking, efficient thermal output, and fast display performance for demanding applications.', NULL, NULL),
(37, 'OnePlus 12', 'Mobile Phones', 'OnePlus', 135000.00, 'LKR', '12GB', '256GB', 'images/o-12.jpg', 'Equipped with an advanced flagship chipset, the OnePlus 12 delivers enhanced processing efficiency, better heat management, and excellent battery optimization under heavy workloads.', NULL, NULL),
(38, 'Samsung S23', 'Mobile Phones', 'Samsung S Series', 250000.00, 'LKR', '8GB', '256GB', 'images/s23.webp', 'Powered by the Snapdragon 8 Gen 2, the S23 delivers powerful performance, optimized battery efficiency, and strong display responsiveness while maintaining stable thermal conditions.', NULL, NULL),
(39, 'Samsung S23 Ultra', 'Mobile Phones', 'Samsung S Series', 300000.00, 'LKR', '12GB', '256GB', 'images/S23-ultra.jpg', 'Featuring a powerful chipset and advanced display technology, the S23 Ultra ensures exceptional performance, enhanced battery endurance, and refined thermal output during heavy usage.', NULL, NULL),
(40, 'Samsung S24', 'Mobile Phones', 'Samsung S Series', 350000.00, 'LKR', '8GB', '256GB', 'images/s24.jpg', 'With its efficient Exynos/Snapdragon chipset, the S24 offers excellent battery optimization, strong CPU efficiency, and balanced graphics performance suitable for modern tasks.', NULL, NULL),
(41, 'Samsung S24 Ultra', 'Mobile Phones', 'Samsung S Series', 400000.00, 'LKR', '12GB', '256GB', 'images/s24-ultra.jpg', 'A flagship-class device offering exceptional processing speeds, high display accuracy, and strong power efficiency for prolonged high-performance workloads.', NULL, NULL),
(42, 'Samsung S25', 'Mobile Phones', 'Samsung S Series', 450000.00, 'LKR', '12GB', '256GB', 'images/s25.jpg', 'Featuring updated processing architecture, the S25 delivers efficient power usage, smooth graphics handling, and optimized thermal control suited for daily and intensive use.', NULL, NULL),
(43, 'Samsung S25 Edge', 'Mobile Phones', 'Samsung S Series', 500000.00, 'LKR', '12GB', '256GB', 'images/s25-edge.webp', 'The curved display works with a powerful chipset to deliver efficient performance, strong battery life, and reliable thermal output under continuous workloads.', NULL, NULL),
(44, 'Samsung S25 Ultra', 'Mobile Phones', 'Samsung S Series', 560000.00, 'LKR', '12GB', '256GB', 'images/s25-ultra.jpg', 'A high-end model designed for maximum performance, extended battery efficiency, and superior thermal behavior suitable for demanding professional tasks.', NULL, NULL),
(45, 'Samsung Galaxy Z Flip 4', 'Mobile Phones', 'Samsung Z Flip', 150000.00, 'LKR', '8GB', '256GB', 'images/zflip4.jpg', 'A compact foldable smartphone powered by an efficient Snapdragon processor offering stable thermal control, optimized folding display mechanics, and strong battery endurance.', NULL, NULL),
(46, 'Samsung Galaxy Z Flip 5', 'Mobile Phones', 'Samsung Z Flip', 220000.00, 'LKR', '8GB', '256GB', 'images/zflip5.jpg', 'Featuring a redesigned hinge system, upgraded processor, and energy-efficient display, the Flip 5 offers smooth performance with controlled heat output during extended use.', NULL, NULL),
(47, 'Samsung Galaxy Z Flip 6', 'Mobile Phones', 'Samsung Z Flip', 310000.00, 'LKR', '12GB', '256GB', 'images/zflip6.avif', 'Powered by the latest Snapdragon platform, the Flip 6 has enhanced battery optimization, improved thermal stability, and smoother display performance under folding stress.', NULL, NULL),
(48, 'Samsung Galaxy Fold 3', 'Mobile Phones', 'Samsung Fold', 190000.00, 'LKR', '12GB', '256GB', 'images/products/1764868882_6931c3126f78e.jpg', 'A powerful foldable device with multi-mode display optimization and efficient chipset performance. Designed for multitasking with stable energy usage and thermal output.', NULL, NULL),
(49, 'Samsung Galaxy Fold 4', 'Mobile Phones', 'Samsung Fold', 240000.00, 'LKR', '12GB', '256GB', 'images/zfold4.png', 'Featuring a flagship processor, the Fold 4 ensures high productivity through optimized battery management, improved thermal structure, and responsive dual-display usage.', NULL, NULL),
(50, 'Samsung Galaxy Fold 5', 'Mobile Phones', 'Samsung Fold', 335000.00, 'LKR', '12GB', '256GB', 'images/zfold5.jpg', 'Equipped with an efficient hinge and upgraded chipset, the Fold 5 provides strong performance, stable heat output, and extended battery endurance during heavy workflows.', NULL, NULL),
(51, 'Samsung Galaxy Fold 6', 'Mobile Phones', 'Samsung Fold', 455000.00, 'LKR', '12GB', '256GB', 'images/zfold6.png', 'A premium foldable offering upgraded thermal architecture, high-efficiency display performance, and optimized battery management ideal for advanced multitasking and productivity.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('aqa7tlJ9oiSvubRD6cDWtXNYu2osp5MwuJSZOCCy', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM3VwQkR5WVhHdXJ3czJPUzZQQlI0Vkx2YjlhbTIwNmhxbGFvQ0lBSCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1767797277),
('FBOmoGfLV39ZiEhqHwQhyel3NAx2PTgRDd8ZTCJm', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiMlJ5UWxBZFVXTHN0Y2RlMXhrYVlTRDFWYVJMdjZuc3pLQTUzTFlReCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wcm9kdWN0cyI7czo1OiJyb3V0ZSI7czoxNDoicHJvZHVjdHMuaW5kZXgiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEyJDNlTi5RWk03bmdpaFR3NTdZYTRJbi5xT1Q3RlJCdndzczY1OTBhQnVsZ2l0T0tDN1B0by95Ijt9', 1767797406);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `type` enum('admin','user') NOT NULL DEFAULT 'user',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `type`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Inesh Fernando', 'ineshfernando643@gmail.com', 'admin', NULL, '$2y$12$3eN.QZM7ngihTw57Ya4In.qOT7FRBvwss6590aBulgitOKC7Pto/y', NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-11 22:17:43', '2025-12-18 23:01:03'),
(2, 'Inesh Fernando', 'ineshfernando@gmail.com', 'user', NULL, '$2y$12$WaH0nP07TW1lyti9jyVHjODMC0ffKCk.wVpuq2UH7djvSLJ2dQbp6', NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-11 23:58:37', '2025-12-19 01:46:44'),
(10, 'Admin User', 'admin@test.com', 'admin', NULL, '$2y$12$8JCDOrp4.KpcWfzX1WVJbuRjTOSPcNGOyaHjW87nqyYZy3uS3Zv3e', NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-29 22:45:55', '2025-12-29 22:45:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accepted_orders`
--
ALTER TABLE `accepted_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

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
-- AUTO_INCREMENT for table `accepted_orders`
--
ALTER TABLE `accepted_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
