-- Create Database named "Aquarium_DB"
CREATE DATABASE IF NOT EXISTS Aquarium_DB;
USE Aquarium_DB;

-- Create Staff Tab
CREATE TABLE Staff_T (
	StaffID CHAR(4) NOT NULL,
	StaffName VARCHAR(50) NOT NULL,
	StaffPhoneNumber VARCHAR(10),
	StaffStreet VARCHAR(50),
	StaffCity VARCHAR(20),
	StaffState VARCHAR(2),
	StatePostalCode CHAR(5),
	StaffHiredDate DATE,
	StaffType VARCHAR(12),
    ManagerID CHAR(4),
	CONSTRAINT Staff_PK PRIMARY KEY (StaffID),
	CONSTRAINT ManagerID_FK FOREIGN KEY (ManagerID) REFERENCES Staff_T(StaffID)
);

-- Create Curator Table
CREATE TABLE Curator_T (
	CStaffID CHAR(4) NOT NULL,
	CONSTRAINT Curator_PK FOREIGN KEY (CStaffID) REFERENCES Staff_T(StaffID)
);

-- Create Veterinarian Table
CREATE TABLE Veterinarian_T (
	VStaffID CHAR(4) NOT NULL,
	CONSTRAINT Veterinarian_PK FOREIGN KEY (VStaffID) REFERENCES Staff_T(StaffID)
);

-- Create Training Courses Table
CREATE TABLE TrainingCourses_T (
	CourseNumber CHAR(4) NOT NULL,
	CourseTitle VARCHAR(30),
	CourseDescription VARCHAR(255),
	CONSTRAINT TrainingCourses_PK PRIMARY KEY (CourseNumber)
);

-- Create Course Completion Table
CREATE TABLE TrainingCourseCompletion_T (
	StaffID CHAR(4) NOT NULL,
	CourseNumber CHAR(4) NOT NULL,
	DateCompleted DATE,
    CONSTRAINT TrainingCoursesCompletion_PK PRIMARY KEY (StaffID, CourseNumber),
	CONSTRAINT TrainingCourseCompletion_FK1 FOREIGN KEY (StaffID) REFERENCES Staff_T(StaffID),
	CONSTRAINT TrainingCourseCompletion_FK2 FOREIGN KEY (CourseNumber) REFERENCES TrainingCourses_T(CourseNumber)
);
 
-- Create Supplier Table
CREATE TABLE Supplier_T (
	SupplierNumber CHAR(4) NOT NULL,
	SupplierName VARCHAR(30) NOT NULL,
	SupplierStreet VARCHAR (50),
	SupplierCity VARCHAR (20),
	SupplierState VARCHAR(2),
	SupplierPostalCode VARCHAR(5),
	CONSTRAINT Supplier_PK PRIMARY KEY (SupplierNumber)
);

-- Create Food Table
CREATE TABLE Food_T (
	FoodNumber CHAR(4) NOT NULL,
	FoodDescription VARCHAR(255),
	FoodUnit CHAR(10),
	QuantityOnHand DECIMAL(5,2),
	CONSTRAINT Food_PK PRIMARY KEY (FoodNumber)
);

-- Create Exhibit Table
CREATE TABLE Exhibit_T (
	ExhibitNumber CHAR(4) NOT NULL,
	ExhibitName VARCHAR(255),
	LocationInBuilding VARCHAR(255),
	CONSTRAINT Exhibit_PK PRIMARY KEY (ExhibitNumber)
);

-- Create Enclosure Table
CREATE TABLE Enclosure_T (
	EnclosureNumber CHAR(4) NOT NULL,
	WaterTemperature DECIMAL(5,2),
	FluidCapacity DECIMAL(5,2),
	AmbientTemperature DECIMAL(5,2),
	AmbientHumidity DECIMAL(5,2),
	ExhibitNumber CHAR(4),
	CONSTRAINT Enclosure_PK PRIMARY KEY (EnclosureNumber),
	CONSTRAINT Enclosure_FK1 FOREIGN KEY (ExhibitNumber) REFERENCES Exhibit_T(ExhibitNumber)
);

-- Create Curator Work Schedule Table
CREATE TABLE CuratorWorkSchedule_T (
	CStaffID CHAR(4) NOT NULL,
	ExhibitNumber CHAR(4) NOT NULL,
	StartDate DATE,
	StartTime TIME,
	EndDate DATE,
	EndTime TIME,
	CONSTRAINT CuratorWorkSchedule_PK PRIMARY KEY (CStaffID, ExhibitNumber),
	CONSTRAINT CuratorWorkSchedule_FK1 FOREIGN KEY (CStaffID) REFERENCES Staff_T(StaffID),
	CONSTRAINT CuratorWorkSchedule_FK2 FOREIGN KEY (ExhibitNumber) REFERENCES Exhibit_T(ExhibitNumber)
);

-- Create Animal Table
CREATE TABLE Animal_T (
	AnimalID CHAR(4) NOT NULL,
	AnimalName VARCHAR(30),
	AnimalSpecies VARCHAR(30),
	AnimalBirthDate DATE,
	AnimalDateAcquired DATE,
	AnimalType VARCHAR(15) NOT NULL,
	ExhibitNumber CHAR(4),
	EnclosureNumber CHAR(4) NOT NULL,
	CONSTRAINT Animal_PK PRIMARY KEY (AnimalId),
	CONSTRAINT Animal_FK1 FOREIGN KEY (ExhibitNumber) REFERENCES Exhibit_T(ExhibitNumber),
	CONSTRAINT Animal_FK2 FOREIGN KEY (EnclosureNumber) REFERENCES Enclosure_T(EnclosureNumber)
);

