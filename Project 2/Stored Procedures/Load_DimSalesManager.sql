SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Tsering Wangyal Bista Lowa
-- Create date: 11/13/24
-- Description:	Populating the Sales Managers Table
-- =============================================

ALTER PROCEDURE [Project2].[Load_SalesManagers]
    @UserAuthorizationKey int

AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @DateAdded DATETIME2;
    SET @DateAdded = SYSDATETIME();

    DECLARE @DateOfLastUpdate DATETIME2;
    SET @DateOfLastUpdate = SYSDATETIME();

    DECLARE @StartingDateTime DATETIME2;
    SET @StartingDateTime = SYSDATETIME();


    INSERT INTO [CH01-01-Dimension].[SalesManagers]
        (SalesManager,
        Category,
        Office,
        UserAuthorizationKey,
        DateAdded,
        DateOfLastUpdate)

    SELECT
        DISTINCT OLD.[SalesManager],
        OLD.[ProductSubcategory],
        Office = CASE
					 WHEN OLD.SalesManager LIKE 'Marco%' THEN
						 'Redmond'
					 WHEN OLD.SalesManager LIKE 'Alberto%' THEN
						 'Seattle'
					 WHEN OLD.SalesManager LIKE 'Maurizio%' THEN
						 'Redmond'
					 ELSE
						 'Seattle'
				 END,
        @UserAuthorizationKey,
        @DateAdded,
        @DateOfLastUpdate
    FROM FileUpload.OriginallyLoadedData AS OLD



    DECLARE @EndingDateTime DATETIME2;
    set @EndingDateTime = SYSDATETIME()

    DECLARE @WorkFlowStepTableRowCount INT;
    SET @WorkFlowStepTableRowCount = (SELECT COUNT(*)
    FROM [CH01-01-Dimension].SalesManagers);

    ----New Table View----

    EXEC('
    DROP VIEW IF EXISTS G10_3.DimSalesManagers')
    EXEC('
    CREATE VIEW G10_3.DimSalesManagers AS
    SELECT 
    SalesManagerKey, 
    SalesManager, 
    Category, 
    Office, 
    UserAuthorizationKey, 
    DateAdded, 
    DateOfLastUpdate
    FROM [CH01-01-Dimension].[SalesManagers] ')

    ----New Table View----

    EXEC [Process].[usp_TrackWorkFlow]
        'Loads data into [CH01-01-Dimension].[SalesManagers]',
        @WorkFlowStepTableRowCount,
        @StartingDateTime,
        @EndingDateTime,
        @UserAuthorizationKey


    SELECT *
    FROM G10_3.DimSalesManagers
END
GO
