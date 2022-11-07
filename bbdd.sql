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

create table users (
	username VARCHAR(50),
	password VARCHAR(50),
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	date DATE,
	gender VARCHAR(1),
	admin  TINYINT(1),

constraint pk_users primary key (username)

);



create table category (
	id INT,
	name VARCHAR(50),
	description VARCHAR(50),

CONSTRAINT pk_cat PRIMARY KEY (id)
);

create table elements (
	id INT,
	name VARCHAR(50),
	description VARCHAR(50),
	price DECIMAL(5,2),
	category VARCHAR(42),

CONSTRAINT pk_element PRIMARY KEY (id),
CONSTRAINT fk_cat FOREIGN KEY (category) REFERENCES category (name) ON DELETE CASCADE
);


insert into users (username, password, first_name, last_name, date, gender, admin) values ('inma', MD5('inma'), 'inma', 'olias', '1970-11-30', 'M', 1);
insert into users (username, password, first_name, last_name, date, gender, admin) values ('pilar', MD5('pilar'), 'pilar', 'guzman', '1995-10-28', 'M', 1);
insert into users (username, password, first_name, last_name, date, gender, admin) values ('paco', MD5('paco'), 'paco', 'ruiz', '1958-12-10', 'H', 0);


insert into category (id, name, description) values (1, 'Temp Fencing, Decorative Fencing and Gates', '11-300 - Fluid Waste Treatment and Disposal Equipment', null, null);
insert into category (id, name, description) values (2, 'Retaining Wall and Brick Pavers', '1-540 - Construction Aids', null, null);
insert into category (id, name, description) values (3, 'EIFS', '16-050 - Basic Electrical Materials and Methods', null, null);
insert into category (id, name, description) values (4, 'Elevator', '11-470 - Darkroom Equipment', null, null);
insert into category (id, name, description) values (5, 'Granite Surfaces', '1-540 - Construction Aids', null, null);
insert into category (id, name, description) values (6, 'Sitework & Site Utilities', '5-400 - Cold-Formed Metal Framing', null, null);
insert into category (id, name, description) values (7, 'Termite Control', '11-460 - Unit Kitchens', null, null);
insert into category (id, name, description) values (8, 'Temp Fencing, Decorative Fencing and Gates', '2-312 - Rough Grading', null, null);
insert into category (id, name, description) values (9, 'Epoxy Flooring', '1-517 - Temporary Telephone', null, null);
insert into category (id, name, description) values (10, 'Elevator', '4-200 - Masonry Units', null, null);


