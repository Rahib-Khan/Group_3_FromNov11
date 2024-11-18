SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [G10_3].[FactData]
AS
    SELECT
        Saleskey,
        SalesManagerKey,
        OccupationKey,
        TerritoryKey,
        ProductKey,
        CustomerKey,
        ProductCategory,
        SalesManager,
        ProductSubcategory,
        ProductCode,
        ProductName,
        Color,
        ModelName,
        OrderQuantity,
        UnitPrice,
        ProductStandardCost,
        SalesAmount,
        OrderDate,
        [MonthName],
        MonthNumber,
        [Year],
        CustomerName,
        MaritalStatus,
        Gender,
        Education,
        Occupation,
        TerritoryRegion,
        TerritoryCountry,
        TerritoryGroup
    FROM [CH01-01-Fact].[Data] 
GO
