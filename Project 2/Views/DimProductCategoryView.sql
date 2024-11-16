SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [G10_3].[DimProductCategory]
AS
    SELECT ProductCategoryKey, ProductCategory, UserAuthorizationKey, DateAdded, DateOfLastUpdate
    FROM [CH01-01-Dimension].[DimProductCategory] 
GO