-- Create Fish Table
CREATE TABLE Fish_T (
FAnimalID CHAR(4) NOT NULL,
CONSTRAINT Fish_PK FOREIGN KEY (FAnimalID) REFERENCES Animal_T(AnimalID)
);

-- Create Invertebres Table
CREATE TABLE Invertebres_T (
	IAnimalID CHAR(4) NOT NULL,
	CONSTRAINT Invertebres_PK FOREIGN KEY (IAnimalID) REFERENCES Animal_T(AnimalID)
);

-- Create Marine Mammals Table
CREATE TABLE MarineMammals_T (
	MAnimalID CHAR(4) NOT NULL,
	CONSTRAINT MarineMammals_PK FOREIGN KEY (MAnimalID) REFERENCES Animal_T(AnimalID)
);

-- Create Reptiles Table
CREATE TABLE Reptiles_T (
	RAnimalID CHAR(4) NOT NULL,
	CONSTRAINT Reptiles_PK FOREIGN KEY (RAnimalID) REFERENCES Animal_T(AnimalID)
);

-- Create Feeding Performed Table
CREATE TABLE FeedingPerformed_T (
	AnimalID CHAR(4) NOT NULL,
	FoodNumber CHAR(4) NOT NULL,
	CStaffID CHAR(4) NOT NULL,
	FeedingDate DATE,
	FeedingTime TIME,
	FeedingAmount DECIMAL(5,2),
	CONSTRAINT FeedingPerformed_PK PRIMARY KEY (AnimalID, FoodNumber, CStaffID, FeedingDate, FeedingTime),
	CONSTRAINT FeedingPerformed_FK1 FOREIGN KEY (AnimalID) REFERENCES Animal_T(AnimalID),
	CONSTRAINT FeedingPerformed_FK2 FOREIGN KEY (FoodNumber) REFERENCES Food_T(FoodNumber),
	CONSTRAINT FeedingPerformed_FK3 FOREIGN KEY (CStaffID) REFERENCES Staff_T(StaffID)
);

-- Create Maintenance Service Table
CREATE TABLE MaintenanceService_T (
	MaintenanceNumber CHAR(4) NOT NULL,
	MaintenanceDescription VARCHAR(255),
	CONSTRAINT MaintenanceService_PK PRIMARY KEY (MaintenanceNumber)
);

-- Create Maintenance Service Performed Table
CREATE TABLE MaintenancePerformed_T (
	EnclosureNumber CHAR(4) NOT NULL,
	MaintenanceNumber CHAR(4) NOT NULL,
	CStaffID CHAR(4) NOT NULL,
	MaintenanceDate DATE,
	MaintenanceNotes VARCHAR(255),
	CONSTRAINT MaintenancePerformed PRIMARY KEY (EnclosureNumber, MaintenanceNumber, CStaffID),
	CONSTRAINT MaintenancePerformed_FK1 FOREIGN KEY (MaintenanceNumber) REFERENCES MaintenanceService_T(MaintenanceNumber),
	CONSTRAINT MaintenancePerformed_FK2 FOREIGN KEY (EnclosureNumber) REFERENCES Enclosure_T(EnclosureNumber),
	CONSTRAINT MaintenancePerformed_FK3 FOREIGN KEY (CStaffID) REFERENCES Staff_T(StaffID)
);
    
-- Create Treatment Table
CREATE TABLE Treatment_T (
	TreatmentCode CHAR(4) NOT NULL,
	TreatmentDescription VARCHAR (255),
	CONSTRAINT Treatment_PK PRIMARY KEY (TreatmentCode)
);

-- Create Treatment Performed Table
CREATE TABLE TreatmentPerformed_T (
	VStaffID CHAR(4) NOT NULL,
	AnimalID CHAR(4) NOT NULL,
	TreatmentCode CHAR(4) NOT NULL,
	TreatmentDate DATE,
	TreatmentTime TIME,
	TreatmentResults VARCHAR(255),
	CONSTRAINT TreatmentPerformed_PK PRIMARY KEY (VStaffID, AnimalID, TreatmentCode, TreatmentDate, TreatmentTime),
	CONSTRAINT TreatmentPerformed_FK1 FOREIGN KEY (VStaffID) REFERENCES Staff_T(StaffID),
	CONSTRAINT TreatmentPerformed_FK2 FOREIGN KEY (AnimalID) REFERENCES Animal_T(AnimalID),
	CONSTRAINT TreatmentPerformed_FK3 FOREIGN KEY (TreatmentCode) REFERENCES Treatment_T(TreatmentCode)
);

-- Create Shipment Table
CREATE TABLE Shipment_T (
	AnimalID CHAR(4) NOT NULL,
	SupplierNumber CHAR(4) NOT NULL,
	ArrivalDate DATE,
	ArrivalNote VARCHAR(255),
	NumberOfAnimals INTEGER,
	CONSTRAINT Shipment_PK PRIMARY KEY (AnimalID, SupplierNumber, ArrivalDate),
	CONSTRAINT Shipment_FK1 FOREIGN KEY (AnimalID) REFERENCES Animal_T(AnimalID),
	CONSTRAINT Shipment_FK2 FOREIGN KEY (SupplierNumber) REFERENCES Supplier_T(SupplierNumber)
);

-- To View All Tables
SHOW TABLES;