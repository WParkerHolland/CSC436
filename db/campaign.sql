-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 22, 2026 at 01:30 PM
-- Server version: 5.7.44-48
-- PHP Version: 8.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jacobale_scribe`
--

-- --------------------------------------------------------

--
-- Table structure for table `Locations`
--

CREATE TABLE `Locations` (
  `ID` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(1000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gmNotes` varchar(1000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `partyNotes` varchar(1000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `img_src` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visible` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Locations`
--

INSERT INTO `Locations` (`ID`, `name`, `description`, `gmNotes`, `partyNotes`, `img_src`, `visible`) VALUES
(1, 'Kua Loranta', 'Desert nation ruled by the Kua Lorantene peoples', 'Under control of the foreign power Hrace', 'People have venomous spikes', 'imgs/kua_loranta.png', 1),
(2, 'Siwanilua', 'Wealthy city ruled by Queen Yttrilyna', 'Hrace has soft control over the Queen', 'The royalty are rich but the people are poor', NULL, 1),
(3, 'Hanging Gardens of Azkenilua', 'Wonder built to the Goddess Azkenilua', 'Pilgrimage site', 'They do not grow grapes here', NULL, 1),
(4, 'Hranic Fort', 'Military island off the coast of Kua Loranta', 'Session start. Raided by Kua Lorantene attackers', 'Renly is here and he must be dangerous…', NULL, 1),
(5, 'Ghordeiol', 'Northern country also soft controlled by Hrace', 'Potential site for future campaigns', '', NULL, 0),
(6, 'The World', 'This is the big world that contains everything', 'The good and evil happens here', '', NULL, 0),
(7, 'Barracks', 'Barracks in a fort, weapons and stuff', '', '', NULL, 0),
(8, 'Completely Unrelated World', 'This world doesn\'t have anything yet', '', '', NULL, 0),
(9, 'Roshar', 'World where Stormlight Archives takes place', 'World for Stormlight tabletop RPG', 'Populations range from different kinds of Humans to crab people called Parshendi', NULL, 0),
(10, 'The Back of the Stage Tavern', 'Poor tavern in the Slums District of Siwanilua', '', '', 'imgs/location_default.png', 1),
(11, 'Ahn Janil', 'Small village northwest of Siwanilua', '', '', 'imgs/location_default.png', 0),
(12, 'Kalikiv Kalin Dunes', 'Sand dunes home of the Nij\'Gama', '', '', 'imgs/location_default.png', 1),
(13, 'testing12', 'testing34', '', '', 'imgs/location_default.png', 0),
(14, 'testing12', 'testing34', '', '', 'imgs/location_default.png', 0),
(15, 'new campaign', 'description testing', 'private testing', '', 'imgs/world_default.png', 1),
(16, 'location adding testing', 'description testing location ', 'private ', '', 'imgs/location_default.png', 0),
(17, 'testing addition of location in cmaoain', 'testing', '', '', 'imgs/location_default.png', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Locations`
--
ALTER TABLE `Locations`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Locations`
--
ALTER TABLE `Locations`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