insert into elements (id, name, description, price, category) values (1, 'Vinyl', '7-050 - Basic Thermal and Moisture Protection Materials and Methods', 167.1, 'Granite Surfaces');
insert into elements (id, name, description, price, category) values (2, 'Rubber', '9-700 - Wall Finishes', 215.14, 'Temp Fencing, Decorative Fencing and Gates');
insert into elements (id, name, description, price, category) values (3, 'Plastic', '1-712 - Local Conditions', 211.04, 'Sitework & Site Utilities');
insert into elements (id, name, description, price, category) values (4, 'Plexiglass', '8-900 - Glazed Curtain Wall', 37.89, 'Granite Surfaces');
insert into elements (id, name, description, price, category) values (5, 'Brass', '2-790 - Athletic Surfacing', 196.24, 'Temp Fencing, Decorative Fencing and Gates');
insert into elements (id, name, description, price, category) values (6, 'Rubber', '16-700 - Communications', 27.92, 'EIFS');
insert into elements (id, name, description, price, category) values (7, 'Aluminum', '1-560 - Temporary Barriers and Enclosures', 58.47, 'Temp Fencing, Decorative Fencing and Gates');
insert into elements (id, name, description, price, category) values (8, 'Steel', '1-630 - Product Substitution Procedures', 256.39, 'Granite Surfaces');
insert into elements (id, name, description, price, category) values (9, 'Aluminum', '7-900 - Joint Sealers', 139.89, 'Retaining Wall and Brick Pavers');
insert into elements (id, name, description, price, category) values (10, 'Stone', '4-500 - Refractories', 123.97, 'Elevator');
insert into elements (id, name, description, price, category) values (11, 'Rubber', '1-542 - Construction Scaffolding and Platforms', 237.62, 'Sitework & Site Utilities');
insert into elements (id, name, description, price, category) values (12, 'Aluminum', '10-270 - Access Flooring', 226.37, 'Epoxy Flooring');
insert into elements (id, name, description, price, category) values (13, 'Plexiglass', '14-500 - Material Handling', 282.69, 'Retaining Wall and Brick Pavers');
insert into elements (id, name, description, price, category) values (14, 'Granite', '2-750 - Concrete Pads and Walks', 230.26, 'Sitework & Site Utilities');
insert into elements (id, name, description, price, category) values (15, 'Brass', '13-090 - Radiation Protection', 20.66, 'Termite Control');
insert into elements (id, name, description, price, category) values (16, 'Brass', '2-830 - Retaining Walls', 242.34, 'Elevator');
insert into elements (id, name, description, price, category) values (17, 'Brass', '13-900 - Fire Suppression', 43.08, 'Elevator');
insert into elements (id, name, description, price, category) values (18, 'Granite', '13-030 - Special Purpose Rooms', 293.32, 'Elevator');
insert into elements (id, name, description, price, category) values (19, 'Brass', '1-630 - Product Substitution Procedures', 95.52, 'Termite Control');
insert into elements (id, name, description, price, category) values (20, 'Wood', '1-520 - Construction Facilities', 152.22, 'Retaining Wall and Brick Pavers');
insert into elements (id, name, description, price, category) values (21, 'Aluminum', '13-170 - Tubs and Pools', 216.56, 'Granite Surfaces');
insert into elements (id, name, description, price, category) values (22, 'Steel', '13-500 - Recording Instrumentation', 22.63, 'Sitework & Site Utilities');
insert into elements (id, name, description, price, category) values (23, 'Plastic', '10-200 - Louvers and Vents', 15.9, 'Termite Control');
insert into elements (id, name, description, price, category) values (24, 'Stone', '2-781 - Asphalt Pavers', 150.17, 'Termite Control');
insert into elements (id, name, description, price, category) values (25, 'Steel', '3-500 - Cementitious Decks and Underlayments', 196.0, 'Temp Fencing, Decorative Fencing and Gates');
insert into elements (id, name, description, price, category) values (26, 'Granite', '15-600 - Refrigeration Equipment', 85.48, 'Retaining Wall and Brick Pavers');
insert into elements (id, name, description, price, category) values (27, 'Glass', '11-130 - Audio-Visual Equipment', 299.18, 'Temp Fencing, Decorative Fencing and Gates');
insert into elements (id, name, description, price, category) values (28, 'Vinyl', '2-230 - Site Clearing', 150.93, 'Retaining Wall and Brick Pavers');
insert into elements (id, name, description, price, category) values (29, 'Stone', '1-700 - Execution Requirements', 219.97, 'Termite Control');
insert into elements (id, name, description, price, category) values (30, 'Granite', '17-010 - Contingency', 225.69, 'Sitework & Site Utilities');
insert into elements (id, name, description, price, category) values (31, 'Plastic', '10-400 - Identification Devices', 73.09, 'Sitework & Site Utilities');
insert into elements (id, name, description, price, category) values (32, 'Brass', '1-517 - Temporary Telephone', 86.4, 'Termite Control');
insert into elements (id, name, description, price, category) values (33, 'Glass', '1-013 - Project Coordinator', 31.07, 'Temp Fencing, Decorative Fencing and Gates');
insert into elements (id, name, description, price, category) values (34, 'Stone', '8-300 - Specialty Doors', 54.68, 'Termite Control');
insert into elements (id, name, description, price, category) values (35, 'Stone', '13-030 - Special Purpose Rooms', 193.8, 'Termite Control');
insert into elements (id, name, description, price, category) values (36, 'Glass', '7-700 - Roof Specialties and Accessories', 264.55, 'Retaining Wall and Brick Pavers');
insert into elements (id, name, description, price, category) values (37, 'Plastic', '15-400 - Plumbing Fixtures and Equipment', 184.71, 'Termite Control');
insert into elements (id, name, description, price, category) values (38, 'Brass', '13-080 - Sound, Vibration, and Seismic Control', 234.14, 'Termite Control');
insert into elements (id, name, description, price, category) values (39, 'Aluminum', '2-200 - Site Preparation', 1.58, 'Elevator');
insert into elements (id, name, description, price, category) values (40, 'Rubber', '7-500 - Membrane Roofing', 289.71, 'Temp Fencing, Decorative Fencing and Gates');
insert into elements (id, name, description, price, category) values (41, 'Rubber', '2-932 - PLants and Bulbs', 225.91, 'Temp Fencing, Decorative Fencing and Gates');
insert into elements (id, name, description, price, category) values (42, 'Vinyl', '11-650 - Planetarium Equipment', 158.8, 'Retaining Wall and Brick Pavers');
insert into elements (id, name, description, price, category) values (43, 'Plexiglass', '11-660 - Observatory Equipment', 263.58, 'Granite Surfaces');
insert into elements (id, name, description, price, category) values (44, 'Vinyl', '13-190 - Site-Constructed Incinerators', 140.83, 'Temp Fencing, Decorative Fencing and Gates');
insert into elements (id, name, description, price, category) values (45, 'Steel', '13-220 - Filter Underdrains and Media', 255.43, 'Epoxy Flooring');
insert into elements (id, name, description, price, category) values (46, 'Aluminum', '9-900 - Paints and Coatings', 276.49, 'Epoxy Flooring');
insert into elements (id, name, description, price, category) values (47, 'Glass', '10-520 - Fire Protection Specialties', 113.42, 'Temp Fencing, Decorative Fencing and Gates');
insert into elements (id, name, description, price, category) values (48, 'Plastic', '3-320 - Slab Foundations', 107.21, 'Elevator');
insert into elements (id, name, description, price, category) values (49, 'Rubber', '1-600 - Product Requirements (Scope of Work)', 76.48, 'Granite Surfaces');
insert into elements (id, name, description, price, category) values (50, 'Rubber', '2-800 - Site Amenities', 251.22, 'Temp Fencing, Decorative Fencing and Gates');
insert into elements (id, name, description, price, category) values (51, 'Rubber', '9-400 - Terrazzo', 258.82, 'Granite Surfaces');
insert into elements (id, name, description, price, category) values (52, 'Wood', '2-812 - Drip Irrigation', 66.92, 'Granite Surfaces');
insert into elements (id, name, description, price, category) values (53, 'Vinyl', '11-660 - Observatory Equipment', 148.81, 'Granite Surfaces');
insert into elements (id, name, description, price, category) values (54, 'Plexiglass', '2-625 - Retaining Wall Drainage Piping', 5.92, 'Epoxy Flooring');
insert into elements (id, name, description, price, category) values (55, 'Brass', '11-090 - Checkroom Equipment', 43.78, 'Sitework & Site Utilities');
insert into elements (id, name, description, price, category) values (56, 'Granite', '5-600 - Hydraulic Fabrications', 110.45, 'Sitework & Site Utilities');
insert into elements (id, name, description, price, category) values (57, 'Granite', '2-782 - Brick Pavers', 232.43, 'EIFS');
insert into elements (id, name, description, price, category) values (58, 'Granite', '1-514 - Temporary Heating, Cooling and Ventilation', 173.56, 'Temp Fencing, Decorative Fencing and Gates');
insert into elements (id, name, description, price, category) values (59, 'Aluminum', '2-780 - Clay Unit Pavers', 170.8, 'Retaining Wall and Brick Pavers');
insert into elements (id, name, description, price, category) values (60, 'Stone', '12-800 - Interior Plants and Planters', 101.0, 'Temp Fencing, Decorative Fencing and Gates');
insert into elements (id, name, description, price, category) values (61, 'Brass', '7-300 - Shingles, Roof Tiles, and Roof Coverings', 255.58, 'Elevator');
insert into elements (id, name, description, price, category) values (62, 'Wood', '8-050 - Basic Door and Window Materials and Methods', 277.97, 'Epoxy Flooring');
insert into elements (id, name, description, price, category) values (63, 'Plexiglass', '2-820 - Fences and Gates', 119.5, 'Retaining Wall and Brick Pavers');
insert into elements (id, name, description, price, category) values (64, 'Granite', '1-904 - Hazardous Materials Removal and Disposal', 125.08, 'Retaining Wall and Brick Pavers');
insert into elements (id, name, description, price, category) values (65, 'Vinyl', '15-100 - Plumbing', 124.04, 'Elevator');
insert into elements (id, name, description, price, category) values (66, 'Vinyl', '9-250 - Gypsum Wallboard', 172.12, 'Termite Control');
insert into elements (id, name, description, price, category) values (67, 'Brass', '7-200 - Thermal Protection - Insulation', 49.35, 'Granite Surfaces');
insert into elements (id, name, description, price, category) values (68, 'Wood', '15-050 - Basic Mechanical Materials and Methods', 174.61, 'Sitework & Site Utilities');
insert into elements (id, name, description, price, category) values (69, 'Aluminum', '1-760 - Protecting Installed Construction', 112.16, 'Temp Fencing, Decorative Fencing and Gates');
insert into elements (id, name, description, price, category) values (70, 'Plexiglass', '11-070 - Instrumental Equipment', 64.14, 'Temp Fencing, Decorative Fencing and Gates');
insert into elements (id, name, description, price, category) values (71, 'Steel', '14-300 - Escalators and Moving Walks', 269.04, 'Granite Surfaces');
insert into elements (id, name, description, price, category) values (72, 'Plexiglass', '3-050 - Concrete Subcontractor', 259.36, 'Elevator');
insert into elements (id, name, description, price, category) values (73, 'Rubber', '2-783 - Interlocking Concrete Unit Paving', 105.02, 'Retaining Wall and Brick Pavers');
insert into elements (id, name, description, price, category) values (74, 'Aluminum', '15-300 - Fire Protection Piping', 297.64, 'Temp Fencing, Decorative Fencing and Gates');
insert into elements (id, name, description, price, category) values (75, 'Plastic', '14 - Conveying Systems', 212.19, 'Sitework & Site Utilities');
insert into elements (id, name, description, price, category) values (76, 'Steel', '13-850 - Detection and Alarm', 99.76, 'EIFS');
insert into elements (id, name, description, price, category) values (77, 'Vinyl', '6-100 - Rough Carpentry', 148.82, 'Elevator');
insert into elements (id, name, description, price, category) values (78, 'Plastic', '2-936 - Fertilizer', 24.03, 'Elevator');
insert into elements (id, name, description, price, category) values (79, 'Vinyl', '12 - Furnishings', 11.45, 'Elevator');
insert into elements (id, name, description, price, category) values (80, 'Stone', '7-200 - Thermal Protection - Insulation', 241.99, 'Temp Fencing, Decorative Fencing and Gates');
insert into elements (id, name, description, price, category) values (81, 'Plastic', '15-900 - HVAC Instruments and Controls', 78.12, 'Epoxy Flooring');
insert into elements (id, name, description, price, category) values (82, 'Steel', '2-783 - Interlocking Concrete Unit Paving', 275.06, 'Sitework & Site Utilities');
insert into elements (id, name, description, price, category) values (83, 'Steel', '1-530 - Temporary Construction', 99.92, 'EIFS');
insert into elements (id, name, description, price, category) values (84, 'Stone', '8-800 - Glazing', 65.1, 'Retaining Wall and Brick Pavers');
insert into elements (id, name, description, price, category) values (85, 'Steel', '7-200 - Thermal Protection - Insulation', 122.95, 'Elevator');
insert into elements (id, name, description, price, category) values (86, 'Plastic', '10-100 - Visual Display Boards', 224.08, 'Sitework & Site Utilities');
insert into elements (id, name, description, price, category) values (87, 'Plexiglass', '11-280 - Hydraulic Gates and Valves', 126.69, 'Epoxy Flooring');
insert into elements (id, name, description, price, category) values (88, 'Stone', '2-782 - Brick Pavers', 215.87, 'Elevator');
insert into elements (id, name, description, price, category) values (89, 'Wood', '3-330 - Poured Concrete Basement Walls', 189.1, 'Granite Surfaces');
insert into elements (id, name, description, price, category) values (90, 'Steel', '16-400 - Low-Voltage Distribution', 12.17, 'Sitework & Site Utilities');
insert into elements (id, name, description, price, category) values (91, 'Aluminum', '11-600 - Laboratory Equipment', 11.38, 'Elevator');
insert into elements (id, name, description, price, category) values (92, 'Vinyl', '14-300 - Escalators and Moving Walks', 270.92, 'Granite Surfaces');
insert into elements (id, name, description, price, category) values (93, 'Rubber', '7-800 - Fire and Smoke Protection', 281.66, 'Elevator');
insert into elements (id, name, description, price, category) values (94, 'Rubber', '13-800 - Building Automation and Control', 230.9, 'Termite Control');
insert into elements (id, name, description, price, category) values (95, 'Steel', '2-919 - Topsoil', 217.35, 'Elevator');
insert into elements (id, name, description, price, category) values (96, 'Aluminum', '11-120 - Vending Equipment', 163.89, 'Elevator');
insert into elements (id, name, description, price, category) values (97, 'Brass', '15-600 - Refrigeration Equipment', 199.47, 'Elevator');
insert into elements (id, name, description, price, category) values (98, 'Brass', '4-050 - Basic Masonry Materials and Methods', 177.28, 'Termite Control');
insert into elements (id, name, description, price, category) values (99, 'Vinyl', '1-540 - Construction Aids', 70.43, 'Elevator');
insert into elements (id, name, description, price, category) values (100, 'Rubber', '1-580 - Project Identification', 184.74, 'Sitework & Site Utilities');

