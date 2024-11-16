SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [G10_3].[DimProduct]
AS
    SELECT
        ProductKey,
        ProductSubcategoryKey,
        ProductCategory,
        ProductSubcategory,
        ProductCode,
        ProductName,
        Color,
        ModelName,
        UserAuthorizationKey,
        DateAdded,
        DateOfLastUpdate
    FROM [CH01-01-Dimension].[DimProduct] 
GO
