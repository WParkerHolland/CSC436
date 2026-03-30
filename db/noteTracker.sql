-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 30, 2026 at 10:41 AM
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

--
-- VIEW `player_NPC_view`
-- Data: None
--


-- --------------------------------------------------------

--
-- Structure for view `player_NPC_view`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`jacobaleixo`@`localhost` SQL SECURITY DEFINER VIEW `player_NPC_view`  AS SELECT `c`.`name` AS `Name`, `c`.`race` AS `Race`, `c`.`description` AS `Description`, `c`.`partyNotes` AS `Notes`, `l`.`name` AS `Location` FROM (`Characters` `c` left join `Locations` `l` on((`c`.`isAt` = `l`.`ID`))) ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
