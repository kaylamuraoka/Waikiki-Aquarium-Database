-- This script is used to Populate all of the Data into the tables in the Database.

INSERT INTO Staff_T 
	(StaffID, StaffName, StaffPhoneNumber, StaffStreet, StaffCity, StaffState, StatePostalCode, StaffHiredDate, StaffType, ManagerID)
VALUES
	('3250', 'Maria Johnson', '8082753286', '4455  Don Jackson Lane', 'Honolulu', 'HI', '96815', '2017-06-15', 'Curator', NULL),
    ('5142', 'Jessie Dunlap', '8087334752', '2874  Indiana Avenue', 'Kaneohe', 'HI', '96816', '2012-08-20', 'Veterinarian', NULL),
    ('4920', 'Mary Donnell', '8083998375', '2841  Arron Smith Drive', 'Kailua', 'HI', '96819', '2009-05-10', 'Curator', 3250),
    ('1943', 'Christina Ross', '8082055688', '4730  Stratford Drive', 'Waianae', 'HI', '96821', '2020-01-12', 'Veterinarian', 5142),
    ('4622', 'Stephanie Hart', '8082232987', '4125  Randall Drive', 'Pearl City', 'HI', '96743', '2011-12-06', 'Curator', 3250),
    ('4820', 'Donald Russell', '8084562341', '100 Woodrose Pl', 'Mililani', 'HI', '96138', '2012-06-11', 'Veterinarian', 5142),
    ('2047', 'Jose Garcia', '8082174235', '1009 Iopono Loop', 'Waipahu', 'HI', '96815', '2016-04-03', 'Curator', 3250),
    ('5921', 'Michael Reed', '8083538048', '101 Kaahumanu Ave', 'Kapolei', 'HI', '96825', '2001-07-08', 'Veterinarian', 5142),
    ('9572', 'Patricia Butler', '8082123892', '1011 Koko Kai Pl', 'Aiea', 'HI', '96761', '2014-05-08', 'Curator', 3250),
    ('7402', 'Diana Robinson', '8082323445', '1001 Lowella Ave', 'Haleiwa', 'HI', '96732', '2006-12-22', 'Veterinarian', 5142);

INSERT INTO Curator_T
	(CStaffID)
VALUES
	('3250'),
    ('4920'),
    ('4622'),
    ('2047'),
    ('9572');

INSERT INTO Veterinarian_T
	(VStaffID)
VALUES
	('5142'),
    ('1943'),
    ('4820'),
    ('5921'),
    ('7402');
    
INSERT INTO TrainingCourses_T 
	(CourseNumber, CourseTitle, CourseDescription)
VALUES
	('TC01', 'Animal Nutrition', 'This course covers the unique nutritional needs of the aquarium animals in order to make feeding suggestions and identify malnutrition.'),
	('TC02', 'Aquarium Maintenance', 'This course covers extensive aquarium maintenance, aquarium cleaning and fishkeeping knowledge.'),
    ('TC03', 'Veterinary Medicine', 'This course covers the standard procedures and treatments for common diseases and injuries.'),
    ('TC04', 'Animal Physiology & Anatomy ', 'This course explores the anatomical structure and biological systems of common pets and farm animals.');
    
INSERT INTO TrainingCourseCompletion_T 
	(StaffID, CourseNumber, DateCompleted)
VALUES
	('5921', 'TC01', '2001-08-08'),
    ('5921', 'TC02', '2001-09-08'),
    ('5921', 'TC03', '2001-10-08'),
    ('5921', 'TC04', '2001-11-08'),
	('7402', 'TC01', '2007-01-22'),
    ('7402', 'TC02', '2007-02-22'),
    ('7402', 'TC03', '2007-03-22'),
    ('7402', 'TC04', '2007-04-22'),
	('4920', 'TC01', '2009-06-10'),
    ('4920', 'TC02', '2009-07-10'),
    ('4622', 'TC01', '2012-01-06'),
    ('4622', 'TC02', '2012-02-06'),
    ('4820', 'TC01', '2012-07-11'),
    ('4820', 'TC02', '2012-08-11'),
    ('4820', 'TC03', '2012-09-11'),
    ('5142', 'TC01', '2012-09-20'),
    ('4820', 'TC04', '2012-10-11'),
    ('5142', 'TC02', '2012-10-20'),
    ('5142', 'TC03', '2012-11-20'),
    ('5142', 'TC04', '2012-12-20'),
    ('9572', 'TC01', '2014-06-08'),
    ('9572', 'TC02', '2014-07-08'),
    ('2047', 'TC01', '2016-05-03'),
    ('2047', 'TC02', '2016-05-04'),
    ('3250', 'TC01', '2017-07-15'),
    ('3250', 'TC02', '2017-08-15'),
    ('1943', 'TC01', '2020-02-12'),
    ('1943', 'TC02', '2020-03-12'),
    ('1943', 'TC03', '2020-04-12'),
    ('1943', 'TC04', '2020-05-12');

INSERT INTO Supplier_T
	(SupplierNumber, SupplierName, SupplierStreet, SupplierCity, SupplierState, SupplierPostalCode)
