-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 19, 2026 at 07:48 AM
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

--
-- Dumping data for table `Characters`
--

INSERT INTO `Characters` (`ID`, `isAt`, `name`, `race`, `description`, `gmNotes`, `partyNotes`) VALUES
(1, 2, 'Wilhelm Riquet', 'human', 'thief', 'Passion for animals', 'Played by Steve'),
(2, 4, 'Commodore Stephahk', 'human', 'Recruitment officer at Fort Hranic', 'Rat who let attackers into fort', 'Weirdly chill guy'),
(3, 4, 'Renly Gokel', 'human', 'Recruit specializing in alchemy', 'Harmless?', 'He is an evil terrorist'),
(4, 2, 'Horacio Garzon', 'human', 'wine artisan', 'Passion for grapes', 'Played by George'),
(5, 2, 'Jovi', 'Ka’Tavin', 'Animal sold in Siwanilua', 'Will be used to train ‘Ride’ skill', 'Bought by Wilhelm'),
(6, 4, 'Olver Thumbless', 'human', 'Recruit who has no thumbs', 'Dies in Hranic Raid', 'His name is now ‘Nubs’'),
(7, 5, 'Xiarkydoth', 'spider', 'Spider in Myrantahl Forests', 'Beast Aliyra encounters?', ''),
(8, 2, 'Leon Septar', 'human', 'Bouncer, detective', 'Passion for sneaking', 'Played by Henry'),
(9, 5, 'Aliyra Maastehr', 'ghord', 'Apothecary from Ghordeiol', 'Wife to Ephram and Mother to Obram and Ilen', ''),
(10, 4, 'Chef Mya', 'human', 'Chef at Fort Hranic', 'Head chef', 'Falls in love with Wilhelm');

-- --------------------------------------------------------

--
-- Table structure for table `Contains`
--

CREATE TABLE `Contains` (
  `container` int(11) NOT NULL,
  `containee` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Contains`
--

INSERT INTO `Contains` (`container`, `containee`) VALUES
(6, 1),
(6, 2),
(6, 3),
(6, 4),
(6, 5),
(4, 7);

-- --------------------------------------------------------

--
-- Table structure for table `Creatures`
--

CREATE TABLE `Creatures` (
  `ID` int(11) NOT NULL,
  `population` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Creatures`
--

INSERT INTO `Creatures` (`ID`, `population`) VALUES
(5, 1),
(7, 1);

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

--
-- Dumping data for table `Locations`
--

INSERT INTO `Locations` (`ID`, `name`, `description`, `gmNotes`, `partyNotes`) VALUES
(1, 'Kua Loranta', 'Desert nation ruled by the Kua Lorantene peoples', 'Under control of the foreign power Hrace', 'People have venomous spikes'),
(2, 'Siwanilua', 'Wealthy city ruled by Queen Yttrilyna', 'Hrace has soft control over the Queen', 'The royalty are rich but the people are poor'),
(3, 'Hanging Gardens of Azkenilua', 'Wonder built to the Goddess Azkenilua', 'Pilgrimage site', 'They do not grow grapes here'),
(4, 'Hranic Fort', 'Military island off the coast of Kua Loranta', 'Session start. Raided by Kua Lorantene attackers', 'Renly is here and he must be dangerous…'),
(5, 'Ghordeiol', 'Northern country also soft controlled by Hrace', 'Potential site for future campaigns', ''),
(6, 'The World', 'This is the big world that contains everything', 'The good and evil happens here', ''),
(7, 'Barracks', 'Barracks in a fort, weapons and stuff', '', ''),
(8, 'Completely Unrelated World', 'This world doesn\'t have anything yet', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `NPCs`
--

CREATE TABLE `NPCs` (
  `ID` int(11) NOT NULL,
  `opinions` varchar(1000) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `NPCs`
--

INSERT INTO `NPCs` (`ID`, `opinions`) VALUES
(2, 'Cooperative with Hrace, indifferent to recruits'),
(3, 'Friendly facade, secretly plotting destruction'),
(6, 'Eager to prove himself despite disability'),
(9, 'Caring and knowledgeable, misses her family'),
(10, 'Warm and welcoming, develops feelings for Wilhelm');

-- --------------------------------------------------------

--
-- Table structure for table `Players`
--

CREATE TABLE `Players` (
  `ID` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `playedBy` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Players`
--

INSERT INTO `Players` (`ID`, `level`, `playedBy`) VALUES
(1, 3, 'Steve'),
(4, 3, 'George'),
(8, 3, 'Henry');

-- --------------------------------------------------------

--
-- Table structure for table `PlayingIn`
--

CREATE TABLE `PlayingIn` (
  `user` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `plays` int(11) DEFAULT NULL,
  `world` int(11) NOT NULL,
  `role` enum('gm','player') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `PlayingIn`
--

INSERT INTO `PlayingIn` (`user`, `plays`, `world`, `role`) VALUES
('Steve', 1, 6, 'player'),
('George', 4, 6, 'player'),
('Henry', 8, 6, 'player'),
('George', NULL, 8, 'gm'),
('GM Individual', NULL, 6, 'gm');

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

--
-- Dumping data for table `Props`
--

INSERT INTO `Props` (`ID`, `isIn`, `name`, `description`, `gmNotes`, `partyNotes`, `itemType`, `rarity`, `quantity`, `owner`) VALUES
(1, 2, 'Venom Spike', 'A spike harvested from a Kua Lorantene warrior', 'Can be used as a poison weapon', 'Found in Siwanilua market', 'Weapon', 'Uncommon', 3, 1),
(2, 4, 'Alchemy Kit', 'A set of tools for brewing potions', 'Belongs to Renly', 'Confiscated after the raid', 'Tool', 'Common', 1, 3),
(3, 2, 'Grape Wine', 'A fine bottle of Siwaniluan wine', 'Horacio made this himself', 'Worth good money', 'Consumable', 'Common', 5, 4),
(4, 4, 'Fort Manifest', 'A list of all recruits at Hranic Fort', 'Contains evidence against Stephahk', 'We need to get this', 'Document', 'Rare', 1, 2),
(5, 1, 'Desert Cloak', 'A cloak that blends into sand', 'Useful for desert travel', 'Bought in Kua Loranta', 'Armor', 'Common', 1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`username`, `password`) VALUES
('George', 'password456'),
('GM Individual', 'password000'),
('Henry', 'password789'),
('No Friends Larry', 'password000'),
('Steve', 'password123');

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `Locations`
--
ALTER TABLE `Locations`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `Props`
--
ALTER TABLE `Props`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
