-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2020 at 11:50 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel-vue-ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `phone`, `address`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, NULL, NULL, '$2y$10$8nVKKhzj4VCmZP4seHrwHeUda340Jw5gQLzMunM0hjYps47EiPms2', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `created_at`, `updated_at`) VALUES
(52, 'Xiomi', '2020-09-05 12:18:01', '2020-09-05 12:18:01'),
(53, 'Asus', '2020-09-05 12:18:09', '2020-09-05 12:18:09'),
(54, 'Hp', '2020-09-05 12:18:18', '2020-09-05 12:18:18'),
(55, 'Adidas', '2020-09-05 12:18:58', '2020-09-05 12:18:58'),
(56, 'Cats Eye', '2020-09-05 12:19:08', '2020-09-05 12:19:08'),
(57, 'Yellow', '2020-09-05 12:19:23', '2020-09-05 12:19:23'),
(58, 'Plus Point', '2020-09-05 12:19:32', '2020-09-05 12:19:32'),
(59, 'Samsung', '2020-09-05 12:20:07', '2020-09-05 12:20:07'),
(60, 'Apple', '2020-09-05 12:20:14', '2020-09-05 12:20:14'),
(61, 'Huwai', '2020-09-05 12:21:02', '2020-09-05 12:21:02'),
(62, 'Singer', '2020-09-05 12:21:48', '2020-09-05 12:21:48'),
(63, 'Otobi', '2020-09-05 12:24:08', '2020-09-05 12:24:08');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(56, 'Shirt', '2020-09-05 12:24:23', '2020-09-05 12:24:23'),
(57, 'Pant', '2020-09-05 12:24:30', '2020-09-05 12:24:30'),
(58, 'T-shirt', '2020-09-05 12:24:37', '2020-09-05 12:24:37'),
(59, 'Cricket', '2020-09-05 12:24:44', '2020-09-05 12:24:44'),
(60, 'Football', '2020-09-05 12:24:50', '2020-09-05 12:24:50'),
(61, 'Badminton', '2020-09-05 12:25:00', '2020-09-05 12:25:00'),
(62, 'Furniture', '2020-09-05 12:25:10', '2020-09-05 12:25:10'),
(64, 'Mobile', '2020-09-05 12:25:42', '2020-09-05 12:25:42'),
(65, 'Laptop', '2020-09-05 12:25:50', '2020-09-05 12:25:50'),
(66, 'Tv', '2020-09-05 12:26:12', '2020-09-05 12:26:12'),
(67, 'Freeze', '2020-09-05 12:26:17', '2020-09-05 12:26:17'),
(68, 'Kurti', '2020-10-17 05:28:59', '2020-10-17 05:28:59'),
(69, 'Child Dress', '2020-10-17 05:30:59', '2020-10-17 05:30:59');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_07_28_043428_create_admins_table', 2),
(5, '2020_08_13_190603_create_categories_table', 3),
(6, '2020_08_17_194509_create_brands_table', 4),
(7, '2020_08_19_164048_create_products_table', 5),
(8, '2020_10_18_055600_create_wish_lists_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(8,2) DEFAULT NULL,
  `discount_price` double(8,2) DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `brand_id`, `name`, `price`, `discount_price`, `description`, `image`, `color`, `size`, `quantity`, `created_at`, `updated_at`) VALUES
