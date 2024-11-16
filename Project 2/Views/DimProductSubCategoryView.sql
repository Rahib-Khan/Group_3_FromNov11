SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [G10_3].[DimProductSubCategory]
AS
    SELECT ProductSubCategoryKey, ProductCategoryKey, ProductSubcategory, UserAuthorizationKey, DateAdded, DateOfLastUpdate
    FROM [CH01-01-Dimension].[DimProductSubCategory] 
GO
