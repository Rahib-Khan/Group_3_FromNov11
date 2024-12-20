SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Rahib Khadaker>
-- Create date: <12/1/2024>
-- Description:	<Deletes all the data in each table>
-- =============================================
ALTER PROCEDURE [Project3].[TruncateData]
    @UserAuthorizationKey INT
AS
BEGIN

    SET NOCOUNT ON;
    TRUNCATE table Course.Class;
    TRUNCATE table Course.Course;
    TRUNCATE table Course.Mode_Of_Instruction;
    Truncate Table Course.CoursesClassMode;
    TRUNCATE table Department.Departments;
    TRUNCATE Table Department.Instructor;
    TRUNCATE Table Department.InstructorDepartment;
    TRUNCATE Table [LOCATION].BuildingLocation;
    TRUNCATE Table [Location].[RoomLocation];

    EXEC [Project3].[TrackWorkFlow] @UserAuthorizationKey = @UserAuthorizationKey, @WorkflowStepsDescription =  'Deletes all data in each table',
    @WorkflowStepsTableRowCount = @@ROWCOUNT;
END
GO
