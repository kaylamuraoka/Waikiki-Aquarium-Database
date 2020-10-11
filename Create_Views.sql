-- This view will be useful for curators to look at to check the time interval between the last time each animal was fed. 
-- This view also filters out the feeding time for the day so that curators can check the feeding tracker daily and not have to filter 
-- throughout a variety of date and time entries.
CREATE VIEW TimeSinceLastFeedingPeriod_V AS
	SELECT 
		FeedingPerformed_T.AnimalID, 
        DATEDIFF(CURRENT_TIMESTAMP, FeedingPerformed_T.FeedingTime) AS TimeSinceLastFeedingPeriod,
		FeedingPerformed_T.CStaffID AS LastFedBy,
		FeedingPerformed_T.FeedingAmount, 
        FeedingPerformed_T.FoodNumber,
		Food_T.FoodDescription, 
        Enclosure_T.EnclosureNumber
	FROM 
		FeedingPerformed_T, 
        Food_T, 
        Enclosure_T
	WHERE 
		DAY(FeedingPerformed_T.FeedingDate) = DAY(CURRENT_TIMESTAMP);

-- Similarly to the above view, this view will be useful for curators as well. 
-- They will be able to filter the maintenance services performed within the current year and also see the time to date since the last service was performed.
CREATE VIEW TimeSinceLastMaintenanceService_V AS
	SELECT 
		MaintenancePerformed_T.EnclosureNumber, 
        DATEDIFF(CURRENT_TIMESTAMP, MaintenancePerformed_T.MaintenanceDate) AS TimeSinceLastMaintenanceService,
		MaintenancePerformed_T.CStaffID AS LastServicePerformedBy,
		MaintenanceDescription, MaintenanceNotes
	FROM 
		MaintenancePerformed_T, 
        MaintenanceService_T
	WHERE 
		YEAR(MaintenancePerformed_T.MaintenanceDate) = YEAR(CURRENT_TIMESTAMP);

-- This view will be helpful to curators to be able to see which animals are not on display in an exhibit. 
-- Animals may not be on display for two reasons – they have just arrived at the aquarium and they have not yet been assigned an exhibit yet, or they 
-- are diseased or sick are being treated in the quarantine enclosure by the veterinarians.        
CREATE VIEW AnimalsNotOnDisplay_V AS
	SELECT 
		AnimalID, 
		AnimalName
	FROM 
		Animal_T
	WHERE 
		ExhibitNumber IS NULL;

-- This view will be helpful to both curators and veterinarians to be able to easily see the number of animals located in each enclosure. 
-- This not only helps the curators assign animals to different enclosures ensuring that the enclosures are not overpopulated but it also helps
-- the veterinarians check how many animals are under their care to give everyone a clear picture of the aquariums health.
CREATE VIEW NumberOfAnimalsPerEnclosure_V AS
	SELECT 
		EnclosureNumber, 
        COUNT(EnclosureNumber) AS NumberOfAnimals
	FROM 
		Animal_T
	GROUP BY 
		EnclosureNumber;

-- To see all views   
SHOW FULL TABLES 
WHERE table_type = 'VIEW';
        