SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	<Rahib Khandaker>
-- Create date: <12/1/2024>
-- Description:	<Load All The Data And Relationships into Database>
-- =============================================
ALTER PROCEDURE [Project3].[LoadData] @UserAuthorizationKey INT
AS
BEGIN
    SET NOCOUNT ON;
	    DECLARE @StartingDateTime DATETIME2 = SYSDATETIME();

    --
    --	Drop All of the foreign keys prior to truncating tables
 	--
    EXEC  [Project3].[DropForeignKeysFromQueensClassSchedule] @UserAuthorizationKey = 1;
	--
	--	Check row count before truncation
	EXEC	[Project3].[ShowTableStatusRowCount] @UserAuthorizationKey = 5  -- Change -1 to the appropriate UserAuthorizationKey
    --
    --	Always truncate the data
    --
    EXEC  [Project3].[TruncateData] @UserAuthorizationKey = 1;
    --
    --	Load the schema
    --
    
    EXEC  [Project3].[Load_InstructorTable] @UserAuthorizationKey = 2;  -- Change -1 to the appropriate UserAuthorizationKey
	EXEC  [Project3].[Load_ModeOfInstruction] @UserAuthorizationKey = 2;  -- Change -1 to the appropriate UserAuthorizationKey
	EXEC  [Project3].[Load_CourseTable] @UserAuthorizationKey = 2;  -- Change -1 to the appropriate UserAuthorizationKey
	EXEC  [Project3].[Load_ClassTable] @UserAuthorizationKey = 3;  -- Change -1 to the appropriate UserAuthorizationKey
    EXEC  [Project3].[Load_CourseBridgeTable] @UserAuthorizationKey = 3;  -- Change -1 to the appropriate UserAuthorizationKey
	EXEC  [Project3].[Load_DepartmentTable] @UserAuthorizationKey = 3;  -- Change -1 to the appropriate UserAuthorizationKey
    EXEC  [Project3].[Load_DepartmentBridgeTable] @UserAuthorizationKey = 4;  -- Change -1 to the appropriate UserAuthorizationKey
	EXEC  [Project3].[Load_BuildingLocation] @UserAuthorizationKey = 4;  -- Change -1 to the appropriate UserAuthorizationKey
    EXEC [Project3].[Load_RoomLocationTable] @UserAuthorizationKey = 4;  -- Change -1 to the appropriate UserAuthorizationKey
  --
    --	Recreate all of the foreign keys prior after loading
    --
 	--
	--	Check row count before truncation
	  EXEC [Project3].[ShowTableStatusRowCount] @UserAuthorizationKey = 5  -- Change -1 to the appropriate UserAuthorizationKey
	--
    EXEC [Project3].[AddForeignKeysToQueensClassSchedule] @UserAuthorizationKey = 5;  -- Change -1 to the appropriate UserAuthorizationKey
    --


    EXEC [Project3].[TrackWorkFlow] @WorkFlowStepsDescription = 'Loading all the Data', @UserAuthorizationKey = 5, @WorkflowStepsTableRowCount = @@ROWCOUNT;
END;
GO
