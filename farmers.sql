-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 20, 2021 at 06:31 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

SET NAMES utf8mb4;
SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT;
SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS;
SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION;

--
-- Database: `farmers`
--
CREATE DATABASE IF NOT EXISTS `farmers` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `farmers`;

-- --------------------------------------------------------

--
-- Table structure for table `addagroproducts`
--
DROP TABLE IF EXISTS `addagroproducts`;
CREATE TABLE `addagroproducts` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `productname` varchar(100) NOT NULL,
  `productdesc` text NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `addagroproducts`
--
INSERT INTO `addagroproducts` (`username`, `email`, `pid`, `productname`, `productdesc`, `price`) VALUES
('test', 'test@gmail.com', 1, 'GIRIJA CAULIFLOWER', 'Tips for Growing Cauliflower. Well drained medium loam and/or sandy loam soils are suitable.', 520),
('test', 'test@gmail.com', 2, 'COTTON', 'Cotton is a soft, fluffy staple fiber that grows in a boll around the seeds of the cotton.', 563),
('arkpro', 'arkpro@gmail.com', 3, 'silk', 'Silk is a business developed from cocoon for saree preparation and so on.', 582);

-- --------------------------------------------------------

--
-- Table structure for table `farming`
--
DROP TABLE IF EXISTS `farming`;
CREATE TABLE `farming` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `farmingtype` varchar(200) NOT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `farming`
--
INSERT INTO `farming` (`fid`, `farmingtype`) VALUES
(1, 'Seed Farming'),
(2, 'Cocoon'),
(3, 'Silk');

-- --------------------------------------------------------

--
-- Table structure for table `register`
--
DROP TABLE IF EXISTS `register`;
CREATE TABLE `register` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `farmername` varchar(50) NOT NULL,
  `adharnumber` varchar(20) NOT NULL,
  `age` int(11) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `phonenumber` varchar(12) NOT NULL,
  `address` varchar(50) NOT NULL,
  `farming` varchar(50) NOT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `trig`
--
DROP TABLE IF EXISTS `trig`;
CREATE TABLE `trig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fid` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Triggers for table `register`
--
DROP TRIGGER IF EXISTS `deletion`;
DROP TRIGGER IF EXISTS `insertion`;
DROP TRIGGER IF EXISTS `updation`;

DELIMITER $$
CREATE TRIGGER `deletion` BEFORE DELETE ON `register`
FOR EACH ROW
BEGIN
  INSERT INTO `trig` (`fid`, `action`, `timestamp`)
  VALUES (OLD.rid, 'FARMER DELETED', NOW());
END$$

CREATE TRIGGER `insertion` AFTER INSERT ON `register`
FOR EACH ROW
BEGIN
  INSERT INTO `trig` (`fid`, `action`, `timestamp`)
 