(56, 64, 52, 'Redemi Note 5', 100.00, 10.00, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has', '1602930375-Xiaomi-Redmi-Note-5-Pro-6GB-RAM.webp', '[\"#000000\",\"#dddddd\",\"#FF0000\"]', '[\"m\",\"s\"]', 5, '2020-10-17 04:26:15', '2020-10-17 04:26:15'),
(57, 64, 52, 'Redmi note 6', 120.00, 100.00, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has', '1602930540-cistal_templado_xiaomi_redmi_note_6_pro_01_l.jpg', '[\"#000000\",\"#FF0000\",\"#0000FF\"]', '[\"m\"]', 5, '2020-10-17 04:29:00', '2020-10-17 04:29:00'),
(58, 64, 52, 'Redmi note 7', 200.00, 150.00, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has', '1602930646-download.jpg', '[\"#FF0000\"]', '[\"s\"]', 5, '2020-10-17 04:30:46', '2020-10-17 04:30:46'),
(59, 64, 52, 'Redmi 8', 100.00, 90.00, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has', '1602930806-download (1).jpg', '[\"#000000\"]', '[\"m\"]', 10, '2020-10-17 04:33:26', '2020-10-17 04:33:26'),
(60, 64, 60, 'Iphpne 12 pro', 400.00, 350.00, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has', '1602930977-download (2).jpg', '[\"#dddddd\",\"#FF0000\"]', '[\"s\"]', 8, '2020-10-17 04:36:17', '2020-10-17 04:36:17'),
(61, 64, 60, 'Iphone 12', 300.00, 290.00, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has', '1602931086-download (3).jpg', '[\"#000000\"]', '[\"m\"]', 12, '2020-10-17 04:38:06', '2020-10-17 04:38:06'),
(62, 64, 60, 'Iphone 10', 300.00, 287.00, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has', '1602931332-download (4).jpg', '[\"#000000\"]', '[\"m\"]', 10, '2020-10-17 04:42:12', '2020-10-17 04:42:12'),
(63, 61, 55, 'Sport Chek adidas Men\'s Grand Court Shoes - White', 50.00, 40.00, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has', '1602931681-FGL_332686112_10_a.webp', '[\"#000000\"]', '[\"m\"]', 2, '2020-10-17 04:48:01', '2020-10-17 04:48:01'),
(64, 59, 55, 'Adidas New Bat', 100.00, 90.00, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has', '1602931778-download (5).jpg', '[\"#dddddd\"]', '[\"s\"]', 5, '2020-10-17 04:49:38', '2020-10-17 04:49:38'),
(65, 65, 53, 'Asus Latest Laptop', 300.00, 289.00, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has', '1602932043-71hTP5nz5eL._SX355_.jpg', '[\"#000000\",\"#dddddd\",\"#0000FF\"]', '[\"m\",\"s\",\"xl\"]', 9, '2020-10-17 04:54:03', '2020-10-17 04:54:03'),
(66, 65, 53, 'Standard Asus Laptop', 200.00, 190.00, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has', '1602932147-71KK7OnF2iL._SL1500_.jpg', '[\"#dddddd\",\"#000000\"]', '[\"m\",\"s\"]', 6, '2020-10-17 04:55:47', '2020-10-17 04:55:47'),
(67, 65, 53, 'Asus Lapto Version 3', 200.00, 190.00, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has', '1602932205-71MAp7C-dXL._SL1500_.jpg', '[\"#000000\"]', '[\"s\"]', 5, '2020-10-17 04:56:45', '2020-10-17 04:56:45'),
(68, 65, 53, 'Asus Laptop Version 4', 200.00, 190.00, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has', '1602932310-71t-J3VJtEL._SL1500_.jpg', '[\"#000000\"]', '[\"l\"]', 5, '2020-10-17 04:58:30', '2020-10-17 04:58:30'),
(69, 56, 56, 'Gorgious Shirt', 100.00, 90.00, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has', '1602932439-g.jpg', '[\"#dddddd\",\"#000000\"]', '[\"s\",\"l\",\"sl\"]', 10, '2020-10-17 05:00:39', '2020-10-17 05:00:39'),
(70, 56, 56, 'Polo Shirt', 100.00, 90.00, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has', '1602932832-download (8).jpg', '[\"#dddddd\",\"#FF0000\"]', '[\"l\",\"sl\"]', 10, '2020-10-17 05:07:12', '2020-10-17 05:07:12'),
(71, 56, 56, 'Polo Shirt Version @', 200.00, 150.00, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has', '1602932885-shitrs-men-2018-Fashion-Men-Shirt-Long-Sleeve-Slim-Fit-Casual-Male-Shirts.jpg_q50.jpg', '[\"#dddddd\",\"#FF0000\"]', '[\"s\",\"l\"]', 12, '2020-10-17 05:08:05', '2020-10-17 05:08:05'),
(72, 56, 56, 'Polo Shirt Version 3', 200.00, 190.00, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has', '1602932944-download (7).jpg', '[\"#dddddd\",\"#FF0000\"]', '[\"l\",\"s\"]', 12, '2020-10-17 05:09:04', '2020-10-17 05:09:04'),
(73, 58, 56, 'Awesome T Shirt', 200.00, 190.00, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has', '1602932999-41mKfX3AbRL._AC_UX342_.jpg', '[\"#dddddd\",\"#FF0000\"]', '[\"l\",\"s\"]', 10, '2020-10-17 05:09:59', '2020-10-17 05:09:59'),
(74, 58, 56, 'New T Shirt', 100.00, 90.00, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has', '1602933086-61p2DzgMsFL._AC_UL1024_.jpg', '[\"#dddddd\",\"#FF0000\"]', '[\"l\",\"s\"]', 10, '2020-10-17 05:11:26', '2020-10-17 05:11:26'),
(75, 65, 54, 'Hp New Laptop v1', 200.00, 190.00, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has', '1602933213-71hTP5nz5eL._SX355_.jpg', '[\"#dddddd\",\"#000000\"]', '[\"m\",\"s\"]', 10, '2020-10-17 05:13:33', '2020-10-17 05:13:33'),
(76, 65, 54, 'Hp v2', 200.00, 190.00, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has', '1602933271-71t-J3VJtEL._SL1500_.jpg', '[\"#dddddd\",\"#FF0000\"]', '[\"l\",\"sl\"]', 10, '2020-10-17 05:14:31', '2020-10-17 05:14:31'),
(77, 65, 54, 'hp v3', 100.00, 90.00, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has', '1602933307-71MAp7C-dXL._SL1500_.jpg', '[\"#dddddd\",\"#FF0000\"]', '[\"l\",\"s\"]', 10, '2020-10-17 05:15:07', '2020-10-17 05:15:07'),
(78, 65, 54, 'hp v4', 300.00, 290.00, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has', '1602933352-71t-J3VJtEL._SL1500_.jpg', '[\"#dddddd\",\"#FF0000\"]', '[\"l\"]', 5, '2020-10-17 05:15:52', '2020-10-17 05:15:52'),
(79, 64, 61, 'Huiwa v1', 100.00, 90.00, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has', '1602933522-1663043640207003.webp', '[\"#000000\"]', '[\"m\"]', 5, '2020-10-17 05:18:42', '2020-10-17 05:18:42'),
(80, 64, 61, 'Hoiwa v2', 190.00, 167.00, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has', '1602933581-1663043882922021.jpg', '[\"#dddddd\",\"#FF0000\"]', '[\"l\",\"s\"]', 5, '2020-10-17 05:19:41', '2020-10-17 05:19:41'),
(81, 62, 63, 'New Office furniture', 100.00, 89.00, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has', '1602933670-1663044663831940.jpg', '[\"#000000\",\"#dddddd\"]', '[\"l\"]', 2, '2020-10-17 05:21:10', '2020-10-17 05:21:10'),
(82, 62, 63, 'Bed Furniture', 200.00, 190.00, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has', '1602933713-1663044785588807.jpg', '[\"#dddddd\",\"#FF0000\"]', '[\"s\"]', 5, '2020-10-17 05:21:53', '2020-10-17 05:21:53'),
(83, 62, 63, 'New Stylish Table', 100.00, 90.00, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has', '1602933765-1663044883453421.jpg', '[\"#dddddd\"]', '[\"s\"]', 2, '2020-10-17 05:22:45', '2020-10-17 05:22:45'),
(84, 57, 58, 'New pant v1', 100.00, 80.00, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has', '1602933821-1663046528909599.jpg', '[\"#dddddd\",\"#000000\"]', '[\"l\",\"m\"]', 4, '2020-10-17 05:23:41', '2020-10-17 05:23:41'),
(85, 62, 58, 'Pant v2', 100.00, 90.00, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has', '1602933882-1663046528909599.jpg', '[\"#dddddd\",\"#FF0000\"]', '[\"l\"]', 5, '2020-10-17 05:24:42', '2020-10-17 05:24:42'),
(86, 67, 59, 'Samsung Freeze', 399.00, 320.00, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has', '1602933955-1663044562869706.png', '[\"#dddddd\",\"#FF0000\"]', '[\"l\",\"s\"]', 10, '2020-10-17 05:25:55', '2020-10-17 05:25:55'),
(87, 64, 59, 'Samsung New Mobile', 200.00, 190.00, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has', '1602933995-1662944139859099 - Copy - Copy.jpg', '[\"#dddddd\",\"#FF0000\"]', '[\"l\",\"s\"]', 5, '2020-10-17 05:26:35', '2020-10-17 05:26:35'),
(88, 68, 57, 'Kurti v1', 200.00, 190.00, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has', '1602934188-1663046815138722.webp', '[\"#dddddd\",\"#FF0000\"]', '[\"s\",\"l\"]', 3, '2020-10-17 05:29:48', '2020-10-17 05:29:48'),
(89, 68, 57, 'Kurti v2', 250.00, 230.00, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has', '1602934237-1663046815138722.webp', '[\"#dddddd\",\"#FF0000\"]', '[\"l\"]', 100, '2020-10-17 05:30:37', '2020-10-17 05:30:37'),
(90, 69, 57, 'Child Frog New', 100.00, 90.00, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has', '1602934310-1663046241795102.jpg', '[\"#dddddd\",\"#FF0000\"]', '[\"s\",\"m\"]', 5, '2020-10-17 05:31:50', '2020-10-17 05:31:50'),
(91, 69, 57, 'Child dress v2', 200.00, 100.00, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has', '1602934360-1663046242209833.jpg', '[\"#dddddd\",\"#FF0000\"]', '[\"l\",\"s\"]', 5, '2020-10-17 05:32:40', '2020-10-17 05:32:40'),
(92, 61, 55, 'Badminton Stylish bat', 100.00, 80.00, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has', '1602934452-1663043360173393.png', '[\"#dddddd\",\"#FF0000\"]', '[\"l\",\"s\"]', 5, '2020-10-17 05:34:12', '2020-10-17 05:34:12');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `address`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(5, 'Nam deserunt esse q', 'user@gmail.com', '79', 'Amet voluptatem nul', NULL, '$2y$10$8nVKKhzj4VCmZP4seHrwHeUda340Jw5gQLzMunM0hjYps47EiPms2', NULL, '2020-07-26 00:49:41', '2020-07-26 00:49:41'),
(6, 'Ashton Zieme', 'gutmann.summer@example.com', NULL, NULL, '2020-08-17 22:07:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'AljvCb1j5f', '2020-08-17 22:07:36', '2020-08-17 22:07:36'),
(7, 'Myrtice Hahn PhD', 'hermiston.brennan@example.net', NULL, NULL, '2020-08-17 22:07:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '9DyQbaNwhl', '2020-08-17 22:07:37', '2020-08-17 22:07:37'),
(8, 'Kaleb Murazik', 'georgianna.wyman@example.org', NULL, NULL, '2020-08-17 22:07:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'FHAYdh4sDm', '2020-08-17 22:07:37', '2020-08-17 22:07:37'),
(9, 'Miss Ida Mitchell', 'robert83@example.com', NULL, NULL, '2020-08-17 22:07:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'gzIqDIexBk', '2020-08-17 22:07:37', '2020-08-17 22:07:37'),
(10, 'Orpha Upton', 'alvina.waters@example.org', NULL, NULL, '2020-08-17 22:07:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Obs3ijIcpf', '2020-08-17 22:07:37', '2020-08-17 22:07:37'),
(11, 'Miss Samanta Nicolas', 'kadin83@example.com', NULL, NULL, '2020-08-17 22:07:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'tGZyC8oq57', '2020-08-17 22:07:37', '2020-08-17 22:07:37'),
(12, 'Lavinia Koch', 'dietrich.cara@example.com', NULL, NULL, '2020-08-17 22:07:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'm5Nxw4TIV8', '2020-08-17 22:07:37', '2020-08-17 22:07:37'),
(13, 'Freeda Klein', 'considine.jessika@example.com', NULL, NULL, '2020-08-17 22:07:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'pnWNH97udc', '2020-08-17 22:07:37', '2020-08-17 22:07:37'),
(14, 'Rachael Zulauf Sr.', 'hessel.mac@example.net', NULL, NULL, '2020-08-17 22:07:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '9F4POnu2Aq', '2020-08-17 22:07:37', '2020-08-17 22:07:37'),
(15, 'Emmanuel Herzog MD', 'qziemann@example.net', NULL, NULL, '2020-08-17 22:07:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2NRgIJnXEk', '2020-08-17 22:07:37', '2020-08-17 22:07:37'),
(16, 'Mrs. Roxane Runte', 'tessie32@example.com', NULL, NULL, '2020-08-17 22:07:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2MIvIrh6U3', '2020-08-17 22:07:37', '2020-08-17 22:07:37'),
(17, 'Loraine Fadel Jr.', 'schinner.corbin@example.com', NULL, NULL, '2020-08-17 22:07:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'XoNKwahqHp', '2020-08-17 22:07:37', '2020-08-17 22:07:37'),
(18, 'Ilene O\'Reilly', 'dach.cayla@example.com', NULL, NULL, '2020-08-17 22:07:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'WYLGEWu0aG', '2020-08-17 22:07:37', '2020-08-17 22:07:37'),
(19, 'Buster Paucek', 'joanie66@example.com', NULL, NULL, '2020-08-17 22:07:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'WcnuJm2dv7', '2020-08-17 22:07:37', '2020-08-17 22:07:37'),
(20, 'Pink Stanton PhD', 'ford.rolfson@example.org', NULL, NULL, '2020-08-17 22:07:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'CRd25LZYeE', '2020-08-17 22:07:37', '2020-08-17 22:07:37'),
(21, 'Teagan Daugherty', 'kaley.heaney@example.org', NULL, NULL, '2020-08-17 22:07:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2lkgDtE9dZ', '2020-08-17 22:07:37', '2020-08-17 22:07:37'),
(22, 'Aryanna Pouros', 'qdurgan@example.com', NULL, NULL, '2020-08-17 22:07:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'xcd7bCi0bp', '2020-08-17 22:07:37', '2020-08-17 22:07:37'),
(23, 'Ms. Mona Jenkins', 'wbashirian@example.org', NULL, NULL, '2020-08-17 22:07:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'WR2q0IWT4p', '2020-08-17 22:07:37', '2020-08-17 22:07:37'),
(24, 'Adeline Kuhlman IV', 'devyn30@example.net', NULL, NULL, '2020-08-17 22:07:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'YR0d5BXU9B', '2020-08-17 22:07:37', '2020-08-17 22:07:37'),
(25, 'Joaquin Dickens', 'jeremie15@example.org', NULL, NULL, '2020-08-17 22:07:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'jmEEfDT4p9', '2020-08-17 22:07:37', '2020-08-17 22:07:37'),
(26, 'Ashleigh Glover', 'lennie33@example.org', NULL, NULL, '2020-08-17 22:07:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Aw9uugnWij', '2020-08-17 22:07:37', '2020-08-17 22:07:37'),
(27, 'Miss Anya Carroll II', 'jackeline.hettinger@example.org', NULL, NULL, '2020-08-17 22:07:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'WI95in2K9M', '2020-08-17 22:07:37', '2020-08-17 22:07:37'),
(28, 'Griffin Bartoletti', 'ahmad58@example.net', NULL, NULL, '2020-08-17 22:07:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'EDzoOTWTvL', '2020-08-17 22:07:37', '2020-08-17 22:07:37'),
(29, 'Dr. Vernie Berge Sr.', 'bauch.bart@example.com', NULL, NULL, '2020-08-17 22:07:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'GyieRLUekO', '2020-08-17 22:07:37', '2020-08-17 22:07:37'),
(30, 'Aaron Fritsch', 'faufderhar@example.org', NULL, NULL, '2020-08-17 22:07:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'IePQjlw7Uk', '2020-08-17 22:07:37', '2020-08-17 22:07:37'),
(31, 'Jarvis Reynolds Jr.', 'lucinda82@example.net', NULL, NULL, '2020-08-17 22:07:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'RCioRJ5BGC', '2020-08-17 22:07:37', '2020-08-17 22:07:37'),
(32, 'Michael Marvin', 'beahan.guiseppe@example.com', NULL, NULL, '2020-08-17 22:07:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'DesDwsXWap', '2020-08-17 22:07:37', '2020-08-17 22:07:37'),
(33, 'Giles Goldner', 'kitty.jaskolski@example.net', NULL, NULL, '2020-08-17 22:07:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'PSxSR6ysLW', '2020-08-17 22:07:37', '2020-08-17 22:07:37'),
(34, 'Rupert Hirthe', 'enrique.pfeffer@example.org', NULL, NULL, '2020-08-17 22:07:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'xpcYB2zUC2', '2020-08-17 22:07:37', '2020-08-17 22:07:37'),
(35, 'Charles Pacocha', 'jaeden.turcotte@example.net', NULL, NULL, '2020-08-17 22:07:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vu6hUT25MI', '2020-08-17 22:07:37', '2020-08-17 22:07:37'),
(36, 'Rusty Keeling', 'sasha.beatty@example.net', NULL, NULL, '2020-08-17 22:07:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'hP1vbpXL1H', '2020-08-17 22:07:37', '2020-08-17 22:07:37'),
(37, 'Mr. Caden Renner', 'duncan79@example.org', NULL, NULL, '2020-08-17 22:07:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'TW2GR65P82', '2020-08-17 22:07:37', '2020-08-17 22:07:37'),
(38, 'Ben Langworth', 'francisca.towne@example.net', NULL, NULL, '2020-08-17 22:07:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'CP6PySU0EB', '2020-08-17 22:07:37', '2020-08-17 22:07:37'),
(39, 'Elnora Hagenes', 'friedrich.jacobson@example.org', NULL, NULL, '2020-08-17 22:07:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'an3CE4ftk1', '2020-08-17 22:07:37', '2020-08-17 22:07:37'),
(40, 'Stuart Mraz', 'carter.dejuan@example.net', NULL, NULL, '2020-08-17 22:07:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'jWOFmWwigY', '2020-08-17 22:07:37', '2020-08-17 22:07:37'),
(41, 'Kristina Crooks', 'glowe@example.net', NULL, NULL, '2020-08-17 22:07:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Xe2iCXqfOb', '2020-08-17 22:07:37', '2020-08-17 22:07:37'),
(42, 'Mya Nader', 'jwisozk@example.com', NULL, NULL, '2020-08-17 22:07:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'jE6vxse2zg', '2020-08-17 22:07:37', '2020-08-17 22:07:37'),
(43, 'Rodrick Hilpert DDS', 'bvandervort@example.org', NULL, NULL, '2020-08-17 22:07:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'mzfNoWJAca', '2020-08-17 22:07:37', '2020-08-17 22:07:37'),
(44, 'Alaina Rutherford III', 'walton.littel@example.net', NULL, NULL, '2020-08-17 22:07:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'DarDcEmpRL', '2020-08-17 22:07:37', '2020-08-17 22:07:37'),
(45, 'Prof. Luis Kunze II', 'pamela.reinger@example.com', NULL, NULL, '2020-08-17 22:07:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'UXyg44txiG', '2020-08-17 22:07:37', '2020-08-17 22:07:37'),
(46, 'Orie Emard', 'laurianne.gorczany@example.com', NULL, NULL, '2020-08-17 22:07:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'C45XvZBtGG', '2020-08-17 22:07:37', '2020-08-17 22:07:37'),
(47, 'Chesley Marks', 'else.franecki@example.net', NULL, NULL, '2020-08-17 22:07:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'joPNDywq4R', '2020-08-17 22:07:37', '2020-08-17 22:07:37'),
(48, 'Domenic Beer', 'derrick.pfannerstill@example.org', NULL, NULL, '2020-08-17 22:07:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'q0fFGnu1a7', '2020-08-17 22:07:37', '2020-08-17 22:07:37'),
(49, 'Serena Miller', 'uroberts@example.net', NULL, NULL, '2020-08-17 22:07:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'n40GJdeX07', '2020-08-17 22:07:37', '2020-08-17 22:07:37'),
(50, 'Anna Hane III', 'fconn@example.com', NULL, NULL, '2020-08-17 22:07:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'dUyKktsiK8', '2020-08-17 22:07:37', '2020-08-17 22:07:37'),
(51, 'Sterling Harvey', 'dblanda@example.com', NULL, NULL, '2020-08-17 22:07:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '4R0SUxghQ1', '2020-08-17 22:07:37', '2020-08-17 22:07:37'),
(52, 'Aimee Carter', 'adell.pouros@example.com', NULL, NULL, '2020-08-17 22:07:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'anPizafLI6', '2020-08-17 22:07:37', '2020-08-17 22:07:37'),
(53, 'Tony Will', 'lafayette48@example.com', NULL, NULL, '2020-08-17 22:07:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ch7lUCHQRu', '2020-08-17 22:07:37', '2020-08-17 22:07:37'),
(54, 'Dr. Waylon Wolff DDS', 'xmertz@example.net', NULL, NULL, '2020-08-17 22:07:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '6kv78907JD', '2020-08-17 22:07:37', '2020-08-17 22:07:37'),
(55, 'Myles Murazik III', 'jewell32@example.org', NULL, NULL, '2020-08-17 22:07:36', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'GtgBbbFk4o', '2020-08-17 22:07:37', '2020-08-17 22:07:37');

-- --------------------------------------------------------

--
-- Table structure for table `wish_lists`
--

CREATE TABLE `wish_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wish_lists`
--

INSERT INTO `wish_lists` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 5, 92, '2020-10-18 02:16:06', '2020-10-18 02:16:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wish_lists`
--
ALTER TABLE `wish_lists`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `wish_lists`
--
ALTER TABLE `wish_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
