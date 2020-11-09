-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2020 at 08:31 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `social_network`
--

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_content` varchar(255) NOT NULL,
  `upload_image` varchar(255) NOT NULL,
  `post_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `user_id`, `post_content`, `upload_image`, `post_date`) VALUES
(1, 1, 'hii', '', '2020-11-08 13:41:50'),
(2, 1, 'No', '2020-11-05 (2).png.67', '2020-11-08 13:42:09'),
(3, 1, 'harsh', '2019-08-15 (1).png.82', '2020-11-09 18:09:12'),
(4, 2, 'Hii', '2019-08-13.png.67', '2020-11-09 18:13:43'),
(5, 2, 'Hii', '2019-08-13.png.45', '2020-11-09 18:13:43'),
(6, 2, 'Hii', '', '2020-11-09 18:24:34'),
(7, 3, 'Hii\r\n', '', '2020-11-09 18:28:29'),
(8, 3, 'Hii', '2019-07-27 (1).png.93', '2020-11-09 18:28:49'),
(9, 4, 'Hii Guyzz!!\r\n', '2019-07-27.png.15', '2020-11-09 18:30:01'),
(12, 5, 'Hey!', '', '2020-11-09 19:03:54');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `f_name` text NOT NULL,
  `l_name` text NOT NULL,
  `user_name` text NOT NULL,
  `describe_user` text NOT NULL,
  `Relationship` text NOT NULL,
  `user_pass` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_country` text NOT NULL,
  `user_gender` text NOT NULL,
  `user_birthday` date NOT NULL,
  `user_image` varchar(255) NOT NULL,
  `user_cover` varchar(255) NOT NULL,
  `user_reg_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` text NOT NULL,
  `posts` text NOT NULL,
  `recovery_account` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `f_name`, `l_name`, `user_name`, `describe_user`, `Relationship`, `user_pass`, `user_email`, `user_country`, `user_gender`, `user_birthday`, `user_image`, `user_cover`, `user_reg_date`, `status`, `posts`, `recovery_account`) VALUES
(1, 'Harsh', 'Patel', 'harsh_patel_31028', 'Hello Coding Cafe.This is my default status!', '...', 'harsh1512', 'harsh@gmail.com', 'India', 'Male', '2020-12-15', '2020-11-06.png.39', 'default_cover.jpg', '2020-11-07 11:12:07', 'verified', 'yes', 'Iwanttoputading intheuniverse.'),
(2, 'Harsh', 'PAtel', 'harsh_patel_928814', 'Hello Coding Cafe.This is my default status!', '...', 'Harsh1512', 'harsh1@gmail.com', 'India', 'Male', '2020-12-15', 'head_sun_flower.png', 'default_cover.jpg', '2020-11-09 18:10:34', 'verified', 'yes', 'Iwanttoputading intheuniverse.'),
(3, 'Mihir', 'Parmar', 'mihir_parmar_843750', 'Hello Coding Cafe.This is my default status!', '...', 'mihir1911', 'mihir@gmail.com', 'India', 'Male', '2020-02-17', 'head_turqoise.png', 'default_cover.jpg', '2020-11-09 18:28:11', 'verified', 'yes', 'Iwanttoputading intheuniverse.'),
(4, 'Mihir', 'Parmar', 'mihir_parmar_148862', 'Hello Coding Cafe.This is my default status!', '...', 'mihir1911', 'mihir1@gmail.com', 'India', 'Male', '2020-11-19', 'head_red.png', 'default_cover.jpg', '2020-11-09 18:29:36', 'verified', 'yes', 'Iwanttoputading intheuniverse.'),
(5, 'Tanuj', 'Patel', 'tanuj_patel_444925', 'Hello Coding Cafe.This is my default status!', '...', 'tanuj1805', 'tanuj@gmail.com', 'India', 'Male', '2020-05-18', 'head_sun_flower.png', 'default_cover.jpg', '2020-11-09 18:59:51', 'verified', 'yes', 'Iwanttoputading intheuniverse.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
