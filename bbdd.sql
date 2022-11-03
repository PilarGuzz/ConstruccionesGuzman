-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Nov 01, 2022 at 08:05 PM
-- Server version: 10.5.8-MariaDB-1:10.5.8+maria~focal-log
-- PHP Version: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 
--

-- --------------------------------------------------------
CREATE DATABASE ConstruccionesGuzman;
CREATE USER 'Guzman'@'%' IDENTIFIED BY 'Pilar';
GRANT ALL PRIVILEGES ON ConstruccionesGuzman.* to 'Guzman'@'%';
