
CREATE DATABASE ConstruccionesGuzman;


CREATE USER 'Guzman'@'%' IDENTIFIED BY 'Pilar';
GRANT ALL PRIVILEGES ON ConstruccionesGuzman.* to 'Guzman'@'%';


create table user (
	username VARCHAR(50),
	pass VARCHAR(50),
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	date DATE,
	gender VARCHAR(1),
	admin  TINYINT(1),

constraint pk_users primary key (username)

);


create table category (
	id INT AUTO_INCREMENT,
	name VARCHAR(50) unique,
	description VARCHAR(50),

CONSTRAINT pk_cat PRIMARY KEY (id)
);

create table material (
    id INT AUTO_INCREMENT,
	name VARCHAR(50) unique,
	description VARCHAR(50),
	price DECIMAL(5,2),
	category INT,

    CONSTRAINT pk_element PRIMARY KEY (id),
    CONSTRAINT fk_cat FOREIGN KEY (category) REFERENCES category (id) ON DELETE CASCADE

);

create table user_material(
    userName VARCHAR(20),
    idMaterial INT(6),

    CONSTRAINT pk_userMaterial PRIMARY KEY (idMaterial, userName),
    CONSTRAINT fk_userMaterial FOREIGN KEY (idMaterial) REFERENCES material(id) ON DELETE CASCADE,
    CONSTRAINT fk2_userMaterial FOREIGN KEY (userName) REFERENCES user(username) ON DELETE CASCADE
);


insert into user (username, pass, first_name, last_name, date, gender, admin) values ('inma', MD5('inma'), 'inma', 'olias', '1970-11-30', 'M', 1);
insert into user (username, pass, first_name, last_name, date, gender, admin) values ('pilar', MD5('pilar'), 'pilar', 'guzman', '1995-10-28', 'M', 1);
insert into user (username, pass, first_name, last_name, date, gender, admin) values ('paco', MD5('paco'), 'paco', 'ruiz', '1958-12-10', 'H', 0);

insert into category (name, description) values ('Temp Fencing, Decorative Fencing and Gates', '11-300 - Fluid Waste Treatment');
insert into category (name, description) values ('Retaining Wall and Brick Pavers', '1-540 - Construction Aids');
insert into category (name, description) values ('EIFS', '16-050 - Basic Electrical Materials and Methods');
insert into category (name, description) values ('Elevator', '11-470 - Darkroom Equipment');
insert into category (name, description) values ('Granite Surfaces', '1-540 - Construction Aids');
insert into category (name, description) values ('Sitework & Site Utilities', '5-400 - Cold-Formed Metal Framing');
insert into category (name, description) values ('Termite Control', '11-460 - Unit Kitchens');
insert into category (name, description) values ('Kitchen', '2-312 - Rough Grading');
insert into category (name, description) values ('Epoxy Flooring', '1-517 - Temporary Telephone');
insert into category (name, description) values ('Bathroom', '4-200 - Masonry Units');

