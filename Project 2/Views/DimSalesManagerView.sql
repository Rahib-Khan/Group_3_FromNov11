SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

    ALTER VIEW [G10_3].[DimSalesManagers] AS
    SELECT 
    SalesManagerKey, 
    SalesManager, 
    Category, 
    Office, 
    UserAuthorizationKey, 
    DateAdded, 
    DateOfLastUpdate
    FROM [CH01-01-Dimension].[SalesManagers] 
GO
