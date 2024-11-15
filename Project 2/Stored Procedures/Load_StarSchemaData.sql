SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rahib Khandaker
-- Create date: 11/13/24
-- Description:	Loading In All Data to each table/Recreate Star Schema
-- =============================================
ALTER PROCEDURE [Project2].[LoadStarSchemaData]
AS
BEGIN
    SET NOCOUNT ON;
    declare @UserAuthorizationKey int = 1;
    DECLARE @StartingDateTime DATETIME2 = SYSDATETIME();

    --
    --	Drop All of the foreign keys prior to truncating tables in the star schema
    --
    EXEC  [Project2].[DropForeignKeysFromStarSchemaData] @UserAuthorizationKey = 1;
    --
    --	Check row count before truncation
    EXEC	[Project2].[ShowTableStatusRowCount]
		@UserAuthorizationKey = 1,  
		@TableStatus = N'''Pre-truncate of tables'''
    --
    --	Always truncate the Star Schema Data
    --
    EXEC  [Project2].[TruncateStarSchemaData] @UserAuthorizationKey = 3;
    --
    --	Load the star schema
    --
    EXEC  [Project2].[Load_DimProductCategory] @UserAuthorizationKey = 2;
    EXEC  [Project2].[Load_DimProductSubcategory] @UserAuthorizationKey = 2;
    EXEC  [Project2].[Load_DimProduct] @UserAuthorizationKey = 2;
    EXEC  [Project2].[Load_SalesManagers] @UserAuthorizationKey = 3;
    EXEC  [Project2].[Load_DimGender] @UserAuthorizationKey = 3;
    EXEC  [Project2].[Load_DimMaritalStatus] @UserAuthorizationKey = 4;
    EXEC  [Project2].[Load_DimOccupation] @UserAuthorizationKey = 4;
    EXEC  [Project2].[Load_DimOrderDate] @UserAuthorizationKey = 4;
    EXEC  [Project2].[Load_DimTerritory] @UserAuthorizationKey = 5;
    EXEC  [Project2].[Load_DimCustomer] @UserAuthorizationKey = 5;
    EXEC  [Project2].[Load_Data] @UserAuthorizationKey = 5;
    --
    --	Recreate all of the foreign keys prior after loading the star schema
    --
    --
    --	Check row count before truncation
    EXEC	[Project2].[ShowTableStatusRowCount]
		@UserAuthorizationKey = 6,  
		@TableStatus = N'''Row Count after loading the star schema'''
    --
    EXEC [Project2].[AddForeignKeysToStarSchemaData] @UserAuthorizationKey = 6;
    --

    DECLARE @WorkFlowStepTableRowCount INT;
    SET @WorkFlowStepTableRowCount = 0;
    DECLARE @EndingDateTime DATETIME2 = SYSDATETIME();
    EXEC [Process].[usp_TrackWorkFlow] 'Load Star Schema Data',
                                       @WorkFlowStepTableRowCount,
                                       @StartingDateTime,
                                       @EndingDateTime,
                                       @UserAuthorizationKey;
END;
GO
