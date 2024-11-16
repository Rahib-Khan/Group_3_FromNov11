SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [G10_3].[DimOrderDate]
AS
    SELECT OrderDate, MonthName, MonthNumber, UserAuthorizationKey, DateAdded, DateOfLastUpdate
    FROM [CH01-01-Dimension].[DimOrderDate] 
GO
