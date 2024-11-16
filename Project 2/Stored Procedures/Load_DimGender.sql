SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tsering Wangyal Bista Lowa
-- Create date: 11/13/24
-- Description:	Populating the Gender Table
-- =============================================
ALTER PROCEDURE [Project2].[Load_DimGender]
    @UserAuthorizationKey int
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    DECLARE @WorkFlowStepDescription nvarchar;
    DECLARE @DateAdded DATETIME2;
    SET @DateAdded = SYSDATETIME();

    DECLARE @DateOfLastUpdate DATETIME2;
    SET @DateOfLastUpdate = SYSDATETIME();

    DECLARE @StartingDateTime DATETIME2;
    SET @StartingDateTime = SYSDATETIME();

    INSERT INTO [CH01-01-Dimension].[DimGender]
        (
        Gender,
        GenderDescription,
        UserAuthorizationKey,
        DateAdded,
        DateOfLastUpdate)
    SELECT DISTINCT
        Gender,
        CASE Gender WHEN 'M' THEN 'Male' ELSE 'Female' END AS GenderDescription,
        @UserAuthorizationKey,
        @DateAdded,
        @DateOfLastUpdate
    FROM FileUpload.OriginallyLoadedData


    ---VIEW for NEW Table---
    EXEC('
    DROP VIEW IF EXISTS G10_3.DimGender')
    EXEC('
    CREATE VIEW G10_3.DimGender AS
    SELECT 
    Gender,
    GenderDescription,
    UserAuthorizationKey, 
    DateAdded, 
    DateOfLastUpdate
    FROM [CH01-01-Dimension].[DimGender] ')
    ---VIEW for NEW Table--


    DECLARE @EndingDateTime DATETIME2;
    set @EndingDateTime = SYSDATETIME()

    DECLARE @WorkFlowStepTableRowCount INT;
    SET @WorkFlowStepTableRowCount = (SELECT COUNT(*)
    FROM [CH01-01-Dimension].DimGender);

    EXEC [Process].[usp_TrackWorkFlow]
        'Loads data into [CH01-01-Dimension].[DimGender]',
        @WorkFlowStepTableRowCount,
        @StartingDateTime,
        @EndingDateTime,
        @UserAuthorizationKey

    EXEC('SELECT * FROM G10_3.DimGender')
END;
GO
