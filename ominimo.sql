-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 19, 2024 at 08:22 PM
-- Server version: 8.0.36
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ominimo`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `comment` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `user_id`, `comment`, `created_at`) VALUES
(65, 1, 2, 'Great explanation! Helped me a lot.', '2024-10-19 21:40:29'),
(66, 1, 3, 'Can you provide more examples?', '2024-10-19 21:40:29'),
(67, 1, 4, 'Thanks, this clarified my doubts.', '2024-10-19 21:40:29'),
(68, 1, 5, 'What about closures in ES6?', '2024-10-19 21:40:29'),
(69, 1, 6, 'Awesome post! Very well written.', '2024-10-19 21:40:29'),
(70, 2, 3, 'I found this very helpful, thanks!', '2024-10-19 21:40:29'),
(71, 2, 4, 'Responsive design is crucial for SEO.', '2024-10-19 21:40:29'),
(72, 2, 5, 'I would love a part 2 on this topic.', '2024-10-19 21:40:29'),
(73, 2, 6, 'Could you cover more on media queries?', '2024-10-19 21:40:29'),
(74, 2, 7, 'This post was just what I needed!', '2024-10-19 21:40:29'),
(75, 3, 4, 'Great intro to Python.', '2024-10-19 21:40:29'),
(76, 3, 5, 'I wish this was around when I was learning.', '2024-10-19 21:40:29'),
(77, 3, 6, 'Python is my favorite language.', '2024-10-19 21:40:29'),
(78, 3, 7, 'Clear and concise. Well done!', '2024-10-19 21:40:29'),
(79, 3, 1, 'Any tips for learning Python fast?', '2024-10-19 21:40:29'),
(80, 4, 5, 'CSS has never been easier.', '2024-10-19 21:40:29'),
(81, 4, 6, 'I struggled with Flexbox before reading this.', '2024-10-19 21:40:29'),
(82, 4, 7, 'Could you also cover Grid?', '2024-10-19 21:40:29'),
(83, 4, 1, 'This was exactly what I needed!', '2024-10-19 21:40:29'),
(84, 4, 2, 'Flexbox changed the way I design websites.', '2024-10-19 21:40:29'),
(85, 5, 6, 'This convinced me to start unit testing.', '2024-10-19 21:40:29'),
(86, 5, 7, 'How do you choose which tests to write?', '2024-10-19 21:40:29'),
(87, 5, 1, 'Great insights on testing.', '2024-10-19 21:40:29'),
(88, 5, 2, 'Do you have a guide for beginners?', '2024-10-19 21:40:29'),
(89, 5, 3, 'Unit testing saved my project.', '2024-10-19 21:40:29'),
(90, 6, 7, 'REST APIs always seemed complex, but this helped.', '2024-10-19 21:40:29'),
(91, 6, 1, 'Good overview, thank you!', '2024-10-19 21:40:29'),
(92, 6, 2, 'What about authentication for APIs?', '2024-10-19 21:40:29'),
(93, 6, 3, 'Nice explanation!', '2024-10-19 21:40:29'),
(94, 6, 4, 'Would love more details on error handling.', '2024-10-19 21:40:29'),
(95, 7, 1, 'Git changed how I manage projects.', '2024-10-19 21:40:29'),
(96, 7, 2, 'Clear explanation of version control.', '2024-10-19 21:40:29'),
(97, 7, 3, 'Any tips on handling merge conflicts?', '2024-10-19 21:40:29'),
(98, 7, 4, 'This was very helpful!', '2024-10-19 21:40:29'),
(99, 7, 5, 'I can\'t imagine coding without Git now.', '2024-10-19 21:40:29'),
(100, 8, 2, 'Finally, a clear guide on forms!', '2024-10-19 21:40:29'),
(101, 8, 3, 'This helped me understand form validation.', '2024-10-19 21:40:29'),
(102, 8, 4, 'Are there any best practices for security?', '2024-10-19 21:40:29'),
(103, 8, 5, 'Great post, very informative.', '2024-10-19 21:40:29'),
(104, 8, 6, 'Forms are so much easier to understand now.', '2024-10-19 21:40:29'),
(105, 9, 3, 'Asynchronous code always confused me, this helped.', '2024-10-19 21:40:29'),
(106, 9, 4, 'Thanks for explaining promises so clearly.', '2024-10-19 21:40:29'),
(107, 9, 5, 'Can you cover more on async/await?', '2024-10-19 21:40:29'),
(108, 9, 6, 'Great examples!', '2024-10-19 21:40:29'),
(109, 9, 7, 'This was really helpful, thanks!', '2024-10-19 21:40:29'),
(110, 10, 4, 'SQL has always been a challenge for me, thanks for this!', '2024-10-19 21:40:29'),
(111, 10, 5, 'Any chance of a follow-up on advanced queries?', '2024-10-19 21:40:29'),
(112, 10, 6, 'This was a great starting point for SQL.', '2024-10-19 21:40:29'),
(113, 10, 7, 'Thanks for explaining joins!', '2024-10-19 21:40:29'),
(114, 10, 1, 'I appreciate the clear examples.', '2024-10-19 21:40:29');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` varchar(2000) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `content`, `created_at`) VALUES
(1, 1, 'Understanding JavaScript Closures', 'Closures are a powerful feature of JavaScript. In this post, we explore how they work and why they are useful.', '2024-10-01 10:00:00'),
(2, 2, 'The Basics of Responsive Web Design', 'Responsive web design is essential for modern websites. Learn how to make your designs adapt to different screen sizes.', '2024-10-02 11:15:00'),
(3, 3, 'Getting Started with Python', 'Python is a versatile programming language. Let\'s dive into how to get started and write your first program.', '2024-10-03 14:30:00'),
(4, 4, 'A Guide to CSS Flexbox', 'Flexbox simplifies the layout of web pages. Learn how to use it to create flexible, responsive layouts.', '2024-10-04 16:45:00'),
(5, 5, 'The Importance of Unit Testing', 'Unit testing ensures that your code works correctly. Discover why it\'s important and how to start.', '2024-10-05 09:00:00'),
(6, 6, 'An Introduction to REST APIs', 'REST APIs are a fundamental part of modern web development. Let\'s understand how they work and how to build them.', '2024-10-06 12:30:00'),
(7, 7, 'The Benefits of Version Control with Git', 'Git makes collaboration and version control easier. Learn the basics of Git and why it\'s essential.', '2024-10-07 08:15:00'),
(8, 1, 'Mastering HTML Forms', 'HTML forms are the backbone of user interaction on the web. Learn how to create effective forms.', '2024-10-08 17:00:00'),
(9, 2, 'Understanding Asynchronous JavaScript', 'Asynchronous JavaScript allows you to handle tasks in the background. Learn how to use callbacks, promises, and async/await.', '2024-10-09 13:20:00'),
(10, 3, 'Introduction to SQL Databases', 'SQL databases are the backbone of data management. Understand the basics and how to write simple queries.', '2024-10-10 15:50:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(1, 'Oliver Thompson', 'oliver@example.com', '$2y$12$vVOuAPOY.iEpRBP3aY2Gu.Ti63CRajIFajQraMQ/cayxltrcOrAvi'),
(2, 'Emily Harris', 'emily@example.com', '$2y$12$vVOuAPOY.iEpRBP3aY2Gu.Ti63CRajIFajQraMQ/cayxltrcOrAvi'),
(3, 'John Smith', 'john.smith@example.com', '$2y$12$vVOuAPOY.iEpRBP3aY2Gu.Ti63CRajIFajQraMQ/cayxltrcOrAvi'),
(4, 'Emma Johnson', 'emma.johnson@example.com', '$2y$12$UKy43ZkDuKH2eE.KeBF.ouWCgz/YcLO6a7zsA8UbxRUzu/gUAThkS'),
(5, 'Michael Brown', 'michael.brown@example.com', '$2y$12$vVOuAPOY.iEpRBP3aY2Gu.Ti63CRajIFajQraMQ/cayxltrcOrAvi'),
(6, 'Sophia Davis', 'sophia.davis@example.com', '$2y$12$vVOuAPOY.iEpRBP3aY2Gu.Ti63CRajIFajQraMQ/cayxltrcOrAvi'),
(7, 'James Wilson', 'james.wilson@example.com', '$2y$12$vVOuAPOY.iEpRBP3aY2Gu.Ti63CRajIFajQraMQ/cayxltrcOrAvi');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comment_to_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `strani_kljuc_postid` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `strani_kjluc_userid` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
