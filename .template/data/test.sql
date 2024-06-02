-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 01, 2024 at 12:32 PM
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
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `student_name` varchar(255) NOT NULL,
  `program` varchar(10) NOT NULL,
  `semester` int(1) NOT NULL,
  `section` char(1) DEFAULT NULL,
  `roll_no` int(3) NOT NULL,
  `subject_code` varchar(8) NOT NULL,
  `status` varchar(7) NOT NULL,
  `created_on` date NOT NULL,
  `last_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` int(15) NOT NULL,
  `student_name` char(255) NOT NULL,
  `program` char(10) NOT NULL,
  `semester` int(1) NOT NULL,
  `section` char(1) DEFAULT NULL,
  `roll_no` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `student_name`, `program`, `semester`, `section`, `roll_no`) VALUES
(1, 'Aakash Kumar Gupta', 'bsc.csit', 1, 'A', 1),
(2, 'Aalok Sapkota', 'bsc.csit', 1, 'A', 2),
(3, 'Aashish Lakandri', 'bsc.csit', 1, 'A', 3),
(4, 'Aasma Baral', 'bsc.csit', 1, 'A', 4),
(5, 'Abhisek Gautam', 'bsc.csit', 1, 'A', 5),
(6, 'Aishwarya Pokhrel', 'bsc.csit', 1, 'A', 6),
(7, 'Alwin Bhandari', 'bsc.csit', 1, 'A', 7),
(8, 'Ambika Shrestha', 'bsc.csit', 1, 'A', 8),
(9, 'Anisha Bhandari', 'bsc.csit', 1, 'A', 9),
(10, 'Anmol Kumar Das', 'bsc.csit', 1, 'A', 10),
(11, 'Anuja Khatri', 'bsc.csit', 1, 'A', 11),
(12, 'Anup Dhimal', 'bsc.csit', 1, 'A', 12),
(13, 'Arpan Neupane', 'bsc.csit', 1, 'A', 13),
(14, 'Avishek Gurung', 'bsc.csit', 1, 'A', 14),
(15, 'Babita Rajbanshi', 'bsc.csit', 1, 'A', 15),
(16, 'Basista Kumar Yadav', 'bsc.csit', 1, 'A', 16),
(17, 'Bhagwat Nepal', 'bsc.csit', 1, 'A', 17),
(18, 'Bhumika Rajvanshi', 'bsc.csit', 1, 'A', 18),
(19, 'Bibesh Kattel', 'bsc.csit', 1, 'A', 19),
(20, 'Binayak Karki', 'bsc.csit', 1, 'A', 20),
(21, 'Biswas Pokharel', 'bsc.csit', 1, 'A', 21),
(22, 'Dhurba Rajbanshi', 'bsc.csit', 1, 'A', 22),
(23, 'Esmika Bhattarai', 'bsc.csit', 1, 'A', 23),
(24, 'Gaurav Choudhary', 'bsc.csit', 1, 'A', 24),
(25, 'Janam Rai', 'bsc.csit', 1, 'A', 25),
(26, 'Kabita Sahu', 'bsc.csit', 1, 'A', 26),
(27, 'Kiran Gajmer', 'bsc.csit', 1, 'A', 27),
(28, 'Kuber Lamichhane', 'bsc.csit', 1, 'A', 28),
(29, 'Look Bahadur Khatri', 'bsc.csit', 1, 'A', 29),
(30, 'Mahesh Bhattarai', 'bsc.csit', 1, 'A', 30),
(31, 'Manish Timsina', 'bsc.csit', 1, 'A', 31),
(32, 'Mukesh Neupane', 'bsc.csit', 1, 'A', 32),
(33, 'Nikal Shrestha', 'bsc.csit', 1, 'A', 33),
(34, 'Ningma Gurung', 'bsc.csit', 1, 'A', 34),
(35, 'Nischal Shrestha', 'bsc.csit', 1, 'A', 35),
(36, 'Nisha Guragain', 'bsc.csit', 1, 'A', 36),
(37, 'Nishan Giri', 'bsc.csit', 1, 'B', 1),
(38, 'Oshina Timsina', 'bsc.csit', 1, 'B', 2),
(39, 'Parbati Rai', 'bsc.csit', 1, 'B', 3),
(40, 'Prajesh Niroula', 'bsc.csit', 1, 'B', 4),
(41, 'Prajwal Mishra', 'bsc.csit', 1, 'B', 5),
(42, 'Prajwal Satyal', 'bsc.csit', 1, 'B', 6),
(43, 'Prasamsha Ghimire', 'bsc.csit', 1, 'B', 7),
(44, 'Prashant Ojha', 'bsc.csit', 1, 'B', 8),
(45, 'Pujan Acharya', 'bsc.csit', 1, 'B', 9),
(46, 'Pujan Karki', 'bsc.csit', 1, 'B', 10),
(47, 'Puskar Sitoula', 'bsc.csit', 1, 'B', 11),
(48, 'Radhika Basnet', 'bsc.csit', 1, 'B', 12),
(49, 'Regent Regmi', 'bsc.csit', 1, 'B', 13),
(50, 'Riddhi Dahal', 'bsc.csit', 1, 'B', 14),
(51, 'Riya Shah Rauniyar', 'bsc.csit', 1, 'B', 15),
(52, 'Roshan Adhikari', 'bsc.csit', 1, 'B', 16),
(53, 'Rupesh Bista', 'bsc.csit', 1, 'B', 17),
(54, 'Sachin Raut', 'bsc.csit', 1, 'B', 18),
(55, 'Sahadev Rimal', 'bsc.csit', 1, 'B', 19),
(56, 'Sahitya Bhattarai', 'bsc.csit', 1, 'B', 20),
(57, 'Sakshyam Bhattarai', 'bsc.csit', 1, 'B', 21),
(58, 'Salina Chhetri', 'bsc.csit', 1, 'B', 22),
(59, 'Samikshya Acharya', 'bsc.csit', 1, 'B', 23),
(60, 'Samir Niroula', 'bsc.csit', 1, 'B', 24),
(61, 'Samir Rajbanshi', 'bsc.csit', 1, 'B', 25),
(62, 'Sandesh Baral', 'bsc.csit', 1, 'B', 26),
(63, 'Saurav Khanal', 'bsc.csit', 1, 'B', 27),
(64, 'Saurav Rijal', 'bsc.csit', 1, 'B', 28),
(65, 'Shiwam Niraula', 'bsc.csit', 1, 'B', 29),
(66, 'Siddhartha Raj Upreti', 'bsc.csit', 1, 'B', 30),
(67, 'Suraj Dahal', 'bsc.csit', 1, 'B', 31),
(68, 'Suraj Tiwari', 'bsc.csit', 1, 'B', 32),
(69, 'Suvechchha Nepal', 'bsc.csit', 1, 'B', 33),
(70, 'Umesh Nepal', 'bsc.csit', 1, 'B', 34),
(71, 'Uttam Khadka', 'bsc.csit', 1, 'B', 35),
(72, 'Yubesh Bhattarai', 'bsc.csit', 1, 'B', 36);