insert into material (name, description, price, category) values ('Backhoe', '13-175 - Ice Rinks', 68.87, 5);
insert into material (name, description, price, category) values ('Excavator', '2-813 - Lawn Sprinkling and Irrigation', 11.71, 4);
insert into material (name, description, price, category) values ('Dragline', '4-200 - Masonry Units', 203.96, 9);
insert into material (name, description, price, category) values ('Trencher', '1-520 - Construction Facilities', 261.96, 9);
insert into material (name, description, price, category) values ('Dragline2', '5 - Metals', 108.08, 7);
insert into material (name, description, price, category) values ('Trencher2', '7 - Thermal and Moisture Protection', 58.61, 1);
insert into material (name, description, price, category) values ('Dragline3', '13-600 - Solar and Wind Energy Equipment', 41.16, 5);
insert into material (name, description, price, category) values ('Dragline4', '1-640 - Owner Furnished Products', 212.73, 5);
insert into material (name, description, price, category) values ('Crawler', '12-600 - Multiple Seating', 243.68, 1);
insert into material (name, description, price, category) values ('Crawler2', '6-050 - Basic Wood and Plastic Materials', 161.83, 5);
insert into material (name, description, price, category) values ('Bulldozer', '10-550 - Postal Specialties', 262.65, 7);
insert into material (name, description, price, category) values ('Scraper', '13-175 - Ice Rinks', 188.48, 10);
insert into material (name, description, price, category) values ('Excavator2', '10-240 - Grilles and Screens', 150.09, 6);
insert into material (name, description, price, category) values ('Dump Truck', '6-050 - Basic Wood and Plastic Materials', 288.22, 4);
insert into material (name, description, price, category) values ('Crawler22', '8-700 - Hardware', 223.35, 2);
insert into material (name, description, price, category) values ('Bulldozer2', '4-600 - Corrosion-Resistant Masonry', 147.53, 6);
insert into material (name, description, price, category) values ('Bulldozer3', '2-923 - Seeding and Soil Supplements', 142.64, 10);
insert into material (name, description, price, category) values ('Excavator3', '10-290 - Pest Control', 93.09, 4);
insert into material (name, description, price, category) values ('Crawler10', '2-240 - Dewatering', 141.96, 4);
insert into material (name, description, price, category) values ('Dragline5', '1-000 - Purpose', 83.12, 8);
insert into material (name, description, price, category) values ('Skid-Steer', '13-030 - Special Purpose Rooms', 74.1, 3);
insert into material (name, description, price, category) values ('Compactor2', '13-150 - Swimming Pools', 63.9, 1);
insert into material (name, description, price, category) values ('Skid-Steer20', '4-400 - Stone', 118.89, 9);
insert into material (name, description, price, category) values ('Excavator10', '11-870 - Agricultural Equipment', 204.04, 4);
insert into material (name, description, price, category) values ('Crawler15', '14-400 - Lifts', 157.13, 5);
insert into material (name, description, price, category) values ('Backina', '2-935 - Plant Maintenance', 64.21, 4);
insert into material (name, description, price, category) values ('Blockfloor', '2-822 - Ornamental Metal Fences and Gates', 161.91, 8);
insert into material (name, description, price, category) values ('Scraper10', '3-310 - Expansion Joints', 34.41, 5);
insert into material (name, description, price, category) values ('Dragline10', '5-200 - Metal Joists', 62.7, 4);
insert into material (name, description, price, category) values ('Trencher10', '8-600 - Skylights', 266.62, 5);
insert into material (name, description, price, category) values ('Compactor3', '10-670 - Storage Shelving', 243.65, 1);
insert into material (name, description, price, category) values ('Blancolor', '1-013 - Project Coordinator', 59.38, 7);
insert into material (name, description, price, category) values ('Backhoe2', '11-870 - Agricultural Equipment', 21.33, 2);
insert into material (name, description, price, category) values ('Grader', '2-000 - General', 224.66, 1);
insert into material (name, description, price, category) values ('Backhoe3', '3-210 - Cast-In-Place Concrete', 268.96, 10);
insert into material (name, description, price, category) values ('Crawler35', '13-185 - Kennels and Animal Shelters', 295.62, 10);
insert into material (name, description, price, category) values ('Grader10', '17-030 - Bond', 145.99, 7);
insert into material (name, description, price, category) values ('Scraper15', '4 - Masonry', 18.2, 10);
insert into material (name, description, price, category) values ('Scraper20', '14-400 - Lifts', 298.38, 1);
insert into material (name, description, price, category) values ('Scraper25', '10-750 - Telephone Specialties', 229.78, 3);
insert into material (name, description, price, category) values ('Grader20', '2-915 - Mulch', 229.37, 3);
insert into material (name, description, price, category) values ('Scraper30', '1-011 - Project Engineer', 219.04, 4);
insert into material (name, description, price, category) values ('Bulldozer5', '9-050 - Basic Finish Materials and Methods', 156.44, 8);
insert into material (name, description, price, category) values ('Excavator15', '16-300 - Transmission and Distribution', 93.8, 10);
insert into material (name, description, price, category) values ('Trencher15', '11-150 - Parking Control Equipment', 172.01, 5);
insert into material (name, description, price, category) values ('Bulldozer10', '1-010 - Project Manager', 4.26, 4);
insert into material (name, description, price, category) values ('Bulldozer15', '13-030 - Special Purpose Rooms', 207.62, 3);
insert into material (name, description, price, category) values ('Trencher20', '1-540 - Construction Aids', 113.49, 3);
insert into material (name, description, price, category) values ('Trencher25', '2-312 - Rough Grading', 85.49, 6);
insert into material (name, description, price, category) values ('Bulldozer20', '1-712 - Local Conditions', 46.17, 2);
insert into material (name, description, price, category) values ('Compactor10', '1-904 - Hazardous Materials Removal', 196.0, 7);
insert into material (name, description, price, category) values ('Excavator20', '13-200 - Storage Tanks', 282.91, 5);
insert into material (name, description, price, category) values ('Scraper40', '12-050 - Fabrics', 164.11, 1);
insert into material (name, description, price, category) values ('Dragline15', '7-400 - Roofing and Siding Panels', 102.19, 4);
insert into material (name, description, price, category) values ('Dragline20', '13 - Special Construction', 262.24, 3);
insert into material (name, description, price, category) values ('Compactor20', '2-820 - Fences and Gates', 272.92, 4);
insert into material (name, description, price, category) values ('Scraper45', '15-300 - Fire Protection Piping', 26.6, 2);
insert into material (name, description, price, category) values ('Dragline30', '2-935 - Plant Maintenance', 100.98, 4);
insert into material (name, description, price, category) values ('Skid-Steer40', '10-600 - Partitions', 27.23, 3);
insert into material (name, description, price, category) values ('Bulldozer25', '11-170 - Solid Waste Handling Equipment', 245.26, 2);
insert into material (name, description, price, category) values ('Crawler50', '11-040 - Ecclesiastical Equipment', 239.04, 2);
insert into material (name, description, price, category) values ('Bulldozer30', '13-400 - Measurement and Control', 123.46, 4);
insert into material (name, description, price, category) values ('Dragline35', '2-310 - Grading', 146.0, 2);
insert into material (name, description, price, category) values ('Scraper50', '6-200 - Finish Carpentry', 76.01, 2);
insert into material (name, description, price, category) values ('Bulldozer40', '1-600 - Product Requirements', 190.16, 1);
insert into material (name, description, price, category) values ('Dragline32', '3-330 - Poured Concrete Basement Walls', 126.26, 7);
insert into material (name, description, price, category) values ('Dump Truck 200', '2-750 - Concrete Pads and Walks', 83.23, 10);
insert into material (name, description, price, category) values ('Scraper55', '13-260 - Sludge Conditioning Systems', 103.4, 8);
insert into material (name, description, price, category) values ('Dragline50', '2-300 - Earthwork', 40.39, 6);
insert into material (name, description, price, category) values ('Scraper60', '4-500 - Refractories', 10.32, 2);
insert into material (name, description, price, category) values ('Backhoe43', '5-700 - Ornamental Metal', 215.94, 1);
insert into material (name, description, price, category) values ('Grader50', '2-200 - Site Preparation', 236.89, 3);
insert into material (name, description, price, category) values ('Bulldozer45', '3-230 - Anchor Bolts', 156.63, 7);
insert into material (name, description, price, category) values ('Backhoe150', '3-500 - Cementitious Decks', 26.01, 6);
insert into material (name, description, price, category) values ('Bulldozer50', '13-240 - Oxygenation Systems', 138.15, 5);
insert into material (name, description, price, category) values ('Compactor50', '10-290 - Pest Control', 57.14, 9);
insert into material (name, description, price, category) values ('Excavator19', '4-600 - Corrosion-Resistant Masonry', 293.83, 2);
insert into material (name, description, price, category) values ('Grader70', '15-900 - HVAC Instruments and Controls', 163.33, 3);
insert into material (name, description, price, category) values ('Trencher50', '2-824 - Wire Fences and Gates', 275.12, 5);
insert into material (name, description, price, category) values ('Scraper75', '1-550 - Vehicular Access and Parking', 157.02, 5);
insert into material (name, description, price, category) values ('Crawler100', '10-800 - Toilet, Bath, and Laundry ', 16.48, 2);
insert into material (name, description, price, category) values ('Grader80', '11-190 - Detention Equipment', 212.72, 5);
insert into material (name, description, price, category) values ('Excavator25', '11-010 - Maintenance Equipment', 145.0, 5);
insert into material (name, description, price, category) values ('Grader100', '11-040 - Ecclesiastical Equipment', 234.42, 9);
insert into material (name, description, price, category) values ('Dragline100', '15-900 - HVAC Instruments and Controls', 244.9, 8);
insert into material (name, description, price, category) values ('Backhoe20', '11-130 - Audio-Visual Equipment', 217.63, 8);
insert into material (name, description, price, category) values ('Backhoe15', '8-050 - Basic Door and Window Materials', 155.53, 5);
insert into material (name, description, price, category) values ('Bulldozer100', '16 - Electrical', 285.0, 3);
insert into material (name, description, price, category) values ('Excavator30', '16-200 - Electrical Power', 245.02, 6);
insert into material (name, description, price, category) values ('Skid-Steer50', '2-812 - Drip Irrigation', 2.09, 8);
insert into material (name, description, price, category) values ('Grader150', '2-740 - Flexible Pavement Asphalt Pavement', 30.35, 1);
insert into material (name, description, price, category) values ('Trencher60', '11-030 - Teller and Service Equipment', 79.13, 3);
insert into material (name, description, price, category) values ('Skid-Steer60', '7 - Thermal and Moisture Protection', 43.92, 3);
insert into material (name, description, price, category) values ('Excavator3000', '3-350 - Concrete Finishing', 160.75, 8);
insert into material (name, description, price, category) values ('Skid-Steer70', '2-310 - Grading', 259.05, 2);
insert into material (name, description, price, category) values ('Scraper80', '5-100 - Structural Metals', 132.56, 10);
insert into material (name, description, price, category) values ('Dump Truck 300', '2-924 - Sodding', 30.61, 2);
insert into material (name, description, price, category) values ('Dragline150', '10-800 - Toilet, Bath, and Laundry ', 171.38, 8);
insert into material (name, description, price, category) values ('Dragline200', '2-625 - Retaining Wall Drainage Piping', 100.41, 4);
insert into material (name, description, price, category) values ('Trencher75', '1-560 - Temporary Barriers and Enclosures', 200.51, 8);