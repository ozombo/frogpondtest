-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: May 28, 2019 at 06:06 AM
-- Server version: 5.7.21
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `pond`
--

-- --------------------------------------------------------

--
-- Table structure for table `frogs`
--

CREATE TABLE `frogs` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `avatar` text NOT NULL,
  `gender` varchar(10) NOT NULL,
  `dob` date NOT NULL,
  `death` date NOT NULL,
  `pond_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `frogs`
--

INSERT INTO `frogs` (`id`, `name`, `avatar`, `gender`, `dob`, `death`, `pond_id`) VALUES
(1, 'Ade', '', 'male', '2013-01-12', '0000-00-00', 1),
(2, 'Segun', '', 'male', '2012-05-10', '0000-00-00', 1),
(3, 'Ore', '', 'male', '2011-10-14', '0000-00-00', 3),
(4, 'Dele', '', 'female', '2014-06-12', '0000-00-00', 2),
(5, 'Sochi', '', 'Male', '2014-02-03', '0000-00-00', 3),
(6, 'Yoshi', '', 'male', '2012-04-02', '0000-00-00', 2),
(7, 'Fera', '', 'female', '2014-06-18', '0000-00-00', 1),
(8, 'Wale', '', 'female', '2012-09-09', '0000-00-00', 4),
(9, 'Flex', '', 'male', '2006-01-14', '2014-03-03', 2);

-- --------------------------------------------------------

--
-- Table structure for table `ponds`
--

CREATE TABLE `ponds` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` text NOT NULL,
  `description` text NOT NULL,
  `location` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ponds`
--

INSERT INTO `ponds` (`id`, `name`, `image`, `description`, `location`, `status`) VALUES
(1, 'Ejigbo', '', 'Cool, spacious, frog friendly. \r\n\r\nThis space generous pond gives your frogs the maximum comfort in the habitat giving them the freedom to procreate easily and have a better life span. ', 'lat: -25.363, lng: 131.044', 'open'),
(2, 'Chelsea', '', 'Cool, spacious, frog friendly. \r\n\r\nThis space generous pond gives your frogs the maximum comfort in the habitat giving them the freedom to procreate easily and have a better life span. ', 'lat: 1.1874385, lng: 32.3038504', 'open'),
(3, 'Ikoyi', '', 'Cool, spacious, frog friendly. \r\n\r\nThis space generous pond gives your frogs the maximum comfort in the habitat giving them the freedom to procreate easily and have a better life span. ', 'lat: 25.363, lng: 31.044', 'open'),
(4, 'Ilasa', '', 'Cool, spacious, frog friendly. \r\n\r\nThis space generous pond gives your frogs the maximum comfort in the habitat giving them the freedom to procreate easily and have a better life span. ', 'lat: 5.363, lng: 13.044', 'open');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `frogs`
--
ALTER TABLE `frogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ponds`
--
ALTER TABLE `ponds`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `frogs`
--
ALTER TABLE `frogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `ponds`
--
ALTER TABLE `ponds`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
