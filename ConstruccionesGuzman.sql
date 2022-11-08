-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: mysqlDawes:3306
-- Tiempo de generación: 08-11-2022 a las 08:25:33
-- Versión del servidor: 5.7.22
-- Versión de PHP: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ConstruccionesGuzman`
--
CREATE DATABASE ConstruccionesGuzman;
USE `ConstruccionesGuzman`;

CREATE USER 'Guzman'@'%' IDENTIFIED BY 'Pilar';
GRANT ALL PRIVILEGES ON ConstruccionesGuzman.* to 'Guzman'@'%';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `category`
--

INSERT INTO `category` (`id`, `name`, `description`) VALUES
(1, 'Temp Fencing, Decorative Fencing and Gates', '11-300 - Fluid Waste Treatment'),
(2, 'Retaining Wall and Brick Pavers', '1-540 - Construction Aids'),
(3, 'EIFS', '16-050 - Basic Electrical Materials and Methods'),
(4, 'Elevator', '11-470 - Darkroom Equipment'),
(5, 'Granite Surfaces', '1-540 - Construction Aids'),
(6, 'Sitework & Site Utilities', '5-400 - Cold-Formed Metal Framing'),
(7, 'Termite Control', '11-460 - Unit Kitchens'),
(8, 'Kitchen', '2-312 - Rough Grading'),
(9, 'Epoxy Flooring', '1-517 - Temporary Telephone'),
(10, 'Bathroom', '4-200 - Masonry Units');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material`
--

CREATE TABLE `material` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `price` decimal(5,2) DEFAULT NULL,
  `category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `material`
--

INSERT INTO `material` (`id`, `name`, `description`, `price`, `category`) VALUES
(1, 'Backhoe', '13-175 - Ice Rinks', '68.87', 5),
(2, 'Excavator', '2-813 - Lawn Sprinkling and Irrigation', '11.71', 4),
(3, 'Dragline', '4-200 - Masonry Units', '203.96', 9),
(4, 'Trencher', '1-520 - Construction Facilities', '261.96', 9),
(5, 'Dragline2', '5 - Metals', '108.08', 7),
(6, 'Trencher2', '7 - Thermal and Moisture Protection', '58.61', 1),
(7, 'Dragline3', '13-600 - Solar and Wind Energy Equipment', '41.16', 5),
(8, 'Dragline4', '1-640 - Owner Furnished Products', '212.73', 5),
(9, 'Crawler', '12-600 - Multiple Seating', '243.68', 1),
(10, 'Crawler2', '6-050 - Basic Wood and Plastic Materials', '161.83', 5),
(11, 'Bulldozer', '10-550 - Postal Specialties', '262.65', 7),
(12, 'Scraper', '13-175 - Ice Rinks', '188.48', 10),
(13, 'Excavator2', '10-240 - Grilles and Screens', '150.09', 6),
(14, 'Dump Truck', '6-050 - Basic Wood and Plastic Materials', '288.22', 4),
(15, 'Crawler22', '8-700 - Hardware', '223.35', 2),
(16, 'Bulldozer2', '4-600 - Corrosion-Resistant Masonry', '147.53', 6),
(17, 'Bulldozer3', '2-923 - Seeding and Soil Supplements', '142.64', 10),
(18, 'Excavator3', '10-290 - Pest Control', '93.09', 4),
(19, 'Crawler10', '2-240 - Dewatering', '141.96', 4),
(20, 'Dragline5', '1-000 - Purpose', '83.12', 8),
(21, 'Skid-Steer', '13-030 - Special Purpose Rooms', '74.10', 3),
(22, 'Compactor2', '13-150 - Swimming Pools', '63.90', 1),
(23, 'Skid-Steer20', '4-400 - Stone', '118.89', 9),
(24, 'Excavator10', '11-870 - Agricultural Equipment', '204.04', 4),
(25, 'Crawler15', '14-400 - Lifts', '157.13', 5),
(26, 'Backina', '2-935 - Plant Maintenance', '64.21', 4),
(27, 'Blockfloor', '2-822 - Ornamental Metal Fences and Gates', '161.91', 8),
(28, 'Scraper10', '3-310 - Expansion Joints', '34.41', 5),
(29, 'Dragline10', '5-200 - Metal Joists', '62.70', 4),
(30, 'Trencher10', '8-600 - Skylights', '266.62', 5),
(31, 'Compactor3', '10-670 - Storage Shelving', '243.65', 1),
(32, 'Blancolor', '1-013 - Project Coordinator', '59.38', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `username` varchar(50) NOT NULL,
  `pass` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`username`, `pass`, `first_name`, `last_name`, `birthday`, `gender`, `admin`) VALUES
('inma', 'd40dbcae0e7088fc4a7e1768cf8771da', 'inma', 'olias', '1970-11-30', 'M', 1),
('paco', '311020666a5776c57d265ace682dc46d', 'paco', 'ruiz', '1958-12-10', 'H', 0),
('pilar', '31c7d084f0460fcde98ee9314fc8ef30', 'pilar', 'guzman', '1995-10-28', 'M', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_material`
--

CREATE TABLE `user_material` (
  `userName` varchar(20) NOT NULL,
  `idMaterial` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `fk_cat` (`category`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `user_material`
--
ALTER TABLE `user_material`
  ADD PRIMARY KEY (`idMaterial`,`userName`),
  ADD KEY `fk2_userMaterial` (`userName`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `material`
--
ALTER TABLE `material`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `material`
--
ALTER TABLE `material`
  ADD CONSTRAINT `fk_cat` FOREIGN KEY (`category`) REFERENCES `category` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `user_material`
--
ALTER TABLE `user_material`
  ADD CONSTRAINT `fk2_userMaterial` FOREIGN KEY (`userName`) REFERENCES `user` (`username`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_userMaterial` FOREIGN KEY (`idMaterial`) REFERENCES `material` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