-- --------------------------------------------------------

--
-- Table structure for table `subject-teacher`
--

CREATE TABLE `subject-teacher` (
  `teacher_name` varchar(255) NOT NULL,
  `program` varchar(10) NOT NULL,
  `semester` int(1) NOT NULL,
  `section` char(1) DEFAULT NULL,
  `subject_code` varchar(8) NOT NULL,
  `subject_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `subject-teacher`
--

INSERT INTO `subject-teacher` (`teacher_name`, `program`, `semester`, `section`, `subject_code`, `subject_name`) VALUES
('teacher', 'bsc.csit', 1, 'A', 'CSC115', 'C Programming'),
('teacher', 'bsc.csit', 1, 'B', 'CSC115', 'C Programming'),
('teacher', 'bim', 1, NULL, 'IT 231', 'Foundation of Information Technology');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `subject_code` varchar(8) NOT NULL,
  `subject_name` varchar(255) DEFAULT NULL,
  `program` char(10) NOT NULL,
  `semester` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`subject_code`, `subject_name`, `program`, `semester`) VALUES
('CSC114', 'Introduction to Information Technology', 'bsc.csit', 1),
('CSC115', 'C Programming', 'bsc.csit', 1),
('CSC116', 'Digital Logic', 'bsc.csit', 1),
('CSC165', 'Discrete Structure', 'bsc.csit', 2),
('CSC166', 'Object Oriented Programming', 'bsc.csit', 2),
('CSC167', 'Microprocessor', 'bsc.csit', 2),
('CSC211', 'Data Structure and Algorithms', 'bsc.csit', 3),
('CSC212', 'Numerical Method', 'bsc.csit', 3),
('CSC213', 'Computer Architecture', 'bsc.csit', 3),
('CSC214', 'Computer Graphics', 'bsc.csit', 3),
('CSC262', 'Theory of Computation', 'bsc.csit', 4),
('CSC263', 'Computer Networks', 'bsc.csit', 4),
('CSC264', 'Operating Systems', 'bsc.csit', 4),
('CSC265', 'Database Management System', 'bsc.csit', 4),
('CSC266', 'Artificial Intelligence', 'bsc.csit', 4),
('CSC325', 'Design and Analysis of Algorithms', 'bsc.csit', 5),
('CSC326', 'System Analysis and Design', 'bsc.csit', 5),
('CSC327', 'Cryptography', 'bsc.csit', 5),
('CSC328', 'Simulation and Modeling', 'bsc.csit', 5),
('CSC329', 'Web Technology', 'bsc.csit', 5),
('CSC330', 'Multimedia Computing', 'bsc.csit', 5),
('CSC331', 'Wireless Networking', 'bsc.csit', 5),
('CSC332', 'Image Processing', 'bsc.csit', 5),
('CSC333', 'Knowledge Management', 'bsc.csit', 5),
('CSC334', 'Society and Ethics in Information Technology', 'bsc.csit', 5),
('CSC335', 'Microprocessor Based Design', 'bsc.csit', 5),
('CSC375', 'Software Engineering', 'bsc.csit', 6),
('CSC376', 'Compiler Design and Construction', 'bsc.csit', 6),
('CSC377', 'E-Governance', 'bsc.csit', 6),
('CSC378', 'NET Centric Computing', 'bsc.csit', 6),
('CSC379', 'Technical Writing', 'bsc.csit', 6),
('CSC380', 'Applied Logic', 'bsc.csit', 6),
('CSC381', 'E-commerce', 'bsc.csit', 6),
('CSC382', 'Automation and Robotics', 'bsc.csit', 6),
('CSC383', 'Neural Networks', 'bsc.csit', 6),
('CSC384', 'Computer Hardware Design', 'bsc.csit', 6),
('CSC385', 'Cognitive Science', 'bsc.csit', 6),
('CSC419', 'Advanced Java Programming', 'bsc.csit', 7),
('CSC420', 'Data Warehousing and Data Mining', 'bsc.csit', 7),
('CSC422', 'Project Work', 'bsc.csit', 7),
('CSC423', 'Information Retrieval', 'bsc.csit', 7),
('CSC424', 'Database Administration', 'bsc.csit', 7),
('CSC425', 'Software Project Management', 'bsc.csit', 7),
('CSC426', 'Network Security', 'bsc.csit', 7),
('CSC427', 'Digital System Design', 'bsc.csit', 7),
('CSC475', 'Advanced Database', 'bsc.csit', 8),
('CSC476', 'Internship', 'bsc.csit', 8),
('CSC477', 'Advanced Networking with IPV6', 'bsc.csit', 8),
('CSC478', 'Distributed Networking', 'bsc.csit', 8),
('CSC479', 'Game Technology', 'bsc.csit', 8),
('CSC480', 'Distributed and Object-Oriented Database', 'bsc.csit', 8),
('CSC481', 'Introduction to Cloud Computing', 'bsc.csit', 8),
('CSC482', 'Geographical Information System', 'bsc.csit', 8),
('CSC483', 'Decision Support System and Expert System', 'bsc.csit', 8),
('CSC484', 'Mobile Application Development', 'bsc.csit', 8),
('CSC485', 'Real Time Systems', 'bsc.csit', 8),
('CSC486', 'Network and System Administration', 'bsc.csit', 8),
('CSC487', 'Embedded Systems Programming', 'bsc.csit', 8),
('MGT421', 'Principles of Management', 'bsc.csit', 7),
('MGT428', 'International Marketing', 'bsc.csit', 7),
('MGT488', 'International Business Management', 'bsc.csit', 8),
('MTH117', 'Mathematics I', 'bsc.csit', 1),
('MTH168', 'Mathematics II', 'bsc.csit', 2),
('PHY118', 'Physics', 'bsc.csit', 1),
('STA169', 'Statistics I', 'bsc.csit', 2),
('STA215', 'Statistics II', 'bsc.csit', 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `name` varchar(255) NOT NULL,
  `role` enum('admin','teacher','student') NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `hashed_secret` varchar(255) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`name`, `role`, `uuid`, `hashed_secret`, `phone_number`, `email`) VALUES
('admin', 'admin', 'admin', '$2y$10$OfUmWQV9woi3ubQkWSVgVeOFcnsAGkC591lUEoobsrRdx880BiUN6', NULL, NULL),
('student', 'student', 'student', '$2y$10$NWD46WmqqyK8N/gLq/AGUuHWBIIEDNnpMldffifwP/sFAYpO1UXt.', NULL, NULL),
('teacher', 'teacher', 'teacher', '$2y$10$GYy4lR8bOCqwuHSfHx.cN.CN9QI.fbnOGptGs6TavW4AlIJwzYdnm', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`subject_code`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uuid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