VALUES
	('1494', 'Marine Depot', '1260 Denver Avenue', 'Elk Grove Villiage', 'IL', '60007'),
    ('5229', 'Aquatic Warehouse', '240 Hillview Drive', 'Lagrange', 'GA', '30240'),
    ('1840', 'Premium Aquatics', '2447 Indiana Avenue', 'Kapolei', 'HI', '96707'),
    ('7392', 'Aquascape Supply Co.', '714 Francis Mine', 'Trinity Center', 'CA', '96091'),
    ('8294', 'Aqua Lab', '1123 Birch Street', 'Homer', 'LA', '71040');

INSERT INTO Food_T 
	(FoodNumber, FoodDescription, FoodUnit, QuantityOnHand)
VALUES
	('F001', 'Brine Shrimp', 'lbs', 52.69),
    ('F002', 'Daphnia', 'lbs', 89.20),
    ('F003', 'Flakes', 'oz', 904.23),
    ('F004', 'Blackworms', 'lbs', 14.23),
    ('F005', 'Crisps', 'oz', 12.02),
    ('F006', 'Granules', 'oz', 30.00),
    ('F007', 'Pellets', 'lbs', 97.00),
    ('F008', 'Discs', 'lbs', 20.00);
  
INSERT INTO Exhibit_T 
	(ExhibitNumber, ExhibitName, LocationInBuilding)
VALUES
	('EX01', 'Giant Ocean Tank', 'Level 4'),
    ('EX02', 'Yawkey Coral Reef Center', 'Level 4'),
    ('EX03', 'Edge of the Sea Touch Tank', 'Level 3'),
    ('EX04', 'Gulf of Maine', 'Level 3'),
    ('EX05', 'Olympic Coast Exhibit', 'Level 3'),
    ('EX06', 'Amazon Rainforest', 'Level 3'),
    ('EX07', 'Seadragon Exhibit', 'Level 2'),
    ('EX08', 'Blue Planet Action Center', 'Level 1'),
    ('EX09', 'New Balance Foundation', 'Level 1'),
	('EX10', 'Marine Mammal Center', 'Level 1'),   
    ('EX11', 'Penguin Exhibit', 'Level 1'),
    ('EX12', 'Sea Jellies', 'Level 1'),
	('EX13', 'Shark and Ray Touch Tank', 'Level 1'),
    ('EX14', 'Science of Sharks', 'Level 1'),
    ('EX15', 'Indo-Pacific Coral Reef', 'Level 1'),
    ('EX16', 'Atlantic Harbor Seals Exhibit', 'Plaza');

INSERT INTO Enclosure_T 
	(EnclosureNumber, WaterTemperature, FluidCapacity, AmbientTemperature, AmbientHumidity, ExhibitNumber)
VALUES
	('E001', '31.40', '13.10', '14.34', '412', 'EX01'),
    ('E002', '43.10', '43.65', '36.33', '400', 'EX01'),
    ('E003', '19.31', '19.43', '14.64', '735', 'EX02'),
    ('E004', '95.03', '10.50', '37.92', '632', 'EX02'),
    ('E005', '68.24', '98.00', '58.29', '476', 'EX03'),
    ('E006', '69.29', '73.65', '69.29', '412', 'EX03'),
    ('E007', '95.13', '98.00', '95.29', '389', 'EX04'),
    ('E008', '67.21', '8.42', '29.48', '256', 'EX04'),
    ('E009', '12.64', '65.66', '52.43', '653', 'EX04'),
    ('E010', '97.52', '13.32', '64.24', '195', 'EX05'),
    ('E011', '45.21', '7.24', '18.94', '395', 'EX06'),
    ('E012', '75.14', '79.64', '19.34', '683', 'EX06'),
    ('E013', '73.85', '84.02', '69.93', '386', 'EX07'),
    ('E014', '27.42', '98.00', '67.39', '395', 'EX07'),
    ('E015', '68.39', '13.10', '19.28', '683', 'EX08'),
    ('E016', '24.53', '12.64', '68.39', '633', 'EX09'),
    ('E017', '15.96', '18.41', '94.38', '783', 'EX10'),
    ('E018', '67.23', '98.00', '95.38', '205', 'EX10'),
    ('E019', '85.90', '84.64', '86.48', '735', 'EX11'),
    ('E021', '87.68', '65.23', '86.38', '895', 'EX11'),
    ('E022', '23.59', '13.10', '68.39', '144', 'EX12'),
    ('E023', '64.59', '52.34', '50.29', '632', 'EX12'),
    ('E024', '45.20', '69.35', '58.48', '649', 'EX13'),
    ('E025', '59.29', '13.10', '68.69', '984', 'EX14'),
    ('E026', '58.62', '25.64', '10.34', '582', 'EX14'),
    ('E027', '28.13', '13.10', '69.49', '295', 'EX15'),
    ('E028', '68.29', '97.33', '39.58', '763', 'EX15'),
    ('E029', '86.28', '90.43', '58.39', '592', 'EX16'),
    ('E030', '27.58', '16.84', '60.05', '924', 'EX16'),
    ('E031', '75.49', '17.32', '11.59', '902', 'EX16');