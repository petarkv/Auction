-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 09, 2020 at 08:21 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `auction_online`
--

-- --------------------------------------------------------

--
-- Table structure for table `auction`
--

CREATE TABLE `auction` (
  `auction_id` int(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `title` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `starting_price` decimal(20,2) NOT NULL,
  `starts_at` date NOT NULL,
  `ends_at` date NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `category_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `auction`
--

INSERT INTO `auction` (`auction_id`, `created_at`, `title`, `description`, `starting_price`, `starts_at`, `ends_at`, `is_active`, `category_id`, `user_id`) VALUES
(1, '2020-03-18 19:53:48', 'The Scream - Edvard Munch', 'Oil on Canvas ', '1200000.00', '2020-03-05', '2020-03-25', 1, 2, 1),
(2, '2020-03-17 12:10:17', 'The Starry Night - Vincent Van Gogh\r\n', 'Post-Impressionism,  Oil on Canvas  ', '2300000.00', '2020-03-06', '2020-03-13', 1, 2, 1),
(3, '2020-03-17 12:10:29', 'Lovac u zitu', 'Pobuna...', '985.50', '2020-03-10', '2020-03-18', 1, 1, 10),
(4, '2020-03-18 18:08:39', 'Proba11', 'Ne ide', '562.00', '2020-03-18', '2020-03-25', 0, 1, 10),
(5, '2020-03-18 23:11:05', 'Proba666', 'Ajde kreni', '625.00', '2020-03-18', '2020-04-01', 0, 4, 10),
(6, '2020-03-18 19:09:19', 'Casovnik', 'Neprocenjivo', '98563225.00', '2020-03-18', '2020-03-25', 0, 6, 1),
(7, '2020-03-19 00:18:55', 'Knjiga666', 'Evil', '666.00', '2020-03-19', '2020-04-01', 0, 9, 10);

-- --------------------------------------------------------

--
-- Table structure for table `auction_view`
--

CREATE TABLE `auction_view` (
  `auction_view_id` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `auction_id` int(10) NOT NULL,
  `ip_address` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `auction_view`
--

INSERT INTO `auction_view` (`auction_view_id`, `created_at`, `auction_id`, `ip_address`, `user_agent`) VALUES
(1, '2020-03-08 15:23:33', 2, '::1', 'Firefox'),
(2, '2020-03-08 15:23:37', 2, '::1', 'Firefox'),
(3, '2020-03-08 15:23:39', 2, '::1', 'Firefox'),
(4, '2020-03-08 15:24:15', 2, '127.0.0.1', 'Firefox'),
(5, '2020-03-08 15:24:27', 1, '127.0.0.1', 'Firefox'),
(6, '2020-03-08 15:25:19', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0'),
(7, '2020-03-08 15:25:44', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0'),
(8, '2020-03-08 17:14:59', 1, '127.0.0.1', 'Chrome'),
(23, '2020-03-08 18:31:16', 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0'),
(24, '2020-03-09 09:24:25', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0'),
(25, '2020-03-09 09:24:35', 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0'),
(26, '2020-03-09 09:42:41', 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0'),
(27, '2020-03-09 09:42:42', 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0'),
(28, '2020-03-09 09:42:48', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0'),
(29, '2020-03-09 13:57:15', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0'),
(30, '2020-03-10 10:59:42', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0'),
(31, '2020-03-10 10:59:57', 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0'),
(32, '2020-03-10 11:04:49', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0'),
(33, '2020-03-10 11:05:00', 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0'),
(34, '2020-03-10 11:05:40', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0'),
(35, '2020-03-10 11:07:01', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0'),
(36, '2020-03-10 11:07:08', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0'),
(37, '2020-03-10 12:45:22', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0'),
(38, '2020-03-10 14:30:01', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0'),
(39, '2020-03-10 17:17:52', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0'),
(40, '2020-03-10 18:19:25', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0'),
(41, '2020-03-10 18:20:21', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0'),
(42, '2020-03-10 18:21:13', 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0'),
(43, '2020-03-10 19:28:39', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0'),
(44, '2020-03-11 11:43:58', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(45, '2020-03-11 11:45:55', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(46, '2020-03-11 11:49:22', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(47, '2020-03-11 11:50:17', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(48, '2020-03-11 11:50:18', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(49, '2020-03-11 11:50:20', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(50, '2020-03-11 11:59:13', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(51, '2020-03-11 12:00:57', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(52, '2020-03-11 12:01:55', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(53, '2020-03-11 12:03:34', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(54, '2020-03-11 12:04:14', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(55, '2020-03-11 12:04:40', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(56, '2020-03-11 12:07:36', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(57, '2020-03-11 12:07:37', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(58, '2020-03-11 12:07:38', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(59, '2020-03-11 12:07:39', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(60, '2020-03-11 12:08:30', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(61, '2020-03-11 12:14:37', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(62, '2020-03-11 12:14:39', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(63, '2020-03-11 12:20:47', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(64, '2020-03-11 12:20:54', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(65, '2020-03-11 12:20:55', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(66, '2020-03-11 12:20:55', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(67, '2020-03-11 12:20:56', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(68, '2020-03-11 12:20:56', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(69, '2020-03-11 12:20:57', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(70, '2020-03-11 12:20:57', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(71, '2020-03-11 12:20:58', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(72, '2020-03-11 12:20:59', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(73, '2020-03-11 12:20:59', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(74, '2020-03-11 12:29:29', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(75, '2020-03-11 12:29:50', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(76, '2020-03-11 12:29:52', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(77, '2020-03-11 12:29:53', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(78, '2020-03-11 12:29:55', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(79, '2020-03-11 12:29:56', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(80, '2020-03-11 12:32:44', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(81, '2020-03-11 12:32:46', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(82, '2020-03-11 12:32:47', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(83, '2020-03-11 13:01:40', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(84, '2020-03-11 13:02:57', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(85, '2020-03-11 16:56:29', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(86, '2020-03-11 16:56:31', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(87, '2020-03-11 16:56:32', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(88, '2020-03-11 16:56:43', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(89, '2020-03-11 16:57:08', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(90, '2020-03-11 16:59:16', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(91, '2020-03-11 16:59:18', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(92, '2020-03-11 16:59:19', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(93, '2020-03-11 17:02:12', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(94, '2020-03-11 17:02:13', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(95, '2020-03-11 17:02:14', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(96, '2020-03-11 17:03:26', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(97, '2020-03-11 17:03:44', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(98, '2020-03-11 21:42:10', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(99, '2020-03-11 21:44:58', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(100, '2020-03-11 22:19:40', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(101, '2020-03-11 22:22:32', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(102, '2020-03-11 22:22:54', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(103, '2020-03-11 22:23:37', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(104, '2020-03-11 22:23:54', 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(105, '2020-03-11 22:24:55', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(106, '2020-03-11 22:25:13', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(107, '2020-03-11 22:25:14', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(108, '2020-03-11 22:25:19', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(109, '2020-03-11 22:33:36', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(110, '2020-03-12 07:37:50', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(111, '2020-03-12 15:35:59', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(112, '2020-03-12 16:03:39', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(113, '2020-03-12 16:09:58', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(114, '2020-03-12 16:10:21', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(115, '2020-03-12 22:00:35', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(116, '2020-03-12 22:06:32', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(117, '2020-03-13 00:22:39', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(118, '2020-03-13 01:06:45', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(119, '2020-03-13 01:08:10', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(120, '2020-03-13 01:08:11', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(121, '2020-03-15 00:37:59', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(122, '2020-03-15 00:39:14', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(123, '2020-03-15 00:44:15', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(124, '2020-03-15 00:48:50', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(125, '2020-03-15 00:49:15', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(126, '2020-03-15 00:49:21', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(127, '2020-03-15 00:50:29', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(128, '2020-03-15 16:46:42', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(129, '2020-03-15 16:57:01', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(130, '2020-03-16 11:44:01', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(131, '2020-03-16 12:39:32', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(132, '2020-03-16 12:48:10', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(133, '2020-03-16 12:50:36', 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(134, '2020-03-16 12:50:53', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(135, '2020-03-16 12:56:39', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(136, '2020-03-17 11:41:04', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(137, '2020-03-17 11:41:10', 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(138, '2020-03-17 11:55:37', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(139, '2020-03-17 12:01:27', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(140, '2020-03-17 15:29:44', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(141, '2020-03-17 15:48:15', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(142, '2020-03-17 21:14:22', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(143, '2020-03-17 21:15:23', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(144, '2020-03-17 22:06:40', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(145, '2020-03-17 22:06:53', 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(146, '2020-03-17 22:07:16', 2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(147, '2020-03-17 22:07:23', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(148, '2020-03-17 22:07:29', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(149, '2020-03-17 22:07:33', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(150, '2020-03-18 18:35:48', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(151, '2020-03-18 19:09:32', 6, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(152, '2020-03-18 21:53:13', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(153, '2020-03-18 21:53:35', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(154, '2020-03-18 23:11:19', 5, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(155, '2020-03-18 23:11:31', 5, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(156, '2020-03-27 20:59:07', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(157, '2020-03-29 21:43:11', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(158, '2020-03-31 20:37:54', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(159, '2020-03-31 20:38:24', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0'),
(160, '2020-03-31 20:55:18', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(10) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `name`) VALUES
(1, 'Antiques'),
(2, 'Art'),
(3, 'Numismatics'),
(4, 'Sculptures'),
(5, 'Toys'),
(6, 'Clocks'),
(7, 'Clothes'),
(8, 'Jewelry'),
(9, 'Books');

-- --------------------------------------------------------

--
-- Table structure for table `offer`
--

CREATE TABLE `offer` (
  `offer_id` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `auction_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `price` double(20,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `offer`
--

INSERT INTO `offer` (`offer_id`, `created_at`, `auction_id`, `user_id`, `price`) VALUES
(1, '2020-03-04 23:00:00', 1, 2, 2000000.00),
(2, '2020-03-04 23:00:00', 1, 1, 2100000.00),
(3, '2020-03-04 23:00:00', 1, 2, 2200000.00);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `forename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `created_at`, `username`, `password`, `email`, `forename`, `surname`, `is_active`) VALUES
(1, '2020-03-17 11:31:12', 'peca', '$2y$10$7xVQu/ZVZ.KoQCDqZ9BEl.9qF5KkieG8M.zCawLgqV1loQGmkfMKG', 'peca@gmail.com', 'Petar', 'Stankovic', 1),
(2, '2020-03-02 23:00:00', 'neca', '123456', 'neca@gmail.com', 'Nemanja', 'Milosavljevic', 1),
(3, '2020-03-11 20:43:18', 'peconi', '$2y$10$9tMnxNVhbSoJfloeLZdNsuCJECr7/Ge1HtuiyJ4hWmV', 'proba@gmail.com', 'Peca', 'Punker', 0),
(5, '2020-03-11 22:29:58', 'proba', '123456', 'probaaa@gmail.com', 'Proba', 'Proba', 0),
(6, '2020-03-11 23:23:35', 'aa', '$2y$10$pxnPyEIyA36B3oZvUYXK9.Iu3w0ylvWVbIijzcO3qVq', 'aa@gmail.com', 'aa', 'bb', 0),
(8, '2020-03-12 13:23:33', 'dd', '$2y$10$gxGPXzsknL.7xgj8oAbbLeyt/Y2jkKs1pkSp0G0.ppFXv7EjksUD.', 'dd@gmail.com', 'Dylan', 'Dog', 0),
(9, '2020-03-12 13:34:20', 'gruco', '$2y$10$iDpAEm9yxHlERL4UqSEZLO5XpxyUaTMypWniAjZJME1Pk2B1TkgGe', 'gruco@proba.rs', 'Gruco', 'Marks', 0),
(10, '2020-03-17 12:21:30', 'zagor', '$2y$10$7xVQu/ZVZ.KoQCDqZ9BEl.9qF5KkieG8M.zCawLgqV1loQGmkfMKG', 'zagor@proba.rs', 'Zagor', 'Tenej', 1),
(11, '2020-03-17 12:03:10', 'dd666', '$2y$10$v6AlQAb25XrLKWk9WsIQoOmfpnJUX.eJfhaYic17oF9qIyynGmU02', 'dd666@gmail.com', 'Dylan', 'Dog', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auction`
--
ALTER TABLE `auction`
  ADD PRIMARY KEY (`auction_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `auction_view`
--
ALTER TABLE `auction_view`
  ADD PRIMARY KEY (`auction_view_id`),
  ADD KEY `auction_id` (`auction_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `offer`
--
ALTER TABLE `offer`
  ADD PRIMARY KEY (`offer_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `auction_id` (`auction_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auction`
--
ALTER TABLE `auction`
  MODIFY `auction_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `auction_view`
--
ALTER TABLE `auction_view`
  MODIFY `auction_view_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `offer`
--
ALTER TABLE `offer`
  MODIFY `offer_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auction`
--
ALTER TABLE `auction`
  ADD CONSTRAINT `auction_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auction_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `auction_view`
--
ALTER TABLE `auction_view`
  ADD CONSTRAINT `auction_view_ibfk_1` FOREIGN KEY (`auction_id`) REFERENCES `auction` (`auction_id`) ON UPDATE CASCADE;

--
-- Constraints for table `offer`
--
ALTER TABLE `offer`
  ADD CONSTRAINT `offer_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `offer_ibfk_2` FOREIGN KEY (`auction_id`) REFERENCES `auction` (`auction_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
