SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

    ALTER VIEW [G10_3].[DimTerritory] AS
    SELECT TerritoryKey, TerritoryGroup, TerritoryCountry, TerritoryRegion, UserAuthorizationKey, DateAdded, DateOfLastUpdate
    FROM [CH01-01-Dimension].[DimTerritory] 
GO
