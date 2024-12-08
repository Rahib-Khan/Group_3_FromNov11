-- =================================================================================================================
-- Author:		<Heidi Luna>
-- Create date: <12/5/2024>
-- Description: Return all room locations and their corresponding building locations.
-- =================================================================================================================  

USE QueensClassSchedule;

SELECT 
    RoomLocation.RoomLocationName,
    BuildingLocation.BuildingLocationName,
    BuildingLocation.BuildingLocationAbv
FROM 
    Location.RoomLocation
JOIN 
    Location.BuildingLocation 
    ON RoomLocation.BuildingLocationID = BuildingLocation.BuildingLocationID;

