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

