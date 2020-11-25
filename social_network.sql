-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2020 at 06:17 AM
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
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `com_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `comment_author` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`com_id`, `post_id`, `user_id`, `comment`, `comment_author`, `date`) VALUES
(1, 3, 2, 'amazing', 'mihir_parmar_745616', '2020-11-17 07:41:58'),
(2, 4, 2, 'Hey', 'mihir_parmar_745616', '2020-11-24 10:16:01');

-- --------------------------------------------------------

--
-- Table structure for table `friends`
--

CREATE TABLE `friends` (
  `user_id` int(10) NOT NULL,
  `friend_id` int(10) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `like`
--

CREATE TABLE `like` (
  `user_id` varchar(11) NOT NULL,
  `post_id` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `like`
--

INSERT INTO `like` (`user_id`, `post_id`) VALUES
('1', '2'),
('2', '1'),
('1', '4'),
('2', '5'),
('2', '4'),
('2', '5'),
('2', '4'),
('2', '5'),
('2', '4'),
('2', '5'),
('2', '4'),
('2', '8'),
('2', '5'),
('2', '4'),
('', '11'),
('2', '11'),
('2', '8'),
('2', '5'),
('2', '4'),
('', '12'),
('', '11'),
('', '8'),
('', '5');

--
-- Triggers `like`
--
DELIMITER $$
CREATE TRIGGER `update_no_of_likes` AFTER INSERT ON `like` FOR EACH ROW UPDATE `Posts`
SET no_of_likes = no_of_likes + 1
WHERE post_Id = new.post_Id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_content` varchar(255) NOT NULL,
  `upload_image` varchar(255) NOT NULL,
  `post_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `no_of_likes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `user_id`, `post_content`, `upload_image`, `post_date`, `no_of_likes`) VALUES
(4, 2, 'Hello !!', '', '2020-11-18 06:30:52', 7),
(5, 2, 'How are you ?', '', '2020-11-18 06:31:14', 7),
(8, 2, 'No', 'Screenshot (18).png.71', '2020-11-18 12:15:56', 3),
(11, 2, 'Hii', '2019-10-07 (4).png.100', '2020-11-24 18:12:31', 3),
(12, 1, 'Hey there!!', '2020-11-24 (8).png.29', '2020-11-24 18:50:21', 1);

--
-- Triggers `posts`
--
DELIMITER $$
CREATE TRIGGER `delete_no_of_posts` AFTER DELETE ON `posts` FOR EACH ROW UPDATE `users`
SET no_of_posts = no_of_posts - 1
WHERE user_id  = old.user_id
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_no_of_posts` AFTER INSERT ON `posts` FOR EACH ROW UPDATE `users`
SET no_of_posts = no_of_posts + 1
WHERE user_id = new.user_id
$$
DELIMITER ;

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
  `recovery_account` varchar(255) NOT NULL,
  `no_of_posts` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `f_name`, `l_name`, `user_name`, `describe_user`, `Relationship`, `user_pass`, `user_email`, `user_country`, `user_gender`, `user_birthday`, `user_image`, `user_cover`, `user_reg_date`, `status`, `posts`, `recovery_account`, `no_of_posts`) VALUES
(1, 'Harsh', 'Patel', 'harsh_patel_736619', 'Hello Coding Cafe.This is my default status!', '...', 'harsh1512', 'harsh@gmail.com', 'India', 'Male', '2020-12-15', '2020-01-04 (1).png.11', 'default_cover.jpg', '2020-11-17 06:55:55', 'verified', 'yes', 'Iwanttoputading intheuniverse.', 1),
(2, 'Mihir', 'Parmar', 'mihir_parmar_1911', 'Hello Coding Cafe.This is my default status!', 'Single', 'mihir1911', 'mihir@gmail.com', 'India', 'Male', '2020-11-19', '2020-11-11 (8).png.30', 'default_cover.jpg', '2020-11-17 06:56:40', 'verified', 'yes', 'Nang', 4);

-- --------------------------------------------------------

--
-- Table structure for table `user_messages`
--

CREATE TABLE `user_messages` (
  `id` int(11) NOT NULL,
  `user_to` int(11) NOT NULL,
  `user_from` int(11) NOT NULL,
  `msg_body` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `msg_seen` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_messages`
--

INSERT INTO `user_messages` (`id`, `user_to`, `user_from`, `msg_body`, `date`, `msg_seen`) VALUES
(1, 4, 1, '							Hello		', '2020-11-12 06:32:22', 'no'),
(2, 3, 1, '									Hello\r\n', '2020-11-12 07:00:38', 'no'),
(3, 3, 1, '						Hii			', '2020-11-12 07:01:00', 'no'),
(4, 3, 1, '									there', '2020-11-12 07:02:40', 'no'),
(5, 3, 1, '									there', '2020-11-12 07:02:45', 'no'),
(6, 1, 3, '									Hii', '2020-11-12 07:02:58', 'no'),
(7, 1, 3, '								hii	', '2020-11-12 07:07:28', 'no'),
(8, 3, 1, '									hey\r\n', '2020-11-12 07:10:40', 'no'),
(9, 3, 1, '									there', '2020-11-12 07:10:44', 'no'),
(10, 3, 1, '									how', '2020-11-12 07:10:49', 'no'),
(11, 3, 1, '									how', '2020-11-12 07:12:19', 'no'),
(12, 3, 1, '									how', '2020-11-12 07:12:23', 'no'),
(13, 2, 1, '						Hii Nang			', '2020-11-24 18:52:22', 'no'),
(14, 2, 1, '									', '2020-11-24 18:52:23', 'no'),
(15, 1, 2, '									Hii ', '2020-11-24 19:09:10', 'no'),
(16, 1, 2, '									Hii again', '2020-11-24 19:14:40', 'no'),
(17, 1, 2, '									Hii again', '2020-11-24 19:14:56', 'no'),
(18, 1, 2, '									Hii again', '2020-11-24 19:15:43', 'no'),
(19, 1, 2, '									Hii again', '2020-11-24 19:16:27', 'no'),
(20, 2, 1, '								Hello', '2020-11-24 19:17:22', 'no'),
(21, 2, 1, '								Hello', '2020-11-24 19:18:59', 'no'),
(22, 2, 1, '								Hey', '2020-11-24 19:19:06', 'no'),
(23, 2, 1, '									Hello', '2020-11-24 19:19:14', 'no'),
(24, 1, 2, '									Hii again', '2020-11-24 19:19:36', 'no');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`com_id`);

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
-- Indexes for table `user_messages`
--
ALTER TABLE `user_messages`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `com_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_messages`
--
ALTER TABLE `user_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
