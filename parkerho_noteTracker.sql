-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 18, 2026 at 11:19 AM
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
-- Database: `parkerho_noteTracker`
--

-- --------------------------------------------------------

--
-- Table structure for table `Characters`
--

CREATE TABLE `Characters` (
  `ID` int(11) NOT NULL,
  `isAt` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `race` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(1000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gmNotes` varchar(1000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `partyNotes` varchar(1000) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Contains`
--

CREATE TABLE `Contains` (
  `container` int(11) NOT NULL,
  `containee` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Creatures`
--

CREATE TABLE `Creatures` (
  `ID` int(11) NOT NULL,
  `population` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Locations`
--

CREATE TABLE `Locations` (
  `ID` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(1000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gmNotes` varchar(1000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `partyNotes` varchar(1000) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `NPCs`
--

CREATE TABLE `NPCs` (
  `ID` int(11) NOT NULL,
  `opinions` varchar(1000) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Players`
--

CREATE TABLE `Players` (
  `ID` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `playedBy` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `PlayingIn`
--

CREATE TABLE `PlayingIn` (
  `user` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `plays` int(11) NOT NULL,
  `world` int(11) NOT NULL,
  `role` enum('gm','player') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Props`
--

CREATE TABLE `Props` (
  `ID` int(11) NOT NULL,
  `isIn` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(1000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gmNotes` varchar(1000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `partyNotes` varchar(1000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemType` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `rarity` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1',
  `owner` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Characters`
--
ALTER TABLE `Characters`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `isAt` (`isAt`);

--
-- Indexes for table `Contains`
--
ALTER TABLE `Contains`
  ADD KEY `container` (`container`),
  ADD KEY `containee` (`containee`);

--
-- Indexes for table `Creatures`
--
ALTER TABLE `Creatures`
  ADD KEY `isCreature` (`ID`);

--
-- Indexes for table `Locations`
--
ALTER TABLE `Locations`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `NPCs`
--
ALTER TABLE `NPCs`
  ADD KEY `isNPC` (`ID`);

--
-- Indexes for table `Players`
--
ALTER TABLE `Players`
  ADD KEY `isPlayer` (`ID`),
  ADD KEY `playedBy` (`playedBy`);

--
-- Indexes for table `PlayingIn`
--
ALTER TABLE `PlayingIn`
  ADD KEY `user` (`user`),
  ADD KEY `plays` (`plays`),
  ADD KEY `inWorld` (`world`);

--
-- Indexes for table `Props`
--
ALTER TABLE `Props`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `isIn` (`isIn`),
  ADD KEY `ownedBy` (`owner`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Characters`
--
ALTER TABLE `Characters`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Locations`
--
ALTER TABLE `Locations`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Props`
--
ALTER TABLE `Props`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Characters`
--
ALTER TABLE `Characters`
  ADD CONSTRAINT `isAt` FOREIGN KEY (`isAt`) REFERENCES `Locations` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Contains`
--
ALTER TABLE `Contains`
  ADD CONSTRAINT `containee` FOREIGN KEY (`containee`) REFERENCES `Locations` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `container` FOREIGN KEY (`container`) REFERENCES `Locations` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Creatures`
--
ALTER TABLE `Creatures`
  ADD CONSTRAINT `isCreature` FOREIGN KEY (`ID`) REFERENCES `Characters` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `NPCs`
--
ALTER TABLE `NPCs`
  ADD CONSTRAINT `isNPC` FOREIGN KEY (`ID`) REFERENCES `Characters` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Players`
--
ALTER TABLE `Players`
  ADD CONSTRAINT `isPlayer` FOREIGN KEY (`ID`) REFERENCES `Characters` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `playedBy` FOREIGN KEY (`playedBy`) REFERENCES `Users` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `PlayingIn`
--
ALTER TABLE `PlayingIn`
  ADD CONSTRAINT `inWorld` FOREIGN KEY (`world`) REFERENCES `Locations` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `plays` FOREIGN KEY (`plays`) REFERENCES `Characters` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `user` FOREIGN KEY (`user`) REFERENCES `Users` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Props`
--
ALTER TABLE `Props`
  ADD CONSTRAINT `isIn` FOREIGN KEY (`isIn`) REFERENCES `Locations` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ownedBy` FOREIGN KEY (`owner`) REFERENCES `Characters` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
